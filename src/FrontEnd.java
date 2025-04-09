/**
 * This class is used to handle the front end information that will be displayed
 * to the user.
 */
import java.sql.*;
import java.util.InputMismatchException;
import java.util.Scanner;

public class FrontEnd {
    // This integer will be used to keep track of what week it is during the season
    public static int week = 1;
    public static boolean quit = false;
    public static void main(String[] args) {
        // Welcome message for the user
        
        welcomeMessage();

        do {
            chooseOption();
        } while (week <= 18 && !quit);
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
        System.out.println("7. Quit");

        

        Scanner sc = new Scanner(System.in); // Scanner for reading the user input
        boolean valid = false;

        /*
        * Loop that will elicit a selected option from the user. This runs until 
        * the user enters a valid input.
        */ 
        do {

            try {
                System.out.print("\n Select a number between 1 & 7 based on the options" +
            " above, and click enter: ");
                int num = sc.nextInt();  // Get the user's selection

                if ((num >= 1) && (num <= 7)) {
                    optionToggle(num);
                    valid = true;  // Valid since the selection was gotten
                } else {
                    throw new InputMismatchException();
                }

            } catch (InputMismatchException s) {
                // Exception thrown if the user doesn't enter a valid number
                System.out.println("You can only enter a number between 1 & 7!");
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
            case 2:
                RegSeason.confSelect();
                break;
            case 3:
                RegSeason.teamSchedSelect();
                break;
            case 4:
                RegSeason.leagueSchedule();
                break;
            case 7: 
                quit = quitConfirm();
                break;
            default:
                System.out.println("Error!");
        }
    }

    /**
     * This method will confirm whether or not the user wants to stop the app
     * 
     * @return a boolean value that's true if the user wants to quit, or false
     *          if they don't.
     */
    private static boolean quitConfirm() {
        boolean valid = true;
        // This loop will get a response from the user. It runs until the user 
        // enters a valid number (1 or 2)
        do {
            valid = true;
            System.out.println("Are you sure you want to quit the simulation?");
            System.out.print("Type 1 for yes or 2 for no: ");

            Scanner sc = new Scanner(System.in); // Scanner for reading the user input
            
            // If an invalid input is entered, the catch block will tell the 
            // user to enter a valid number
            try {
                int num = sc.nextInt();
                // If user selects 1, then the simulation stops. If it's 2, 
                // then the app will keep running
                if (num == 1) {
                    System.out.println("I hope you return soon!");
                    return true;
                } else if (num == 2) {
                    return false;
                } else {
                    valid = false;
                    throw new InputMismatchException();
                }
            } catch (InputMismatchException e) {
                System.out.println("You only enter the numbers 1 & 2!");
            }  // End of try/catch

        } while (!valid);
        
        return false;
    }  // End of quitConfirm

    /**
     * This class will be used to handle the regular season aspects of this simulation.
     * (E.g. displaying standings, seeding, etc.).
     */
    private class RegSeason {

        /**
         * This method will display divisions for the user to select.
         */
        private static void divSelection() {
            // Loop that will prompt the user to select an appropriate option
            // This will run until the user enters a valid input
            do {
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
                System.out.print("\n Select a number between 1 & 11 based on the options" +
                    " above, and click enter: ");
            } while (!userDivSelect());  // Calling a helper method to get the user's selection
        }  // End of divSelection

        /**
         * This method will prompt the user to pick which division they would
         * like to display.
         * 
         * @return A boolean value that represents whether or not the user's
         *      input was valid.
         */
        private static boolean userDivSelect() {
            Scanner sc = new Scanner(System.in); // Scanner for reading the user input
            boolean valid = false;

            /*  Trying to get the user input. If it's invalid (e.g. not between
                1 & 11, or it's not an integer, the catch block is ran.
            */
            try {
                    
                int num = sc.nextInt();  // Get the user's selection

                if ((num >= 1) && (num <= 11)) {
                    divToggle(num);
                    valid = true;  // Valid since the selection was gotten
                } else {
                    throw new InputMismatchException();
                }

            } catch (InputMismatchException s) {
                // Exception thrown if the user doesn't enter a valid number
                System.out.println("You can only enter a number between 1 & 11!");
            }
            return valid;

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
                    System.out.println("Displaying NFC division standings...\n");
                    allDivs("NFC");
                    break;
                case 2:
                    System.out.println("Displaying NFC East standings...");
                    standingStatement("nfcEast");
                    break;
                case 3:
                    System.out.println("Displaying NFC West standings...");
                    standingStatement("nfcWest");
                    break;
                case 4:
                    System.out.println("Displaying NFC North standings...");
                    standingStatement("nfcNorth");
                    break;
                case 5:
                    System.out.println("Displaying NFC South standings...");
                    standingStatement("nfcSouth");
                    break;
                case 6:
                    System.out.println("Displaying AFC division standings...\n");
                    allDivs("AFC");
                    break;
                case 7:
                    System.out.println("Displaying AFC East standings...");
                    standingStatement("afcEast");
                    break;
                case 8:
                    System.out.println("Displaying AFC West standings...");
                    standingStatement("afcWest");
                    break;
                case 9:
                    System.out.println("Displaying AFC North standings...");
                    standingStatement("afcNorth");
                    break;
                case 10:
                    System.out.println("Displaying AFC South standings...");
                    standingStatement("afcSouth");
                    break;
                case 11:
                    System.out.println("Displaying All division standings...\n");
                    allDivs("NFL");
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
            // Checking what conference the user chose, and looping through 
            // divToggle to display those divisions.
            if (userConf.equals("NFC")) {
                // Displays NFC's Division standings
                for (int i = 2; i < 6; i++) {
                    divToggle(i);
                }
            } else if (userConf.equals("AFC")) {
                // Displays AFC's Division standings
                for (int i = 7; i < 11; i++) {
                    divToggle(i);
                }
            } else {
                // If this is run, that means the user chose for all the 
                // division standings to display, so the NFC's will display
                // first. Then, the AFC's will display.
                divToggle(1);
                divToggle(6);
            }

        }  // End of allDivs

        /**
         * This method will run an SQL statement that gets the division standings 
         * of a division.
         * @param division A String variable that represents the division (or
         *                  conference) being selected.
         */
        private static void standingStatement(String division) {

             // Trying to connect to the MySQL Driver. Catching any errors in this process
             try {
                Connection connection = jdbcConnection.getConnection();
                /*
                 * This statement will get information from the given division table.
                 */
                PreparedStatement statement = connection.prepareStatement("Select City, Mascot, Wins, Losses, " + 
                    "Draws from " + division + " Order By Wins");  
                
                // This will actually query the database & store the result
                // Acts as an iterator in the database
                ResultSet resultSet = statement.executeQuery();

                int num = 1;  // This will be used to display the rank of each team
                // This will go through each row of the division's table and display column information
                while (resultSet.next()) {
                    System.out.printf("%d.\t %-15s %-15s %d-%d", num, 
                        resultSet.getString(1), resultSet.getString(2), 
                        resultSet.getInt(3), resultSet.getInt(4));

                    // If the team has a draw in their record, then this is added to the results so it
                    // can be displayed
                    if (resultSet.getInt(5) > 0) {
                        System.out.print("-" + resultSet.getInt(5));
                    }
                    // Since we're at the end of the row, this goes to the next line
                    System.out.println(""); 

                    num++;
                }  // End of query loop

                connection.close();
                
             } catch (Exception e) {
                System.out.println(e.getMessage());
             }  // End of try-catch
             // Goes to the next line to create more space for the next output
             System.out.println(""); 

        }  // End of divStatement

        /**
         * This method will display the user's options for which
         * conference/league standings they can see.
         * 
         */
        private static void confSelect() {
            // Loop that will prompt the user to select an appropriate option
            // This will run until the user enters a valid input
            do {
                System.out.println("\n1. NFL");
                System.out.println("2. NFC");
                System.out.println("3. AFC");
                System.out.println("4. NFC & AFC\n");

                System.out.print("Pick a number between 1 & 4 that represents the"
                    + " standings that you would like to see: ");
                    // Calling a method that gets user selection
            } while (!userConfSelection());  


        }  // End of confSelect

        /**
         * This method will give the user a chance to choose which conference's
         * standings they want to see
         * 
         * @return a boolean value that represents whether or not the user 
         *          input was valid.
         */
        private static boolean userConfSelection() {
            boolean valid = false;
            Scanner sc = new Scanner(System.in);

            /*  Trying to get the user input. If it's invalid (e.g. not between
                1 & 4, or it's not an integer, the catch block is ran.
            */
            try {
                int num = sc.nextInt();  // User's input is stored here

                // Checking if the user's input is valid
                if (num >= 1 && num <= 4) {
                    confToggle(num);
                    valid = true;
                } else {
                    throw new InputMismatchException();
                }
                
            } catch (InputMismatchException e) {
                System.out.println("You can only enter numbers between 1 & 4!");
            }  // End of try/catch

            return valid;
        } // End of userConfSelection method

        /**
         * Simple method that will help to display the right standings based
         * on the user's selection.
         * 
         * @param option An Integer that represents the option that the user 
         *      selects, which aligns with the standings they want displayed.
         */
        private static void confToggle(int option) {
            // This switch case will check which option the user selected and run 
            // appropriate functions for displaying divisions
            switch (option) {
                case 1:
                    System.out.println("Displaying League standings...\n");
                    standingStatement("Teams");
                    break;
                case 2:
                    System.out.println("Displaying NFC standings...\n");
                    standingStatement("NFC");
                    break;
                case 3: 
                    System.out.println("Displaying AFC standings...\n");
                    standingStatement("AFC");
                    break;
                case 4:
                    System.out.println("Displaying NFC & AFC standings...");
                    // Recursive calls since NFC & AFC are already done by 
                    // themselves
                    confToggle(2);
                    confToggle(3);
                    break;
                default:
                    System.out.println("Error!");
            }  // End of switch case

        }  // End of confToggle method

        /**
         * This method will display all of the NFL teams so that the user can
         * decide which team's schedule they would like to see.
         */
        private static void teamSchedSelect() {
            // Loop will run until the user selects a valid option/team
            do {
                // Displaying the teams so the user can see their options
                System.out.println();
                teamDisplay();
                System.out.println();

                System.out.print("Pick a number between 1 & 32 that represents " + 
                    "the team schedule that you would like to see: ");
            } while (!teamInput());
            
        }  // End of teamSchedSelect method

        /**
         * This method will get the user's selection and get the apporpriate
         * team's schedule displayed.
         * 
         * @return A boolean value that represents whether or not the user
         *      entered a valid input.
         */
        private static boolean teamInput() {
            Scanner sc = new Scanner(System.in);

            // Getting the user input, checking if it's valid, and catching
            // invalid inputs. Displaying schedule if it's valid
            try {
                int num = sc.nextInt();  // Storing the user's input

                if (num >= 1 && num <= 32) {
                    teamSchedule(num);
                    return true;
                }
                // Thrown b/c the user enters a number that's not between 1 & 32
                throw new InputMismatchException(); 
            } catch (InputMismatchException e) {
                System.out.println("You can only choose numbers between 1 & 32!\n");
            }  // End of try/catch

            return false;
        }  // End of teamInput

        /**
         * This method is a helper method to teamSchedSelect and it will 
         * display the the teams alphabetically
         */
        private static void teamDisplay() {
            // Trying to connect to the MySQL Driver. Catching any errors in this process
            try {
                Connection connection = jdbcConnection.getConnection();

                // This will pull all of the team names from the database
                // alphabetically
                PreparedStatement statement = connection.prepareStatement(
                    "Select City, Mascot from Teams;");
                ResultSet result = statement.executeQuery();

                int num = 1;  // Used for indexing the teams
                // This will display each team
                while (result.next()) {
                    System.out.printf("%d. %s %s\n", num, result.getString(1),
                        result.getString(2));
                    num++;
                }

                connection.close();
            } catch (Exception e) {
                e.getMessage();
            }  // End of try/catch


        }  // End of teamDisplay

        /**
         * This method will display a team's regular season schedule.
         *  
         * @param team An Integer variable that represents the NFL team's
         *      ID whose schedule will display.
         */
        private static void teamSchedule(int team) {

            // Trying to connect to the MySQL Driver. Catching any errors in this process
            try {
                Connection connection = jdbcConnection.getConnection();

                // This will select the desired team's schedule
                PreparedStatement teamStatement = connection.prepareStatement(
                    "Select * from regSeasonSchedule where teamID = " + team + ";");
                ResultSet result = teamStatement.executeQuery();

                // This will go through the team's schedule and display them
                while (result.next()) {
                    System.out.println("Displaying the " + result.getString(2) 
                        + " " + result.getString(3) + "'s schedule...\n");
                    
                    for (int i = 1; i < 19; i++) {
                        int opponent = result.getInt(i + 3);
                        String oppName = getTeam(opponent);
                        System.out.println("Week " + i + ". " + oppName);
                        
                    }  // End of for loop
                }  // End of scheduling loop

                // Separator to create more space between the schedule & the next thing
                System.out.println(); 

                connection.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }  // End of try-catch
        }  // End of teamSchedule method

        /**
         * This is a helper method that will get a team's name based on their
         * ID.
         * @param id An integer that represents the ID of the team that will
         *      be returned.
         * @return A String that represents a team name 
         *      (e.g. "Dallas Cowboys")
         */
        private static String getTeam(int id) {
            // Base case to make sure there's no errors
            if (id == 0) {
                return "Bye Week";
            }
            String team = "";         
           
            // Trying to connect to the MySQL Driver. Catching any errors in this process
            try {
                Connection connection = jdbcConnection.getConnection();
                // Actual SQL statement that will get the team name
                PreparedStatement teamGetter = connection.prepareStatement(
                    "Select City, Mascot from Teams where id = " + id + ";");
                ResultSet res = teamGetter.executeQuery();

                // Saving the team name into variables
                while (res.next()) {
                    String city = res.getString(1);
                    String mascot = res.getString(2);

                    team += city + " " + mascot;
                }  // End of while loop

                connection.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }  // End of try catch block

            return team;
        }  // End of getOpponent

        /**
         * This method will display the slate of games for a given week based
         * on user input.
         */
        private static void leagueSchedule() {
            System.out.println();
            // This will display every week in the regular season so the user
            // can decide which one they want to see
            for (int i = 1; i <= 18; i++) {
                System.out.printf("%d.\t Week %d\n", i, i);
            }  // End of for loop
            System.out.println();
        
        }  // End of leagueSchedule

    }  // End of RegSeason class

    /**
     * This class is simply used to establish a JDBC to my database.
     */
    private class jdbcConnection {

        /**
         * This method simply connects to the MySQL database I'm using.
         * 
         * @return A Connection variable that represents a connection to my
         *      database.
         */
        private static Connection getConnection() {
            // Variables used for connecting to the database
            String url="jdbc:mysql://localhost:3306/NFLSim2024";
            String username="root";
            String password="Saaheem2024__";

            Connection con = null;
            // Trying to connect to the MySQL Driver. Catching any errors in this process
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Loads the MySQL Driver
                con = DriverManager.getConnection(url, username, password);  // Creates an actual connection

                
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }  // End of try-catch


            return con;
        }  // End of getConnection
    }  // End of jdbcConnection class
}  // End of FrontEnd class