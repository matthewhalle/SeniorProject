using System;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Collections.Generic;

namespace OnTaskLibrary.Data
{
    public class SqlClient
    {
        #region Member Variables
        private string _szConnectionString = null;
        private SqlConnection _cnConnection = null;
        private SqlTransaction _trTransaction = null;
        #endregion

        #region Constructor
        public SqlClient(string connectionString) : this(connectionString, false) { }
        public SqlClient(string connectionString, bool immediateOpen)
        {
            _szConnectionString = connectionString;

            if (immediateOpen)
                this.Open();
        }

        public SqlClient(SqlConnection sqlConnection) : this(sqlConnection, false) { }
        public SqlClient(SqlConnection sqlConnection, bool immediateOpen)
        {
            _cnConnection = sqlConnection;
            _szConnectionString = sqlConnection.ConnectionString;

            if (immediateOpen)
                this.Open();
        }
        #endregion

        #region Destructor
        ~SqlClient()
        {
            this.Close();

            if (_trTransaction != null)
                _trTransaction.Dispose();

            if (_cnConnection != null)
                _cnConnection.Dispose();

            _trTransaction = null;
            _cnConnection = null;
        }
        #endregion

        #region Public Methods
        #region Open
        public void Open()
        {
            if (_cnConnection == null)
                _cnConnection = new SqlConnection(_szConnectionString);

            if (_cnConnection != null && _cnConnection.State == ConnectionState.Closed)
                _cnConnection.Open();
        }
        #endregion

        #region Close
        public void Close()
        {
            if (_cnConnection != null && _cnConnection.State != ConnectionState.Closed)
            {
                if (this.InTransaction)
                    this.RollbackTransaction();

                _cnConnection.Close();
            }
        }
        #endregion

        #region FillDataSet
        public DataSet FillDataSet(string commandText)
        {
            return this.FillDataSet(commandText, CommandType.Text, true, null);
        }

        public DataSet FillDataSet(string commandText, CommandType commandType)
        {
            return this.FillDataSet(commandText, commandType, true, null);
        }

        public DataSet FillDataSet(string commandText, CommandType commandType, bool closeOnComplete)
        {
            return this.FillDataSet(commandText, commandType, closeOnComplete, null);
        }

        public DataSet FillDataSet(string commandText, CommandType commandType, SqlParameterList sqlParameters)
        {
            return this.FillDataSet(commandText, commandType, true, sqlParameters);
        }

        public DataSet FillDataSet(string commandText, CommandType commandType, bool closeOnComplete, SqlParameterList sqlParameters)
        {
            SqlCommand sqlCommand = this.BuildSqlCommand(commandText, commandType, sqlParameters);
            sqlCommand.CommandTimeout = 120;

            DataSet dataSet = new DataSet();
            Exception exError = null;

            try
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand);
                dataAdapter.Fill(dataSet);
            }
            catch (Exception ex)
            {
                exError = ex;
            }

            if (closeOnComplete || exError != null)
                this.Close();

            if (exError != null)
                throw exError;

            return dataSet;
        }
        #endregion

        #region FillDataTable
        public DataTable FillDataTable(string commandText)
        {
            return this.FillDataTable(commandText, CommandType.Text, true, null);
        }

        public DataTable FillDataTable(string commandText, CommandType commandType)
        {
            return this.FillDataTable(commandText, commandType, true, null);
        }

        public DataTable FillDataTable(string commandText, CommandType commandType, SqlParameterList sqlParameters)
        {
            return this.FillDataTable(commandText, commandType, true, sqlParameters);
        }

        public DataTable FillDataTable(string commandText, CommandType commandType, bool closeOnComplete, SqlParameterList sqlParameters)
        {
            DataSet dataSet = this.FillDataSet(commandText, commandType, closeOnComplete, sqlParameters);
            DataTable dataTable = null;

            if (dataSet != null && dataSet.Tables.Count > 0)
                dataTable = dataSet.Tables[0];

            return dataTable;
        }
        #endregion

        #region ExecuteScalar
        public object ExecuteScalar(string commandText)
        {
            return this.ExecuteScalar(commandText, CommandType.Text, true, null);
        }

        public object ExecuteScalar(string commandText, CommandType commandType)
        {
            return this.ExecuteScalar(commandText, commandType, true, null);
        }

        public object ExecuteScalar(string commandText, CommandType commandType, bool closeOnComplete)
        {
            return this.ExecuteScalar(commandText, commandType, closeOnComplete, null);
        }

        public object ExecuteScalar(string commandText, CommandType commandType, SqlParameterList sqlParameters)
        {
            return this.ExecuteScalar(commandText, commandType, sqlParameters);
        }

        public object ExecuteScalar(string commandText, CommandType commandType, bool closeOnComplete, SqlParameterList sqlParameters)
        {
            SqlCommand sqlCommand = this.BuildSqlCommand(commandText, commandType, sqlParameters);
            object oObject = null;
            Exception exError = null;

            try
            {
                oObject = sqlCommand.ExecuteScalar();
            }
            catch (Exception ex)
            {
                exError = ex;
            }

            if (closeOnComplete || exError != null)
                this.Close();

            if (exError != null)
                throw exError;

            return oObject;
        }
        #endregion

        #region ExecuteNonQuery
        public int ExecuteNonQuery(string commandText)
        {
            return this.ExecuteNonQuery(commandText, CommandType.Text, true, null);
        }

        public int ExecuteNonQuery(string commandText, CommandType commandType)
        {
            return this.ExecuteNonQuery(commandText, commandType, true, null);
        }

        public int ExecuteNonQuery(string commandText, CommandType commandType, bool closeOnComplete)
        {
            return this.ExecuteNonQuery(commandText, commandType, closeOnComplete, null);
        }

        public int ExecuteNonQuery(string commandText, CommandType commandType, SqlParameterList sqlParameters)
        {
            return this.ExecuteNonQuery(commandText, commandType, true, sqlParameters);
        }

        public int ExecuteNonQuery(string commandText, CommandType commandType, bool closeOnComplete, SqlParameterList sqlParameters)
        {
            SqlCommand sqlCommand = this.BuildSqlCommand(commandText, commandType, sqlParameters);
            int iRows = -1;
            Exception exError = null;

            try
            {
                iRows = sqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                exError = ex;
            }

            if (closeOnComplete || exError != null)
                this.Close();

            if (exError != null)
                throw exError;

            return iRows;
        }
        #endregion

        #region ExecuteXmlReader
        public XmlReader ExecuteXmlReader(string commandText)
        {
            return this.ExecuteXmlReader(commandText, CommandType.Text, true, null);
        }

        public XmlReader ExecuteXmlReader(string commandText, CommandType commandType)
        {
            return this.ExecuteXmlReader(commandText, commandType, true, null);
        }

        public XmlReader ExecuteXmlReader(string commandText, CommandType commandType, bool closeOnComplete)
        {
            return this.ExecuteXmlReader(commandText, commandType, closeOnComplete, null);
        }

        public XmlReader ExecuteXmlReader(string commandText, CommandType commandType, SqlParameterList sqlParameters)
        {
            return this.ExecuteXmlReader(commandText, commandType, true, sqlParameters);
        }

        public XmlReader ExecuteXmlReader(string commandText, CommandType commandType, bool closeOnComplete, SqlParameterList sqlParameters)
        {
            SqlCommand sqlCommand = this.BuildSqlCommand(commandText, commandType, sqlParameters);
            XmlReader xmlReader = null;
            Exception exError = null;

            try
            {
                xmlReader = sqlCommand.ExecuteXmlReader();
            }
            catch (Exception ex)
            {
                exError = ex;
            }

            if (closeOnComplete || exError != null)
                this.Close();

            if (exError != null)
                throw exError;

            return xmlReader;
        }
        #endregion

        #region BeginTransaction
        public void BeginTransaction()
        {
            if (_cnConnection != null && _cnConnection.State != ConnectionState.Closed && !this.InTransaction)
                _trTransaction = _cnConnection.BeginTransaction();
        }
        #endregion

       

        #region RollbackTransaction
        public void RollbackTransaction()
        {
            if (_cnConnection != null && _cnConnection.State != ConnectionState.Closed && this.InTransaction)
                _trTransaction.Rollback();

            _trTransaction = null;
        }
        #endregion
        #endregion

        #region Private Methods
        #region BuildSqlCommand
        private SqlCommand BuildSqlCommand(string commandText, CommandType commandType)
        {
            return this.BuildSqlCommand(commandText, commandType, null);
        }

        private SqlCommand BuildSqlCommand(string commandText, CommandType commandType, SqlParameterList sqlParameters)
        {
            SqlCommand sqlCommand = new SqlCommand(commandText, _cnConnection);
            sqlCommand.CommandType = commandType;
            sqlCommand.Transaction = (this.InTransaction) ? _trTransaction : null;

            if (sqlParameters != null && sqlParameters.Count > 0)
            {
                foreach (KeyValuePair<string, SqlParameter> keyValuePair in sqlParameters)
                {
                    if (keyValuePair.Value.Value == null) keyValuePair.Value.Value = DBNull.Value;

                    sqlCommand.Parameters.Add(keyValuePair.Value);
                }
            }

            return sqlCommand;
        }
        #endregion
        #endregion

        #region Properties
        public bool InTransaction
        {
            get { return (_trTransaction != null); }
        }

        public ConnectionState State
        {
            get { return ((_cnConnection != null) ? _cnConnection.State : ConnectionState.Closed); }
        }
        #endregion
    }
}