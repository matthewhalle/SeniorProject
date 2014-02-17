using System;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;

namespace OnTaskLibrary.Data
{
    public class SqlParameterList : Dictionary<string, SqlParameter>
    {
        public void Add(string paramName, object value)
        {
            this.Add(paramName, new SqlParameter(paramName, value));
        }

        public new void Add(string paramName, SqlParameter sqlParam)
        {
            base.Add(paramName, sqlParam);
        }
    }
}
