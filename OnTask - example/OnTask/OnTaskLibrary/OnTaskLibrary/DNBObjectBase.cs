using System;
using System.Data;

using OnTaskLibrary.Data;

namespace OnTaskLibrary
{
    public class DNBObjectBase : ObjectBase
    {
        public DNBObjectBase() : base() { }

        public DNBObjectBase(string connectionString) : base(connectionString) { }

        public DNBObjectBase(string connectionString, string dnbConnectionString)
            : base(connectionString)
        {
            this.DNBConnectionString = dnbConnectionString;
        }

        public string DNBConnectionString { get; set; }
    }
}
