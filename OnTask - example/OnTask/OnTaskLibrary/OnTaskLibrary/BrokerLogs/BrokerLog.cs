using System;
using System.Data;

using OnTaskLibrary.Data;


namespace OnTaskLibrary.BrokerLogs
{
    public class BrokerLogs : OnTaskLibrary.ObjectBase
    {
         public BrokerLogs() { }

         public BrokerLogs(string connectionString) : base(connectionString) 
         {
         }

         public DataTable GetBrokerLog()
         {
             DataTable oDT = GetBrokerLog(null);
             return oDT;
         }

         public DataTable GetBrokerLog(string fileNum)
         {
             SqlParameterList paramList = new SqlParameterList();
             paramList.Add("@FileNum", fileNum);
             SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
             DataTable data = sqlClient.FillDataTable("BrokerLog_Select", CommandType.StoredProcedure, true, paramList);

             return data;
         }

         public void UpdateBrokerLog(string filenum, int? contracttype, DateTime? contractreceivedate, DateTime? contractexpirationdate, string propertaddres1, string propertaddres2, string propertcity, string propertstate,string propertzip, decimal? originalprice, decimal? currentprice, decimal? closingprice, string seller, Guid sellerid, string agent, Guid agentid, int? statusid,DateTime?  statusdate, DateTime? estimatedescrodate, DateTime? actualescrodate,decimal? commission)
         {
             SqlParameterList paramList = new SqlParameterList();
             paramList.Add("@FileNum", filenum);
             paramList.Add("@ContractType", contracttype);
             paramList.Add("@ContractReceiveDate", contractreceivedate);
             paramList.Add("@ContractExpirationDate", contractexpirationdate);
             paramList.Add("@PropertAddres1", propertaddres1);
             paramList.Add("@PropertAddres2", propertaddres2);
             paramList.Add("@PropertCity", propertcity);
             paramList.Add("@PropertState", propertstate);
             paramList.Add("@PropertZip", propertzip);
             paramList.Add("@Originalprice", originalprice);
             paramList.Add("@CurrentPrice", currentprice);
             paramList.Add("@Closingprice", closingprice);
             paramList.Add("@Seller", seller);
             paramList.Add("@SellerId", sellerid);
             paramList.Add("@agent", agent);
             paramList.Add("@agentId", agentid);
             paramList.Add("@StatusId", statusid);
             paramList.Add("@StatusDate", statusdate);
             paramList.Add("@EstimatedEscroDate", estimatedescrodate);
             paramList.Add("@ActualEscroDate", actualescrodate);
             paramList.Add("@commission", commission);

             SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
             sqlClient.ExecuteNonQuery("BrokerLog_Update", CommandType.StoredProcedure, true, paramList);

         }


         public void NewBrokerLog(string filenum, int? contracttype, DateTime? contractreceivedate, DateTime? contractexpirationdate, string propertaddres1, string propertaddres2, string propertcity, string propertstate, string propertzip, decimal? originalprice, decimal? currentprice, decimal? closingprice, string seller, Guid sellerid, string agent, Guid agentid, int? statusid, DateTime? statusdate, DateTime? estimatedescrodate, DateTime? actualescrodate, decimal? commission)
         {
             SqlParameterList paramList = new SqlParameterList();
             paramList.Add("@FileNum", filenum);
             paramList.Add("@ContractType", contracttype);
             paramList.Add("@ContractReceiveDate", contractreceivedate);
             paramList.Add("@ContractExpirationDate", contractexpirationdate);
             paramList.Add("@PropertAddres1", propertaddres1);
             paramList.Add("@PropertAddres2", propertaddres2);
             paramList.Add("@PropertCity", propertcity);
             paramList.Add("@PropertState", propertstate);
             paramList.Add("@PropertZip", propertzip);
             paramList.Add("@Originalprice", originalprice);
             paramList.Add("@CurrentPrice", currentprice);
             paramList.Add("@Closingprice", closingprice);
             paramList.Add("@Seller", seller);
             paramList.Add("@SellerId", sellerid);
             paramList.Add("@agent", agent);
             paramList.Add("@agentId", agentid);
             paramList.Add("@StatusId", statusid);
             paramList.Add("@StatusDate", statusdate);
             paramList.Add("@EstimatedEscroDate", estimatedescrodate);
             paramList.Add("@ActualEscroDate", actualescrodate);
             paramList.Add("@commission", commission);

             SqlClient sqlClient = new SqlClient(this.ConnectionString, true);
             sqlClient.ExecuteNonQuery("BrokerLog_Insert", CommandType.StoredProcedure, true, paramList);

         }
    }
}
