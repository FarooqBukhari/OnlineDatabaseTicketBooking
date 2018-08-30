using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DB_Project.DAL
{
    public class myDAL
    {
        private static readonly string connString =
            System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;

        //userType: 1 for host -- 0 for guest

        public int create_signup_DAL(string username, string fname, string lname, string email, string password, int userType , int age , long phone , char Gender, char CardProvided , char CardType , long CardNo , int expMonth , int expDate )
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                int output = 1;
                if (userType == 0)
                {
                    cmd = new SqlCommand("signup", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@username", SqlDbType.VarChar, 20);
                    cmd.Parameters.Add("@fname", SqlDbType.VarChar, 15);
                    cmd.Parameters.Add("@lname", SqlDbType.VarChar, 15);
                    cmd.Parameters.Add("@password", SqlDbType.NChar, 30);
                    cmd.Parameters.Add("@userType", SqlDbType.Int);
                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 320);
                    cmd.Parameters.Add("@age", SqlDbType.Int);
                    cmd.Parameters.Add("@phone", SqlDbType.BigInt);
                    cmd.Parameters.Add("@card_no", SqlDbType.BigInt);
                    cmd.Parameters.Add("@exp_month", SqlDbType.Int);
                    cmd.Parameters.Add("@exp_date", SqlDbType.Int);
                    cmd.Parameters.Add("@gender", SqlDbType.Char);
                    cmd.Parameters.Add("@card_type", SqlDbType.Char);
                    cmd.Parameters.Add("@card_provided", SqlDbType.Char);

                    cmd.Parameters["@username"].Value = username;
                    cmd.Parameters["@fname"].Value = fname;
                    cmd.Parameters["@lname"].Value = lname;
                    cmd.Parameters["@password"].Value = password;
                    cmd.Parameters["@email"].Value = email;
                    cmd.Parameters["@userType"].Value = userType;
                    cmd.Parameters["@age"].Value = age;
                    cmd.Parameters["@phone"].Value = phone;
                    cmd.Parameters["@card_no"].Value = CardNo;
                    cmd.Parameters["@exp_date"].Value = expDate;
                    cmd.Parameters["@exp_month"].Value = expMonth;
                    cmd.Parameters["@gender"].Value = Gender;
                    cmd.Parameters["@card_type"].Value = CardType;
                    cmd.Parameters["@card_provided"].Value = CardProvided;


                    cmd.ExecuteNonQuery();
                    return 1;
                }
                else
                {
                    cmd = new SqlCommand("adminsignup", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@fname", SqlDbType.VarChar, 15);
                    cmd.Parameters.Add("@lname", SqlDbType.VarChar, 15);
                    cmd.Parameters.Add("@password", SqlDbType.NChar, 30);
                    cmd.Parameters.Add("@userType", SqlDbType.Int);
                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 320);
                    cmd.Parameters.Add("@age", SqlDbType.Int);
                    cmd.Parameters.Add("@phone", SqlDbType.BigInt);
                    cmd.Parameters.Add("@gender", SqlDbType.Char);
                 
                    
                    cmd.Parameters["@fname"].Value = fname;
                    cmd.Parameters["@lname"].Value = lname;
                    cmd.Parameters["@password"].Value = password;
                    cmd.Parameters["@email"].Value = email;
                    cmd.Parameters["@userType"].Value = userType;
                    cmd.Parameters["@age"].Value = age;
                    cmd.Parameters["@phone"].Value = phone;
                    cmd.Parameters["@gender"].Value = Gender;
                    cmd.ExecuteNonQuery();
                }
                return output;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        public DataSet getOnlineUsers()
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("select * from[USER] where login_status = 'ON' ", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }

        public DataSet getBookingsAir()
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("select * from (BOOKING join [FLIGHTBOOKING] on [BOOKING].booking_id = [FLIGHTBOOKING].booking_id) join [FLIGHTINFO] on booking_idairline = flight_id", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }

        public DataSet getBookingsTrain()
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("select * from (BOOKING join [TRAINBOOKING] on [BOOKING].booking_id = [TRAINBOOKING].booking_id) join [TRAININFO] on booking_idtrain = train_id", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }


        public DataSet getBookingsCinema()
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("select * from (BOOKING join [CINEMABOOKING] on [BOOKING].booking_id = [CINEMABOOKING].booking_id) join [THEATRE] on booking_idcinema = theatre_id", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }

        public int user_login_DAL(string name, string password, ref string email)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Userlogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@username", SqlDbType.VarChar, 20);
                cmd.Parameters.Add("@password", SqlDbType.NChar, 30);
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 320);
               
                cmd.Parameters["@username"].Value = name;
                cmd.Parameters["@password"].Value = password;
                cmd.Parameters["@email"].Direction = ParameterDirection.Output;
                
                cmd.ExecuteNonQuery();
                email = cmd.Parameters["@email"].Value.ToString();
                if (email == "")
                {
                    throw new System.ArgumentException("Username or Password are incorrect", "");
                }
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        public int admin_login_DAL(int name, string password, ref string email)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Adminlogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@admin_id", SqlDbType.Int);
                cmd.Parameters.Add("@password", SqlDbType.NChar, 30);
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 320);

                cmd.Parameters["@admin_id"].Value = name;
                cmd.Parameters["@password"].Value = password;
                cmd.Parameters["@email"].Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                email = cmd.Parameters["@email"].Value.ToString();
                if (email == "")
                {
                    throw new System.ArgumentException("Username or Password are incorrect", "");
                }
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        public int addCinema_DAL(string cinemaName, string Location)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("addCinemaAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cname", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@loc", SqlDbType.VarChar, 30);
                
                cmd.Parameters["@cname"].Value = cinemaName;
                cmd.Parameters["@loc"].Value = Location;

                cmd.ExecuteNonQuery();
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        public int addMovie_DAL(int cid,int tid,int price,int seats,string MovieName, string date)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("addMoviesAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@moviename", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@movieDate", SqlDbType.VarChar , 10);
                cmd.Parameters.Add("@cid", SqlDbType.Int);
                cmd.Parameters.Add("@tid", SqlDbType.Int);
                cmd.Parameters.Add("@tSeats", SqlDbType.Int);
                cmd.Parameters.Add("@price", SqlDbType.Int);

                cmd.Parameters["@movieName"].Value = MovieName;
                cmd.Parameters["@movieDate"].Value = date;
                cmd.Parameters["@cid"].Value = cid;
                cmd.Parameters["@tid"].Value = tid;
                cmd.Parameters["@price"].Value = price;
                cmd.Parameters["@tSeats"].Value = seats;

                cmd.ExecuteNonQuery();
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        public int addRailway_DAL(string railwayName)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("addRailwayAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@tname", SqlDbType.VarChar, 30);

                cmd.Parameters["@tname"].Value = railwayName;

                cmd.ExecuteNonQuery();
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        public int addTrain_DAL(int rid, int tid, int price, int seats, string arrival, string departure, string date)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("addTrainAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@arrival", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@departure", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@tripDate", SqlDbType.VarChar, 10);
                cmd.Parameters.Add("@rid", SqlDbType.Int);
                cmd.Parameters.Add("@tid", SqlDbType.Int);
                cmd.Parameters.Add("@tSeats", SqlDbType.Int);
                cmd.Parameters.Add("@price", SqlDbType.Int);

                cmd.Parameters["@arrival"].Value = arrival;
                cmd.Parameters["@departure"].Value = departure;
                cmd.Parameters["@tripDate"].Value = date;
                cmd.Parameters["@rid"].Value = rid;
                cmd.Parameters["@tid"].Value = tid;
                cmd.Parameters["@price"].Value = price;
                cmd.Parameters["@tSeats"].Value = seats;

                cmd.ExecuteNonQuery();
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }


        public int addAirline_DAL(string railwayName)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("addAirlineAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@tname", SqlDbType.VarChar, 30);

                cmd.Parameters["@tname"].Value = railwayName;

                cmd.ExecuteNonQuery();
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        public int addFlight_DAL(int rid, int tid, int price, int seats, string arrival, string departure, string date)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("addFlightAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@arrival", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@departure", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@tripDate", SqlDbType.VarChar, 10);
                cmd.Parameters.Add("@rid", SqlDbType.Int);
                cmd.Parameters.Add("@tid", SqlDbType.Int);
                cmd.Parameters.Add("@tSeats", SqlDbType.Int);
                cmd.Parameters.Add("@price", SqlDbType.Int);

                cmd.Parameters["@arrival"].Value = arrival;
                cmd.Parameters["@departure"].Value = departure;
                cmd.Parameters["@tripDate"].Value = date;
                cmd.Parameters["@rid"].Value = rid;
                cmd.Parameters["@tid"].Value = tid;
                cmd.Parameters["@price"].Value = price;
                cmd.Parameters["@tSeats"].Value = seats;

                cmd.ExecuteNonQuery();
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }


        public DataSet showtrains(string arrival, string departure)
        {
            string d = departure;
            string a = arrival;

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                string command = "Select * from [TRAININFO] where departure ='" + d + "' AND arrival ='" + a + "'";
                cmd = new SqlCommand(command, con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command

                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }

            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset

        }
        public void Bookcinemas(string CID, string Cname, string moviename, string moviedate, string totalseats, string leftseats, string price, string username, string TID, string location)
        {
            //GlobalVariables.bookid = GlobalVariables.bookid + 1;

            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;


            try
            {
                cmd = new SqlCommand("bookSomething ", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@bookingType", SqlDbType.Int);
                cmd.Parameters.Add("@user_name", SqlDbType.VarChar, 20);
                cmd.Parameters.Add("@item_id", SqlDbType.Int);
                cmd.Parameters.Add("@payment", SqlDbType.VarChar, 4);

                cmd.Parameters["@bookingType"].Value = 1;
                cmd.Parameters["@user_name"].Value = Convert.ToString(username);
                cmd.Parameters["@item_id"].Value = Convert.ToInt32(TID);
                cmd.Parameters["@payment"].Value = "cash";

                cmd.ExecuteNonQuery();











            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }

        }


        public void Booktrains(string TID, string RID, string username)
        {
            //GlobalVariables.bookid = GlobalVariables.bookid + 1;

            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;


            try
            {
                cmd = new SqlCommand("bookSomething ", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@bookingType", SqlDbType.Int);
                cmd.Parameters.Add("@user_name", SqlDbType.VarChar, 20);
                cmd.Parameters.Add("@item_id", SqlDbType.Int);
                cmd.Parameters.Add("@payment", SqlDbType.VarChar, 4);

                cmd.Parameters["@bookingType"].Value = 3;
                cmd.Parameters["@user_name"].Value = Convert.ToString(username);
                cmd.Parameters["@item_id"].Value = Convert.ToInt32(TID);
                cmd.Parameters["@payment"].Value = "cash";

                cmd.ExecuteNonQuery();




            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }

        }
        public void cancelbooking(string BID, string username, string bookingtype)
        {
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;


            try
            {
                cmd = new SqlCommand("cancelbooking ", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@bookingType", SqlDbType.Int);
                cmd.Parameters.Add("@user_name", SqlDbType.VarChar, 20);
                cmd.Parameters.Add("@book_id", SqlDbType.Int);
                cmd.Parameters.Add("@payment", SqlDbType.VarChar, 4);

                cmd.Parameters["@bookingType"].Value = Convert.ToInt32(bookingtype);
                cmd.Parameters["@user_name"].Value = Convert.ToString(username);
                cmd.Parameters["@book_id"].Value = Convert.ToInt32(BID);
                cmd.Parameters["@payment"].Value = "cash";

                cmd.ExecuteNonQuery();



            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }
        }

        public void Bookflight(string FID, string AID, string d, string a, string totseats, string leftseats, string price, string username, string date)
        {
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;


            try
            {
                cmd = new SqlCommand("bookSomething ", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@bookingType", SqlDbType.Int);
                cmd.Parameters.Add("@user_name", SqlDbType.VarChar, 20);
                cmd.Parameters.Add("@item_id", SqlDbType.Int);
                cmd.Parameters.Add("@payment", SqlDbType.VarChar, 4);

                cmd.Parameters["@bookingType"].Value = 2;
                cmd.Parameters["@user_name"].Value = Convert.ToString(username);
                cmd.Parameters["@item_id"].Value = Convert.ToInt32(FID);
                cmd.Parameters["@payment"].Value = "cash";

                cmd.ExecuteNonQuery();



            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }

        }
        public DataSet showbookings(string username)
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                string command = "Select * from [BOOKING] where user_id='" + username + "'";


                cmd = new SqlCommand(command, con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                //cmd.Parameters.Add("@departure", SqlDbType.VarChar, 20);
                //cmd.Parameters.Add("@arrival", SqlDbType.VarChar, 20);


                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }



        public DataSet Showflight(string arrival, string departure)
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                string command = "Select * from [FLIGHTINFO] where from_location='" + departure + "' AND to_location = '" + arrival + "'";


                cmd = new SqlCommand(command, con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                //cmd.Parameters.Add("@departure", SqlDbType.VarChar, 20);
                //cmd.Parameters.Add("@arrival", SqlDbType.VarChar, 20);


                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }


        public DataSet showcinemas(string name)
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                string command = "select [CINEMAS].cinema_id , cinema_name , location , theatre_id , movie_name , movie_date , totalseats , leftseats , price from[CINEMAS] join[THEATRE] on[CINEMAS].cinema_id = [THEATRE].cinema_id where movie_name = '" + name + "'";


                cmd = new SqlCommand(command, con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                //cmd.Parameters.Add("@departure", SqlDbType.VarChar, 20);
                //cmd.Parameters.Add("@arrival", SqlDbType.VarChar, 20);


                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }


    }
}