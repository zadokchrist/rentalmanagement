using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Models
{
    public class AuditReports : GenericResponse
    {
        public List<AuditReport> auditReports { get; set; }
    }
}
