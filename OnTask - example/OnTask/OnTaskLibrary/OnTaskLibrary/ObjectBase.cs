using System;
using System.Data;

using OnTaskLibrary.Data;

namespace OnTaskLibrary
{
    public class ObjectBase
    {
        public ObjectBase() { }
        public ObjectBase(string connectionString)
        {
            this.ConnectionString = connectionString;
        }

        public string ConnectionString { get; set; }
    }

}


