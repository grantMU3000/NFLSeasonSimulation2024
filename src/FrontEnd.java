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
        /*
        // Connecting to the database
        String url="jdbc:mysql://localhost:3306/NFLSim2024";
        String username="root";
        String password="Saaheem2024__";

        // Trying to connect to the MySQL Driver. Catching any errors in this process
         
        try {

            Class.forName("com.mysql.cj.jdbc.Driver"); // Loads the MySQL Driver
            Connection connection = DriverManager.getConnection(url, username, password);  // Creates an actual connection

            PreparedStatement statement = connection.prepareStatement("select * from Teams");  // Used to do an SQL query

            // This will actually query the database & store the result
            // Acts as an iterator in the database
            ResultSet resultSet = statement.executeQuery();

            // This will go through each row of the Teams table and display column information
            while (resultSet.next()) {
                System.out.println(resultSet.getString(1) + " " + resultSet.getString(2) + " "
                + resultSet.getString(3) + " " + resultSet.getString(4) + " "
                + resultSet.getString(5) + " " + resultSet.getString(6) + " "
                + resultSet.getString(7) + " " + resultSet.getString(8) + " "
                + resultSet.getString(9) + " " + resultSet.getString(10) + " "
                + resultSet.getString(11) + " " + resultSet.getString(12) + " "
                + resultSet.getString(13) + " " + resultSet.getString(14) + " ");
            } 
            
            connection.close();
            
        } catch (Exception e) {
            System.err.println(e);
            e.printStackTrace();
        } 
        */
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
        System.out.println("5. Display team records");
        System.out.println("6. Advance a week");

        

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
                RegSeason.divSelection();
                break;
            default:
                System.out.println("Error!");
        }
    }


    /**
     * This class will be used to handle the regular season aspects of this simulation.
     * (E.g. displaying standings, seeding, etc.).
     */
    private class RegSeason {

        /**
         * This method will display divisions for the user to select.
         */
        private static void divSelection() {
            System.out.println("\n1. All NFC Divisions");
            System.out.println("2. NFC East");
            System.out.println("3. NFC West");
            System.out.println("4. NFC North");
            System.out.println("5. NFC South");
            System.out.println("\n6. All AFC Divisions");
            System.out.println("7. AFC East");
            System.out.println("8. AFC West");
            System.out.println("9. AFC North");
            System.out.println("10. AFC South\n");
            System.out.println("11. All Divisions\n");

            userDivSelect();  // Calling a helper method to get the user's selection
        }  // End of divSelection

        /**
         * This method will prompt the user to pick which division they would
         * like to display.
         */
        private static void userDivSelect() {
            Scanner sc = new Scanner(System.in); // Scanner for reading the user input
            boolean valid = false;

            /*
            * Loop that will elicit a selected option from the user. This runs until 
            * the user enters a valid input.
            */ 
            do {

                try {
                    System.out.print("\n Select a number between 1 & 11 based on the options" +
                " above, and click enter: ");
                    int num = sc.nextInt();  // Get the user's selection

                    if ((num >= 1) && (num <= 11)) {
                        divToggle(num);
                        valid = true;  // Valid since the selection was gotten
                    } else {
                        throw new InputMismatchException();
                    }

                } catch (InputMismatchException s) {
                    // Exception thrown if the user doesn't enter a valid number
                    System.out.println("You can only enter a number between 1 & 10!");
                }
                sc.nextLine();  // Prevents an infinite loop
            } while (!valid); 
        } // End of userDivSelection

        /**
         * This method will use the user's selection to display specific standings
         * to the user.
         * 
         * @param option An Integer that represents the user's selection.
         */
        private static void divToggle(int option) {
            // This switch case will check which option the user selected and run 
            // appropriate functions for displaying divisions
            switch (option) {
                case 1:
                    System.out.println("Displaying NFC division standings...");
                    
                    break;
                case 2:
                    System.out.println("Displaying NFC East standings...");
                    divStatement("nfcEast");
                    break;
                case 3:
                    System.out.println("Displaying NFC West standings...");
                    divStatement("nfcWest");
                    break;
                case 4:
                    System.out.println("Displaying NFC North standings...");
                    divStatement("nfcNorth");
                    break;
                case 5:
                    System.out.println("Displaying NFC South standings...");
                    divStatement("nfcSouth");
                    break;
                case 6:
                    System.out.println("Displaying AFC division standings...");
                    
                    break;
                case 7:
                    System.out.println("Displaying AFC East standings...");
                    divStatement("afcEast");
                    break;
                case 8:
                    System.out.println("Displaying AFC West standings...");
                    divStatement("afcWest");
                    break;
                case 9:
                    System.out.println("Displaying AFC North standings...");
                    divStatement("afcNorth");
                    break;
                case 10:
                    System.out.println("Displaying AFC South standings...");
                    divStatement("afcSouth");
                    break;
                case 11:
                    System.out.println("Displaying All division standings...");
                    break;
                default:
                    System.out.println("Error!");
            }  // End of switch case
        } // End of divToggle method

        /**
         * This method is a helper to the divToggle method. It will be used to
         * loop through all of the divisions for a conference or league and get
         * them displayed.
         * 
         * @param userConf A String variable that represents the conference or 
         *                  league divisions that the user wants displayed.
         */
        private static void allDivs(String userConf) {

        }

        /**
         * This method will run an SQL statement that gets the division standings 
         * of a division.
         * @param division A String variable that represents the division being
         *                  selected.
         * 
         * @return A String that represents the division standings
         */
        private static String divStatement(String division) {
            String result = "";

            // Variables used for connecting to the database
            String url="jdbc:mysql://localhost:3306/NFLSim2024";
            String username="root";
            String password="Saaheem2024__";

             // Trying to connect to the MySQL Driver. Catching any errors in this process
             try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Loads the MySQL Driver
                Connection connection = DriverManager.getConnection(url, username, password);  // Creates an actual connection
                /*
                 * This statement will get information from the given division table.
                 */
                PreparedStatement statement = connection.prepareStatement("Select City, Mascot, Wins, Losses, " + 
                    "Draws from " + division + " Order By Wins");  
                
                // This will actually query the database & store the result
                // Acts as an iterator in the database
                ResultSet resultSet = statement.executeQuery();

                // This will go through each row of the division's table and display column information
                while (resultSet.next()) {
                    result +=  String.format("%-15s %-15s %d-%d\n", resultSet.getString(1), resultSet.getString(2),
                        resultSet.getInt(3), resultSet.getInt(4));

                    // If the team has a draw in their record, then this is added to the results so it
                    // can be displayed
                    if (resultSet.getInt(5) > 0) {
                        result += "-" + resultSet.getInt(5);
                    }
                }  // End of query loop

                connection.close();
                
             } catch (Exception e) {
                System.out.println(e.getMessage());
             }  // End of try-catch

             System.out.println(result);
             return result;

        }  // End of divStatement
    }  // End of RegSeason class
}  // End of FrontEnd class