
/* Implements the PhoneNumber grammar from textbook:

phoneNumber --> countryCode areaCode prefix DASH_TOK extension
phoneNumber --> areaCode prefix DASH_TOK extension
countryCode --> digit digit
areaCode --> LPAREN_TOK digit digit digit RPAREN_TOK
prefix --> digit digit digit
extension --> digit digit digit digit
digit --> DIGIT_0_TOK
     ...
digit --> DIGIT_9_TOK
*/


public class PN_RDP extends RDP implements PN_Token {

    public static void main(String[] args) {
	if (args.length != 1) {
	    System.out.println("usage: java PN_RDP filename");
	    System.exit(0);
	}
	RDP parser = new PN_RDP(new PN_Lexer(args[0]));
	parser.parse();
    }
    public PN_RDP(Lexer pn_lexer) {
	super(pn_lexer);
    }

    /******** REQUIRED TO IMPLEMENT FROM RDP SUPER CLASS *******/
    protected void startSymbol() {
	/* call your specific start symbol nonterm here! */
	currToken = nexToken();
    phoneNumber();
    match(EOP);
    }

    /****************************************************************/
    /* Methods specific to the PN grammar. */
    /****************************************************************/

    private void phoneNumber() {
	if (currToken == LPAREN_TOK) {
	    countryCode();
        areaCode();
	    prefix();
	    match(DASH_TOK);
	    extension();
	}
	else if (currToken == DIGIT_0_TOK || currToken == DIGIT_1_TOK
		 || currToken == DIGIT_2_TOK || currToken == DIGIT_3_TOK
		 || currToken == DIGIT_4_TOK || currToken == DIGIT_5_TOK
		 || currToken == DIGIT_6_TOK || currToken == DIGIT_7_TOK
		 || currToken == DIGIT_8_TOK || currToken == DIGIT_9_TOK) {
	   digit();
       digit();
	}
	else error("Parser error in phoneNumber method");
    }

    private void countryCode() {
	if (currToken == DIGIT_0_TOK || currToken == DIGIT_1_TOK
		 || currToken == DIGIT_2_TOK || currToken == DIGIT_3_TOK
		 || currToken == DIGIT_4_TOK || currToken == DIGIT_5_TOK
		 || currToken == DIGIT_6_TOK || currToken == DIGIT_7_TOK
		 || currToken == DIGIT_8_TOK || currToken == DIGIT_9_TOK) {
	    digit();
	    digit();
	}
	else error("Parser error in countryCode method");
    }

    private void areaCode() {
	if (currToken == LPAREN_TOK)
       match(LPAREN_TOK);
       digit();
       digit();
       digit();
       match(RPAREN_TOK);
	}
	else error("Parser error in areaCode method");
    }

    private void prefix() {
	if (currToken == DIGIT_0_TOK || currToken == DIGIT_1_TOK
		 || currToken == DIGIT_2_TOK || currToken == DIGIT_3_TOK
		 || currToken == DIGIT_4_TOK || currToken == DIGIT_5_TOK
		 || currToken == DIGIT_6_TOK || currToken == DIGIT_7_TOK
		 || currToken == DIGIT_8_TOK || currToken == DIGIT_9_TOK) {
	
  digit();
  digit();
  digit(); 
    }

    private void extension() {
	if (currToken == DIGIT_0_TOK || currToken == DIGIT_1_TOK
		 || currToken == DIGIT_2_TOK || currToken == DIGIT_3_TOK
		 || currToken == DIGIT_4_TOK || currToken == DIGIT_5_TOK
		 || currToken == DIGIT_6_TOK || currToken == DIGIT_7_TOK
		 || currToken == DIGIT_8_TOK || currToken == DIGIT_9_TOK) {
    digit();
    digit();
    digit();
    digit(); 
    }
    else error();

    private void digit() {
	if (currToken == DIGIT_0_TOK || currToken == DIGIT_1_TOK
		 || currToken == DIGIT_2_TOK || currToken == DIGIT_3_TOK
		 || currToken == DIGIT_4_TOK || currToken == DIGIT_5_TOK
		 || currToken == DIGIT_6_TOK || currToken == DIGIT_7_TOK
		 || currToken == DIGIT_8_TOK || currToken == DIGIT_9_TOK) {
        match(currToken);	
    }
    else {
        error();
    }
}
