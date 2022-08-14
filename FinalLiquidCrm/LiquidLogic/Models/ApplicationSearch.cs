using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Models
{
    public class ApplicationSearch:GenericResponse
    {
        public List<Application> Applications { get; set; }
    }
}
