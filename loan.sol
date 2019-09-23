pragma solidity >=0.4.22 <0.6.0; 

contract Loan {
    
    struct loantaker {
        string name;
        uint AskedLoanAmount;
        bool eligible;
        uint Salary;
        uint AllowedLoanAmount;
        uint SanctionedLoan;
    }
    
    struct loangiver{
        uint dLoanAmount;
        bool deligible;
    }
    loantaker lwala;
    loangiver dwala;
     
    function setName(string memory nm) public {
        lwala.name = nm;
    }
    function setLoanAmount(uint x) public {
       lwala.AskedLoanAmount  = x;
    }
    function setSalary(uint x) public {
       lwala.Salary  = x;
    }
    function setGLoanAmount(uint x) public {
       dwala.dLoanAmount  = x;
    }
    function getAllowedLoan()public view returns (uint){
        return lwala.AllowedLoanAmount;
    }
    function getSanctionedLoan()public view returns (uint){
        return lwala.SanctionedLoan;
    }
    function getGiverEligibility()public view returns (bool){
        return dwala.deligible;
    }
    function getTakerEligibility()public view returns (bool){
        return lwala.eligible;
    }
    function determineGiverEligibility() public {
        if (dwala.dLoanAmount >= lwala.AllowedLoanAmount ) dwala.deligible = true;
        else dwala.deligible = false;
        
    }
    function sanctionLoan() public {
        if (dwala.deligible == true && lwala.eligible == true ) {
            if (lwala.AllowedLoanAmount<=lwala.AskedLoanAmount)
            {
                lwala.SanctionedLoan = lwala.AllowedLoanAmount;
                dwala.dLoanAmount-=lwala.AllowedLoanAmount;
            }
            else
            {
                lwala.AllowedLoanAmount=lwala.AskedLoanAmount;
                lwala.SanctionedLoan = lwala.AllowedLoanAmount;
                dwala.dLoanAmount-=lwala.AllowedLoanAmount;
            }
        }
    }
    function allowedCalculator() public{
        lwala.AllowedLoanAmount=60*lwala.Salary;
        lwala.AllowedLoanAmount=lwala.AllowedLoanAmount/10;
    }
    function determineTakerEligibility() public{
        if (lwala.AskedLoanAmount<=lwala.AllowedLoanAmount && lwala.SanctionedLoan==0) lwala.eligible=true;
        else lwala.eligible=false;
    }
    function wantToTake() public{
        if (lwala.eligible==false) {
            lwala.eligible=true;
        }
    }
    function flushloan() public{
        lwala.SanctionedLoan=0;
    }
}