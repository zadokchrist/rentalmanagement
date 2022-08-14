using LiquidLogic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Logic
{
    public class PaymentProcessor
    {
        DatabaseHandler dh = new DatabaseHandler();
        Transaction trans;
        public PaymentProcessor(Transaction transaction)
        {
            trans = transaction;
        }

        public GenericResponse RecordTransactions()
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.InsertCustomerTrans(trans.TranRef, trans.Amount, trans.Narration, trans.CustomerEmail, trans.Status);
                response.IsSuccessfull = true;
                response.Message = "SUCCESS";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public TranSearch GetCustomerTransactionsByEmail()
        {
            TranSearch tranSearch = new TranSearch();
            try
            {
                DataTable transactions = dh.GetCustomerTransactionsByEmail(trans.CustomerEmail);
                if (transactions.Rows.Count > 0)
                {
                    List<Transaction> transactions1 = new List<Transaction>();
                    foreach (DataRow dr in transactions.Rows)
                    {
                        Transaction transaction = new Transaction();
                        transaction.Amount = dr["Amount"].ToString();
                        transaction.CustomerEmail = dr["CustomerEmail"].ToString();
                        transaction.Narration = dr["Narration"].ToString();
                        transaction.RecordDate = dr["RecordDate"].ToString();
                        transaction.Recordid = dr["Recordid"].ToString();
                        transaction.Status = dr["Status"].ToString();
                        transaction.TranRef = dr["TranRef"].ToString();
                        transactions1.Add(transaction);
                    }
                    tranSearch.IsSuccessfull = true;
                    tranSearch.Message = "SUCCESS";
                    tranSearch.transactions = transactions1;
                }
                else
                {
                    tranSearch.IsSuccessfull = true;
                    tranSearch.Message = "NO TRANSACTIONS FOUND";
                }
            }
            catch (Exception ex)
            {
                tranSearch.IsSuccessfull = false;
                tranSearch.Message = ex.Message;
            }
            return tranSearch;
        }
    }
}
