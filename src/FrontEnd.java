/**
 * This class is used to handle the front end information that will be displayed
 * to the user.
 */
import java.sql.*;
import java.util.InputMismatchException;
import java.util.Scanner;

public class FrontEnd {
    // This integer will be used to keep track of what week it is during the season
    public int week = 1;
    public static void main(String[] args) {
        // Welcome message for the user
        
        welcomeMessage();
        chooseOption();
        // Connecting to the database
        String url="jdbc:mysql://localhost:3306/NFLSim2024";
        String username="root";
        String password="Saaheem2024__";

        // Trying to connect to the MySQL Driver. Catching any errors in this process
        try {

            /* Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(url, username, password);

             Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery("select * from AFC");

            System.out.println(resultSet.getInt(1) + " " + resultSet.getString(2) +
            resultSet.getString(3) + " " + resultSet.getInt(4) + resultSet.getInt(5) +
            resultSet.getInt(6) + " " + resultSet.getInt(7) + resultSet.getInt(8) +
            resultSet.getInt(9) + " " + resultSet.getString(10)); 
            
            if (connection != null) {
                System.err.println("Successful connection");
                connection.close();
            } */

            Class.forName("com.mysql.cj.jdbc.Driver"); // Loads the MySQL Driver
            Connection connection = DriverManager.getConnection(url, username, password);  // Creates an actual connection
            // Tests to see if the connection works
            if (connection != null) {
                System.err.println("Successful connection");
                connection.close();
            }
            
        } catch (Exception e) {
            System.err.println(e);
            e.printStackTrace();
        } 
    }

    /**
     * Simple method that displays a welcome message for the user.
     */
    private static void welcomeMessage() {
        System.out.println("Welcome to the 2024 NFL Season Simulation App!\n");
        System.out.println("This application will simulate through the 2024 NFL" +
            " season based on realistic preseason team information.");
        System.out.println("Throughout the season, you can see team stats including" +
            " win/loss records, league standings, the playoff bracket, and the Super Bowl winner.");
        System.out.println("This app does not track player information, nor does it" + 
            " account for player injuries. However, we do take home field advantage" +
            " and team ratings into consideration when deciding the odds for each game.\n");
        System.out.println("With all that being said, enjoy the season simulation!\n\n");
    }

    /**
     * This method will show the user their options on what they can do within the app. 
     * This ranges from displaying team schedules, standings, or advancing a week.
     * The method gets the user's input, and uses it to call a method that will process
     * said input.
     */
    private static void chooseOption() throws InputMismatchException {
        System.out.println("1. Display division standings");
        System.out.println("2. Display conference standings");
        System.out.println("3. Display a team's schedule");
        System.out.println("4. Display the league's schedule");
        System.out.println("5. Advance a week");

        

        Scanner sc = new Scanner(System.in); // Scanner for reading the user input
        boolean valid = false;

        /*
        * Loop that will elicit a selected option from the user. This runs until 
        * the user enters a valid input.
        */ 
        do {

            try {
                System.out.print("\n Select a number between 1 & 5 based on the options" +
            " above, and click enter: ");
                int num = sc.nextInt();  // Get the user's selection

                if ((num >= 1) && (num <= 5)) {
                    optionToggle(num);
                    valid = true;  // Valid since the selection was gotten
                } else {
                    throw new InputMismatchException();
                }

            } catch (InputMismatchException s) {
                // Exception thrown if the user doesn't enter a valid number
                System.out.println("You can only enter a number between 1 & 5!");
            }
            sc.nextLine();  // Prevents an infinite loop
        } while (!valid); 
    }

    /**
     * This method will process the user's selections and run appropriate functions based
     * on those selections. (e.g. Display standings, display schedule, advance week, etc.)
     * @param pick integer variable that represents the option the user selected.
     */
    private static void optionToggle(int pick) {
        // This switch case will check which option the user selected and run 
        // appropriate functions
        switch (pick) {
            case 1:
                System.out.println("Displaying league standings...");
                break;
            default:
                System.out.println("Error!");
        }
    }
}