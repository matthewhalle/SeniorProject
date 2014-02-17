using System;
using System.Data;

using  OnTaskLibrary.Data;

namespace OnTaskLibrary.Accounts
{
    public class Accounts : OnTaskLibrary.ObjectBase
    {
        public Accounts() { }
        public Accounts(string connectionString) : base(connectionString) { }


        //Example
        public DataTable GetApplicationID(string applicationname)
        {
            SqlParameterList paramList = new SqlParameterList();
            paramList.Add("@ApplicationName", applicationname);

            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            DataTable data = sqlClient.FillDataTable("Application_ID_Select", CommandType.StoredProcedure, true, paramList);

            return data;
        }


        public DataTable GetRoles(string appName)
        {
            SqlParameterList paramList = new SqlParameterList();
            paramList.Add("@ApplicationName", appName);

            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            DataTable data = sqlClient.FillDataTable("Roles_GetRoles", CommandType.StoredProcedure, true, paramList);

            return data;
        }

        public DataTable GetCommissionPlans(int? rateId)
        {
            SqlParameterList paramList = new SqlParameterList();
            paramList.Add("@CommissionRateID", rateId);

            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            DataTable data = sqlClient.FillDataTable("CommissionPlan_Select", CommandType.StoredProcedure, true, paramList);

            return data;
        }

        public DataTable GetProviders(int? providerId)
        {
            SqlParameterList paramList = new SqlParameterList();
            paramList.Add("@ProviderID", providerId);

            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            DataTable data = sqlClient.FillDataTable("Provider_Select", CommandType.StoredProcedure, true, paramList);

            return data;
        }

        public void User_Insert(string userid, string lastname, string firstname, DateTime? dateofbirth, DateTime? hiredate, DateTime? licenseexpiration, string officephone, string mobilephone, string faxnumber,  string address1, string address2, string city, string state, string zip, int? providerid, string alm_code, int? commissionrateid, string mls_id, int? employmentstatusid, string modifiedbyuser)
        {
            SqlParameterList paramList = new SqlParameterList();
            paramList.Add("@UserId", userid);
            paramList.Add("@LastName", lastname);
            paramList.Add("@FirstName", firstname);
            paramList.Add("@DateOfBirth", dateofbirth);
            paramList.Add("@HireDate", hiredate);
            paramList.Add("@LicenseExpiration", licenseexpiration);
            paramList.Add("@OfficePhone", officephone);
            paramList.Add("@MobilePhone", mobilephone);
            paramList.Add("@FaxNumber", faxnumber);
            paramList.Add("@Address1", address1);
            paramList.Add("@Address2", address2);
            paramList.Add("@City", city);
            paramList.Add("@State", state);
            paramList.Add("@Zip", zip);
            paramList.Add("@ProviderID", providerid);
            paramList.Add("@ALM_Code", alm_code);
            paramList.Add("@CommissionRateID", commissionrateid);
            paramList.Add("@MLS_ID", mls_id);
            paramList.Add("@EmploymentStatusID", employmentstatusid);
            paramList.Add("@ModifiedByUser", modifiedbyuser);

            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            sqlClient.ExecuteNonQuery("Users_Extended_Insert", CommandType.StoredProcedure, true, paramList);


        }

        public void User_Update(string userid, string lastname, string firstname, DateTime? dateofbirth, DateTime? hiredate, DateTime? licenseexpiration, string officephone, string mobilephone, string faxnumber, string address1, string address2, string city, string state, string zip, int? providerid, string alm_code, int? commissionrateid, string mls_id, int? employmentstatusid, string modifiedbyuser)
        {
            SqlParameterList paramList = new SqlParameterList();
            paramList.Add("@UserId", userid);
            paramList.Add("@LastName", lastname);
            paramList.Add("@FirstName", firstname);
            paramList.Add("@DateOfBirth", dateofbirth);
            paramList.Add("@HireDate", hiredate);
            paramList.Add("@LicenseExpiration", licenseexpiration);
            paramList.Add("@OfficePhone", officephone);
            paramList.Add("@MobilePhone", mobilephone);
            paramList.Add("@FaxNumber", faxnumber);
            paramList.Add("@Address1", address1);
            paramList.Add("@Address2", address2);
            paramList.Add("@City", city);
            paramList.Add("@State", state);
            paramList.Add("@Zip", zip);
            paramList.Add("@ProviderID", providerid);
            paramList.Add("@ALM_Code", alm_code);
            paramList.Add("@CommissionRateID", commissionrateid);
            paramList.Add("@MLS_ID", mls_id);
            paramList.Add("@EmploymentStatusID", employmentstatusid);
            paramList.Add("@ModifiedByUser", modifiedbyuser);

            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            sqlClient.ExecuteNonQuery("Users_Extended_Insert", CommandType.StoredProcedure, true, paramList);


        }

        public DataTable GetUser(string userId)
        {
            SqlParameterList paramList = new SqlParameterList();
            paramList.Add("@UserId", userId);

            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            DataTable data = sqlClient.FillDataTable("Users_Extended_SELECT", CommandType.StoredProcedure, true, paramList);

            return data;
        }




        public void AddUserToRole(string appName, string userid, string roleName, DateTime now)
        {
            SqlParameterList paramList = new SqlParameterList();
            paramList.Add("@ApplicationName", appName);
            paramList.Add("@UserNames", userid);
            paramList.Add("@RoleNames", roleName);
            paramList.Add("@CurrentTimeUtc", now);


            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            sqlClient.ExecuteNonQuery("aspnet_UsersInRoles_AddUsersToRoles", CommandType.StoredProcedure, true, paramList);
        }

        public void DeleteFromRole(string userid)
        {
            SqlParameterList paramList = new SqlParameterList();
            paramList.Add("@UserId", userid);
         
            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            sqlClient.ExecuteNonQuery("DELETE_FROM_ROLES", CommandType.StoredProcedure, true, paramList);
        }

        public void UpdateEmail(string userid, string email)
        {
            SqlParameterList paramList = new SqlParameterList();
            paramList.Add("@UserId", userid);
            paramList.Add("@Email", email);

            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            sqlClient.ExecuteNonQuery("Email_Update", CommandType.StoredProcedure, true, paramList);
        }

        public DataTable GetAgents()
        { 
            DataTable oDT = GetAgents(null);
            return oDT;
        }

        public DataTable GetAgents(string userId)
        {
            SqlParameterList paramList = new SqlParameterList();
            paramList.Add("@UserId", userId);

            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            DataTable data = sqlClient.FillDataTable("Agent_Select", CommandType.StoredProcedure, true, paramList);

            return data;
        }

        public DataTable GetContractTypes()
        {
            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            DataTable data = sqlClient.FillDataTable("ContractType_select", CommandType.StoredProcedure);

            return data;
        }

        public DataTable GetContractStatus()
        {
            SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
            DataTable data = sqlClient.FillDataTable("ContractStatus_select", CommandType.StoredProcedure);

            return data;
        }
    }
}
