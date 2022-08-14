using LiquidLogic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Logic
{
    public class JobCardProcessor
    {
        JobCard jobCard;
        DatabaseHandler dh = new DatabaseHandler();
        DataTable dataTable;

        public JobCardProcessor(JobCard jobCard) 
        {
            this.jobCard = jobCard;
        }

        public JobCardProcessor() 
        {
        }

        public JobCardResponse AddRequiredMaterials() 
        {
            JobCardResponse resp = new JobCardResponse();
            try
            {
                dataTable = dh.AddRequiredMaterials(jobCard.MaterialType,jobCard.Size,jobCard.Qty,jobCard.TicketId);
                if (dataTable.Rows.Count>0)
                {
                    List<JobCard> jobCards = new List<JobCard>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        JobCard jobCard = new JobCard();
                        jobCard.MaterialId = dr["RecordId"].ToString();
                        jobCard.MaterialType = dr["MaterialType"].ToString();
                        jobCard.Size = dr["Size"].ToString();
                        jobCard.Qty = dr["Quantity"].ToString();
                        jobCards.Add(jobCard);
                    }
                    resp.IsSuccessfull = true;
                    resp.Message = "SUCCESSFUL";
                    resp.jobCards = jobCards;
                }
                else
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "NO MATERIALS ADDED";
                }
            }
            catch (Exception ex)
            {
                resp.IsSuccessfull = false;
                resp.Message = ex.Message;
            }
            return resp;
        }

        public JobCardResponse AddJobCard() 
        {
            JobCardResponse response = new JobCardResponse();
            try
            {
                dh.CreateJobCard(jobCard.TicketId,jobCard.JobType,jobCard.OppArea,jobCard.Branch,jobCard.Territory,jobCard.SubTerritory,jobCard.AssetCategory,
                    jobCard.AssetDescription,jobCard.AssetLocation,jobCard.AssetReference,jobCard.JobCategory,jobCard.Address,
                    jobCard.AssetType,jobCard.Ycordinates,jobCard.Xcordinates,jobCard.BlockMapRef);
                response.IsSuccessfull = true;
                response.Message = "JOB CARD CREATED SUCCESSFULLY";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public JobCardResponse GetJobCards() 
        {
            JobCardResponse response = new JobCardResponse();
            try
            {
                dataTable = dh.GetJobCards();
                if (dataTable.Rows.Count>0)
                {
                    List<JobCard> jobCards = new List<JobCard>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        JobCard jobCard = new JobCard();
                        jobCard.TicketId = dr["TicketId"].ToString();
                        jobCard.JobCardNo = dr["JobCardNo"].ToString();
                        jobCard.JobType = dr["JobType"].ToString();
                        jobCard.OppArea = dr["OppArea"].ToString();
                        jobCard.Branch = dr["Branch"].ToString();
                        jobCard.Territory = dr["Territory"].ToString();
                        jobCard.SubTerritory = dr["SubTerritory"].ToString();
                        jobCard.AssetCategory = dr["AssetCategory"].ToString();
                        jobCard.AssetDescription = dr["AssetDescription"].ToString();
                        jobCard.AssetLocation = dr["AssetLocation"].ToString();
                        jobCard.AssetReference = dr["AssetReference"].ToString();
                        jobCard.JobCategory = dr["JobCategory"].ToString();
                        jobCard.Address = dr["Address"].ToString();
                        jobCard.AssetType = dr["AssetType"].ToString();
                        jobCard.Ycordinates = dr["Ycordinates"].ToString();
                        jobCard.Xcordinates = dr["Xcordinates"].ToString();
                        jobCard.BlockMapRef = dr["BlockMapRef"].ToString();
                        jobCard.Branch = dr["Branch"].ToString();
                        jobCard.Status = dr["Status"].ToString();
                        jobCard.RecordDate = dr["RecordDate"].ToString();
                        jobCards.Add(jobCard);
                    }
                    response.IsSuccessfull = true;
                    response.Message = "SUCCESSFULL";
                    response.jobCards = jobCards;
                }
                else
                {
                    response.IsSuccessfull = false;
                    response.Message = "NO JOBCARD AVAILABLE";
                }
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
