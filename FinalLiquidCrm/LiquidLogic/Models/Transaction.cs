using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Models
{
    public class Transaction
    {
        public string Recordid { get; set; }
        public string TranRef { get; set; }
        public string Amount { get; set; }
        public string RecordDate { get; set; }
        public string Narration { get; set; }
        public string CustomerEmail { get; set; }
        public string Status { get; set; }
    }
}
