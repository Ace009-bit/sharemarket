#!/bin/bash

# Color definitions
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
GREEN='\033[1;32m'
NC='\033[0m'

# Banner
echo -e "${CYAN}"
echo " ███████╗██╗  ██╗ █████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ██████╗ ████████╗"
echo " ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗██╔══██╗╚══██╔══╝"
echo " █████╗  ███████║███████║██████╔╝█████╗  ██╔████╔██║███████║██████╔╝   ██║   "
echo " ██╔══╝  ██╔══██║██╔══██║██╔═══╝ ██╔══╝  ██║╚██╔╝██║██╔══██║██╔═══╝    ██║   "
echo " ███████╗██║  ██║██║  ██║██║     ███████╗██║ ╚═╝ ██║██║  ██║██║        ██║   "
echo " ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝        ╚═╝   "
echo "                             Share Market Toolkit                              "
echo "                              By SAURABH aka (Ace)                                "
echo -e "${NC}"

# Main menu
while true; do
    echo -e "${GREEN}Main Menu:${NC}"
    echo "1. View All Shares in the Market"
    echo "2. Top Stock Predictions"
    echo "3. Latest Market News"
    echo "4. View Global Shares (Apple, Microsoft, Tesla, etc.)"
    echo "5. View All Indian Shares"
    echo "6. Exit"
    echo -n "Enter your choice [1-6]: "
    read choice

    case $choice in
    1) # View all shares
        echo -e "${YELLOW}[INFO] Fetching all shares from the market...${NC}"
        python3 - <<EOF
import yfinance as yf

# Global stock indices
print("\nMajor Market Indexes:")
indexes = ["^GSPC", "^DJI", "^IXIC", "^FTSE", "^N225"]
for index in indexes:
    ticker = yf.Ticker(index)
    print(f"{index}: {ticker.info['shortName']} - {ticker.info['regularMarketPrice']} {ticker.info['currency']}")

# Global stocks
print("\nGlobal Stocks:")
stocks = ["AAPL", "MSFT", "TSLA", "AMZN", "GOOGL"]
for stock in stocks:
    ticker = yf.Ticker(stock)
    print(f"{stock}: {ticker.info['shortName']} - {ticker.history(period='1d')['Close'].iloc[-1]} USD")

# Indian stocks
print("\nIndian Stocks:")
indian_stocks = ["RELIANCE.BO", "BHARTIARTL.BO", "HDFCBANK.BO", "INFY.BO", "TCS.BO"]
for stock in indian_stocks:
    ticker = yf.Ticker(stock)
    print(f"{stock}: {ticker.info['shortName']} - {ticker.history(period='1d')['Close'].iloc[-1]} INR")
EOF
        echo ""
        ;;
    2) # Top stock predictions
        echo -e "${YELLOW}[INFO] Fetching top stock predictions...${NC}"
        python3 - <<EOF
import yfinance as yf

# Global stocks for prediction
print("\nTop Global Stock Predictions:\n")
global_stocks = ["AAPL", "MSFT", "TSLA", "AMZN", "GOOGL"]
for stock in global_stocks:
    ticker = yf.Ticker(stock)
    current_price = ticker.history(period="1d")["Close"].iloc[-1]
    predicted_price = current_price * 1.05  # Example +5%
    print(f"{stock}: Current Price = {current_price:.2f} USD | Predicted Price (Next Week) = {predicted_price:.2f} USD")

# Indian stocks for prediction
print("\nTop Indian Stock Predictions:\n")
indian_stocks = ["RELIANCE.BO", "BHARTIARTL.BO", "HDFCBANK.BO", "INFY.BO", "TCS.BO"]
for stock in indian_stocks:
    ticker = yf.Ticker(stock)
    current_price = ticker.history(period="1d")["Close"].iloc[-1]
    predicted_price = current_price * 1.05  # Example +5%
    print(f"{stock}: Current Price = {current_price:.2f} INR | Predicted Price (Next Week) = {predicted_price:.2f} INR")
EOF
        echo ""
        ;;
    3) # Latest market news
        echo -e "${YELLOW}[INFO] Fetching latest market news...${NC}"
        # You can integrate a news API here to fetch real-time market news
        echo "Displaying market news..." # Placeholder
        echo ""
        ;;
    4) # View global shares
        echo -e "${YELLOW}[INFO] Fetching global shares data...${NC}"
        python3 - <<EOF
import yfinance as yf

# Global stocks
print("\nGlobal Stocks:")
stocks = ["AAPL", "MSFT", "TSLA", "AMZN", "GOOGL"]
for stock in stocks:
    ticker = yf.Ticker(stock)
    print(f"{stock}: {ticker.info['shortName']} - {ticker.history(period='1d')['Close'].iloc[-1]} USD")
EOF
        echo ""
        ;;
    5) # View all Indian shares
        echo -e "${YELLOW}[INFO] Fetching all Indian shares...${NC}"
        python3 - <<EOF
import yfinance as yf

# List of 50+ Indian stocks
indian_stocks = [
    "RELIANCE.BO", "BHARTIARTL.BO", "HDFCBANK.BO", "INFY.BO", "TCS.BO", 
    "ICICIBANK.BO", "SBIN.BO", "LT.BO", "AXISBANK.BO", "MARUTI.BO", 
    "WIPRO.BO", "HCLTECH.BO", "TATAMOTORS.BO", "M&M.BO", "ITC.BO", 
    "HDFC.BO", "KOTAKBANK.BO", "NESTLEIND.BO", "SUNPHARMA.BO", "ULTRACEMCO.BO", 
    "BAJFINANCE.BO", "CIPLA.BO", "RELIANCEPOWER.BO", "UPL.BO", "DRREDDY.BO", 
    "BOSCHLTD.BO", "ADANIGREEN.BO", "TECHM.BO", "POWERGRID.BO", "ONGC.BO", 
    "ASIANPAINT.BO", "GRASIM.BO", "DIVISLAB.BO", "TATACONSUM.BO", "INDUSINDBK.BO",
    "EICHERMOT.BO", "HINDUNILVR.BO", "PNB.BO", "SHREECEM.BO", "JSWSTEEL.BO",
    "BHEL.BO", "NMDCC.BO", "VOLTAS.BO", "COLPAL.BO", "AMBUJACEM.BO", 
    "ICICIGI.BO", "BANDHANBANK.BO", "RECLTD.BO", "EXIDEIND.BO", "HINDALCO.BO"
]

# Fetch prices
for stock in indian_stocks:
    ticker = yf.Ticker(stock)
    print(f"{stock}: {ticker.info['shortName']} - {ticker.history(period='1d')['Close'].iloc[-1]} INR")
EOF
        echo ""
        ;;
    6) # Exit
        echo "Exiting the toolkit. Goodbye!"
        exit
        ;;
    *)
        echo "Invalid option! Please try again."
        ;;
    esac
done
