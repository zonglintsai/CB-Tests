*** Variables ***
${LOAN_PAGE}  https://www.cathaybk.com.tw/cathaybk/personal/loan/calculator/mortgage-budget/
${FLEX_3_INACTIVE}  flex-3
${FLEX_3_ACTIVE}  is-active flex-3|flex-3 is-active
${CLASS_SELECTED}  \s*selected.*
${DISPLAY_BLOCK}  display: block;
${CLASS_IS_ERROR}  .*is-error.*

# XPATH
${CITY_DEFAULT_TEXT}  //ul[@class="transformSelectDropdown"]/li/span[text()='選擇縣市']/..
${CITY_TAIPEI_OPTION}  //select[@id="cityLtv"]/option[@value="台北市"]
${DISTRICT_DEFAULT_TEXT}  //ul[@class="transformSelectDropdown"]/li/span[text()='請選擇區域']/..
${DISTRICT_XINYI_OPTION}  //select[@id="areaLtv"]/option[@value="信義區"]
${LOAN_AMOUNT}  //input[@id="txtAmount"]
${LOAN_TERM_20Y}  //input[@id="rdoLoanTerm20y"]/../../..
${LOAN_TERM_30Y}  //input[@id="rdoLoanTerm30y"]/../../..
${LOAN_TERM_Other}  //input[@id="rdoLoanTermOther"]/../../..
${LOAN_TERM_30Y_INPUT}  //input[@id="rdoLoanTerm30y"]/../label
${INTEREST_RATE}  //input[@id="txtInterestRate"]
${CALC_BUTTON}  //a[@id="btnCalculate"]
${RESET_BUTTON}  //a[@id="btnReset"]

${MAX_LOAN}  //span[@id="spanMaxLoan"]
${HOUSE_PRICE}  //span[@id="spanHousePrice"]
${SELF_PREPARE}  //span[@id="spanSelfPrepare"]
${BORROW_MAX}  //span[@id="spanBorrowMax"]

${CITY_WARN_TEXT}  //div/span[text()='請選擇縣市']/../..
${DISTRICT_WARN_TEXT}  //div/span[text()='請選擇行政區']/../..
${LOAN_AMOUNT_WARN_TEXT}  //div/span[text()='請輸入整數貸款金額']/../../..
${INTEREST_RATE_WARN_TEXT}  //div/span[text()='請輸入數字']/../../..