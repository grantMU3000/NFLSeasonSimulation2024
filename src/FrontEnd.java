/**
 * This class is used to handle the front end information that will be displayed
 * to the user.
 */

public class FrontEnd {
    // This integer will be used to keep track of what week it is during the season
    public int week = 1;
    public static void main(String[] args) {
        // Welcome message for the user
        
        welcomeMessage();
        chooseOption();
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
     */
    private static void chooseOption() {
        System.out.println("Type a number that aligns with what you want to do" +
            " and click enter");
    }

    /**
     * This method will process the user's selections and run appropriate functions based
     * on those selections. (e.g. Display standings, display schedule, advance week, etc.)
     * @param pick integer variable that represents the option the user selected.
     */
    private static void optionToggle(int pick) {

    }
}