using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Models
{
    public class ComplaintCategories : GenericResponse
    {
        public List<ComplaintCategory> complaintCategories { get; set; }
    }
}
