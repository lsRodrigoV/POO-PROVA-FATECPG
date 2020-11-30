package web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;
import br.edu.fatecpg.poo.Disciplinas;

/**
 *
 * @author Rodrigo
 */

public class DbListener implements ServletContextListener {
public static final String CLASS_NAME = "org.sqlite.JDBC";
public static final String DB_URL = "jdbc:sqlite:D:\\work\\sql\\tasks-noturno.db";
public static String exceptionMessage = null;
public static Connection getConnection()throws Exception{
    return DriverManager.getConnection(DB_URL);
}

    @Override
    public void contextInitialized(ServletContextEvent sce) {
    Connection con = null; Statement stmt = null;
        try {
            Class.forName(CLASS_NAME);
            con = DriverManager.getConnection(DB_URL);
            stmt = con.createStatement();
            stmt.execute(Disciplinas.getCreateStatment());
            if(Disciplinas.getList().isEmpty()){
           
            stmt.execute("INSERT INTO disciplinas VALUES("
                                    +"'Programacao Orientada a Objetos' ,"
                                    +"'Conceitos e evolução da tecnologia de orientação a objetos.',"
                                    +"4,"
                                    +"10);");

            }
        } catch (Exception ex) {
        } finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
