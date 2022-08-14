using LiquidLogic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Logic
{
    public class RentalProcessor
    {
        DatabaseHandler dh = new DatabaseHandler();
        LandLord landlord;
        DataTable table;
        EmailProcessor sendEmail = new EmailProcessor();

        public GenericResponse GetLandlords() 
        {
            GenericResponse response = new GenericResponse();
            try
            {
                table = dh.GetLandLords();
                if (table.Rows.Count>0)
                {
                    List<object> landLords = new List<object>();
                    foreach (DataRow dr in table.Rows)
                    {
                        LandLord landLord = new LandLord();
                        landLord.id = dr["RecordId"].ToString();
                        landLord.name = dr["Name"].ToString();
                        landLord.email = dr["Email"].ToString();
                        landLord.tel = dr["telcontact"].ToString();
                        landLord.creationdate = dr["CreationDate"].ToString();
                        landLord.active = bool.Parse(dr["Active"].ToString());
                        landLords.Add(landLord);
                    }
                    response.IsSuccessfull = true;
                    response.Message = "Successfull";
                    response.list = landLords;
                }
                else
                {
                    response.IsSuccessfull = false;
                    response.Message = "NO LANDLORDS FOUND";
                }
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public GenericResponse AddLandLord(LandLord landLord) 
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.AddLandlord(landLord.name, landLord.email, landLord.tel);
                response.IsSuccessfull = true;
                response.Message = "LandLord Added Successfully";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }
    }
}
