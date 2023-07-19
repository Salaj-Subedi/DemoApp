using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoApp
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {

            //var connectionString = ConfigurationManager.ConnectionStrings["WEBFORMS"].ConnectionString;
            //var insertStatement = "Insert into Messages (Name , Message) values (@Name , @Message)";
            //using (var sqlConnection = new SqlConnection(connectionString))
            //{
            //    sqlConnection.Open();
            //    using (var sqlCommand = new SqlCommand(insertStatement, sqlConnection))
            //    {
            //        sqlCommand.Parameters.AddWithValue("Name", cfMessage.Name);
            //        sqlCommand.Parameters.AddWithValue("Message", cfMessage.Message);
            //        sqlCommand.ExecuteNonQuery();
            //    }
            //    sqlConnection.Close();
            //}
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            lvMessages.DataBind();
        }
    }
}