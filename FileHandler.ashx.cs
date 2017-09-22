using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace educationportal.com
{
    /// <summary>
    /// Summary description for FileHandler
    /// </summary>
    public class FileHandler : IHttpHandler
    {

        //const string conString=@"Data Source = (local); Integrated Security=True; Initial Catalog=userinfo;user instance = true";
        //const string conString = @"Server = (local); Integrated Security = True; AttachDbFileName = \DataDirectory\userinfo.mdf;User Instance = True";
        //const string conString=@"Data Source=(local);Initial Catalog=userinfo;Integrated Security=True";
        const string conString=@"Data Source=(local);Initial Catalog=educationportal;Integrated Security=True";

            public void ProcessRequest(HttpContext context)
            {
                context.Response.Buffer = false;

            
                context.Response.ContentType = "application/pdf";

                SqlConnection con = new SqlConnection(conString);
                //SqlCommand cmd = new SqlCommand("SELECT FileBytes FROM Fileo WHERE Id = @Id", con);

                SqlCommand cmd = new SqlCommand("UPDATE Fileo SET total_downloads += 1 WHERE Id = @Id(SELECT FileBytes FROM Fileo WHERE Id = @Id)", con);
                
                cmd.Parameters.AddWithValue("@Id", context.Request["Id"]);
                using (con)
                {
                    con.Open();


                    SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SequentialAccess);

                    if (reader.Read())
                    {
                        int bufferSize = 18040;
                        byte[] chunk = new byte[bufferSize];
                        long retCount;
                        long startIndex = 0;

                        retCount = reader.GetBytes(0, startIndex, chunk, 0, bufferSize);
                        while (retCount == bufferSize)
                        {
                            context.Response.BinaryWrite(chunk);

                            startIndex += bufferSize;

                            retCount = reader.GetBytes(0, startIndex, chunk, 0, bufferSize);


                        }



                        byte[] actualChunk = new Byte[retCount - 1];


                        Buffer.BlockCopy(chunk, 0, actualChunk, 0, (int)retCount - 1);
                        context.Response.BinaryWrite(actualChunk);

                    }

                }

            }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}