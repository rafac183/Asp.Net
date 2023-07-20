﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Drawing;

namespace WS_DB
{
    /// <summary>
    /// Descripción breve de DataBase_WS
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class DataBase_WS : System.Web.Services.WebService
    {

        [WebMethod]
        public DataSet AllMembers()
        {
            SqlConnection conn = new SqlConnection();

            //en mi caso tengo autenticacion de windows, por eso uso Integrated Security = True;
            //sino tendrias que ingresar tu usuario y tu pas de la base de datos
            conn.ConnectionString = "Data Source=DESKTOP-34305JK; Initial Catalog=db_MahikariTai; Integrated Security=True;";
            SqlDataAdapter da = new SqlDataAdapter("exec allMembers;", conn);
            //Cache de memoria, guardar lo que hice
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod]
        public DataSet AllInfo(string rut)
        {
            SqlConnection conn = new SqlConnection();

            //en mi caso tengo autenticacion de windows, por eso uso Integrated Security = True;
            //sino tendrias que ingresar tu usuario y tu pas de la base de datos
            conn.ConnectionString = "Data Source=DESKTOP-34305JK; Initial Catalog=db_MahikariTai; Integrated Security=True;";
            SqlDataAdapter da = new SqlDataAdapter("exec miembroAllInfo @rut_user = '" + rut + "';", conn);
            //Cache de memoria, guardar lo que hice
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod]
        public DataSet AñadirMiembro(string rut, string nombres, string primerApellido, string segundoApellido, string genero, string categoria, string email, string birthdate, string nacionalidad, string phone, string calle, int numero, string region, string ciudad, string comuna, string hobbies)
        {
            SqlConnection conn = new SqlConnection();

            //en mi caso tengo autenticacion de windows, por eso uso Integrated Security = True;
            //sino tendrias que ingresar tu usuario y tu pas de la base de datos
            conn.ConnectionString = "Data Source=DESKTOP-34305JK; Initial Catalog=db_MahikariTai; Integrated Security=True;";
            SqlDataAdapter da = new SqlDataAdapter("EXEC crearMiembro @categoria_name = '" + categoria + "', @nombres = '" + nombres + "', @first_lastname = '" + primerApellido + "', @second_lastname = '" + segundoApellido + "', @gender = '" + genero + "', @rut_user = '" + rut + "', @birthdate = '" + birthdate + "', @nacionality = '" + nacionalidad + "', @calle = '" + calle + "', @number = " + numero + ", @phone_number = '" + phone + "', @email = '" + email + "', @hobbies = '" + hobbies + "', @nombre_comuna = '" + comuna + "', @nombre_ciudad = '" + ciudad + "', @nombre_region = '" + region + "';", conn);
            //Cache de memoria, guardar lo que hice
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod]
        public DataSet ModificarMiembro(string rut, string nombres, string primerApellido, string segundoApellido, string genero, string categoria, string email, string birthdate, string nacionalidad, string phone, string calle, int numero, string region, string ciudad, string comuna, string hobbies)
        {
            SqlConnection conn = new SqlConnection();

            //en mi caso tengo autenticacion de windows, por eso uso Integrated Security = True;
            //sino tendrias que ingresar tu usuario y tu pas de la base de datos
            conn.ConnectionString = "Data Source=DESKTOP-34305JK; Initial Catalog=db_MahikariTai; Integrated Security=True;";
            SqlDataAdapter da = new SqlDataAdapter("EXEC modificarMiembro @categoria_name = '" + categoria + "', @nombres = '" + nombres + "', @first_lastname = '" + primerApellido + "', @second_lastname = '" + segundoApellido + "', @gender = '" + genero + "', @rut_user = '" + rut + "', @birthdate = '" + birthdate + "', @nacionality = '" + nacionalidad + "', @calle = '" + calle + "', @number = " + numero + ", @phone_number = '" + phone + "', @email = '" + email + "', @hobbies = '" + hobbies + "', @nombre_comuna = '" + comuna + "', @nombre_ciudad = '" + ciudad + "', @nombre_region = '" + region + "';", conn);
            //Cache de memoria, guardar lo que hice
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }


        [WebMethod]
        public DataSet EliminarMiembro(string rut)
        {
            SqlConnection conn = new SqlConnection();

            //en mi caso tengo autenticacion de windows, por eso uso Integrated Security = True;
            //sino tendrias que ingresar tu usuario y tu pas de la base de datos
            conn.ConnectionString = "Data Source=DESKTOP-34305JK; Initial Catalog=db_MahikariTai; Integrated Security=True;";
            SqlDataAdapter da = new SqlDataAdapter("exec eliminarMiembro @rut_user = '" + rut + "';", conn);
            //Cache de memoria, guardar lo que hice
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod]
        public DataSet Nacionalidades()
        {
            SqlConnection conn = new SqlConnection();

            //en mi caso tengo autenticacion de windows, por eso uso Integrated Security = True;
            //sino tendrias que ingresar tu usuario y tu pas de la base de datos
            conn.ConnectionString = "Data Source=DESKTOP-34305JK; Initial Catalog=db_MahikariTai; Integrated Security=True;";
            SqlDataAdapter da = new SqlDataAdapter("exec nacionalidades;", conn);
            //Cache de memoria, guardar lo que hice
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod]
        public DataSet Regiones()
        {
            SqlConnection conn = new SqlConnection();

            //en mi caso tengo autenticacion de windows, por eso uso Integrated Security = True;
            //sino tendrias que ingresar tu usuario y tu pas de la base de datos
            conn.ConnectionString = "Data Source=DESKTOP-34305JK; Initial Catalog=db_MahikariTai; Integrated Security=True;";
            SqlDataAdapter da = new SqlDataAdapter("exec regiones;", conn);
            //Cache de memoria, guardar lo que hice
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod]
        public DataSet SearchCiudadAndShow(string region)
        {
            SqlConnection conn = new SqlConnection();

            //en mi caso tengo autenticacion de windows, por eso uso Integrated Security = True;
            //sino tendrias que ingresar tu usuario y tu pas de la base de datos
            conn.ConnectionString = "Data Source=DESKTOP-34305JK; Initial Catalog=db_MahikariTai; Integrated Security=True;";
            SqlDataAdapter da = new SqlDataAdapter("EXEC searchCiudadesPorRegion @nombreRegion = '" + region + "';", conn);
            //Cache de memoria, guardar lo que hice
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod]
        public DataSet SearchComunaAndShow(string ciudad)
        {
            SqlConnection conn = new SqlConnection();

            //en mi caso tengo autenticacion de windows, por eso uso Integrated Security = True;
            //sino tendrias que ingresar tu usuario y tu pas de la base de datos
            conn.ConnectionString = "Data Source=DESKTOP-34305JK; Initial Catalog=db_MahikariTai; Integrated Security=True;";
            SqlDataAdapter da = new SqlDataAdapter("EXEC searchComunasPorCiudad @nombreCiudad = '" + ciudad + "'; ", conn);
            //Cache de memoria, guardar lo que hice
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod]
        public DataSet Generos()
        {
            SqlConnection conn = new SqlConnection();

            //en mi caso tengo autenticacion de windows, por eso uso Integrated Security = True;
            //sino tendrias que ingresar tu usuario y tu pas de la base de datos
            conn.ConnectionString = "Data Source=DESKTOP-34305JK; Initial Catalog=db_MahikariTai; Integrated Security=True;";
            SqlDataAdapter da = new SqlDataAdapter("exec generos;", conn);
            //Cache de memoria, guardar lo que hice
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod]
        public DataSet Categorias()
        {
            SqlConnection conn = new SqlConnection();

            //en mi caso tengo autenticacion de windows, por eso uso Integrated Security = True;
            //sino tendrias que ingresar tu usuario y tu pas de la base de datos
            conn.ConnectionString = "Data Source=DESKTOP-34305JK; Initial Catalog=db_MahikariTai; Integrated Security=True;";
            SqlDataAdapter da = new SqlDataAdapter("exec categorias;", conn);
            //Cache de memoria, guardar lo que hice
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }


}
