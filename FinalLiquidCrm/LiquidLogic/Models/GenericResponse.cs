using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Models
{
    public class GenericResponse
    {
        public bool IsSuccessfull { get; set; }
        public string Message { get; set; }
        public List<Object> list { get; set; }
    }
}
