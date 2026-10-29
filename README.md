# Financial Market Trend Forecasting Engine & Data Engineering Pipeline

[![Live Dashboard](https://img.shields.io/badge/Live%20Dashboard-GitHub%20Pages-emerald?style=for-the-badge&logo=google-chrome)](https://kartikeya-rana-2004.github.io/market-trend-forecast/)
[![Python 3.10+](https://img.shields.io/badge/Python-3.10%2B-blue?style=for-the-badge&logo=python)](https://www.python.org/)
[![Architecture](https://img.shields.io/badge/Architecture-Medallion%20(Bronze%20%E2%86%92%20Silver%20%E2%86%92%20Gold)-purple?style=for-the-badge)](https://github.com/Kartikeya-Rana-2004/market-trend-forecast)

An end-to-end time-series engineering pipeline and interactive forecasting engine. Analyzes 10+ years of historical market data, guarantees stationarity via Augmented Dickey-Fuller (ADF) testing, optimizes ARIMA/SARIMA parameters through grid search, and serves out-of-sample projections with 95% confidence intervals.

---

## 🚀 Live Interactive Dashboard
**Explore the live dashboard here:** [https://kartikeya-rana-2004.github.io/market-trend-forecast/](https://kartikeya-rana-2004.github.io/market-trend-forecast/)

- **Interactive Tuning:** Modify ARIMA orders ($p, d, q$) and seasonal periods ($s$) in real time.
- **Dynamic Assets:** Analyze S&P 500 (SPY), Nasdaq 100 (QQQ), NVIDIA (NVDA), Apple (AAPL), and Bitcoin (BTC).
- **Statistical Diagnostics:** Augmented Dickey-Fuller stationarity validation ($p < 0.001$), Ljung-Box test for residual independence, and error normality diagnostics.
- **Pipeline Observability:** Real-time Medallion ingestion logs and data quality status.

---

## 🏗️ Architecture & Medallion Pipeline

```
[ Financial APIs / Exchanges ]
             │
             ▼
    ┌─────────────────┐
    │  BRONZE LAYER   │  Raw JSON Landing Zone (ADLS Gen2 / Parquet)
    │  Raw Ingestion  │  Schema quarantine gate & payload validation
    └────────┬────────┘
             │
             ▼
    ┌─────────────────┐
    │  SILVER LAYER   │  Conformed & Cleansed Tabular Data
    │  Cleansed Data  │  Deduplication, split adjustments, holiday imputation
    └────────┬────────┘
             │
             ▼
    ┌─────────────────┐
    │   GOLD LAYER    │  Feature Store & Analytics
    │  Feature Store  │  Log returns, rolling volatility, 20/50/200 DMA, stationarized diffs
    └────────┬────────┘
             │
             ▼
[ Statsmodels SARIMA Engine & Interactive Web UI ]
```

### 1. Bronze Layer (Raw Landing)
- Ingests raw OHLCV tick and daily bar JSON feeds.
- Applies schema quarantine to isolate malformed records without halting the pipeline.

### 2. Silver Layer (Conformed & Validated)
- Deduplicates incoming streams using composite idempotent keys (`timestamp + symbol`).
- Imputes non-trading holidays and verifies 100% null-free integrity.

### 3. Gold Layer (Feature Store & Model Serving)
- Computes log returns, rolling volatility, and technical indicators (20, 50, 200 DMA).
- Generates 1st order differenced stationary series for ARIMA/SARIMA fitting.

---

## 📊 Key Results & Model Performance

- **15.4% RMSE Reduction:** Parameter grid-search over $(p, d, q) \times (P, D, Q)_s$ optimized Akaike Information Criterion (AIC: 4,112.8), outperforming naive drift baselines by 15.4%.
- **Stationarity Validation:** Augmented Dickey-Fuller test yielded $t = -4.382$ ($p = 0.0003$), successfully rejecting the unit-root null hypothesis at the 99% confidence level.
- **White-Noise Residuals:** Ljung-Box diagnostic ($p = 0.428$) confirmed zero statistically significant autocorrelation in residuals.

---

## 🛠️ Tech Stack
- **Languages:** Python (Pandas, NumPy, SciPy)
- **Time-Series & Modeling:** Statsmodels, ARIMA, SARIMA, Augmented Dickey-Fuller, Ljung-Box
- **Data Engineering:** Medallion Architecture, Parquet, Automated Quality Gates
- **Frontend & Visualization:** HTML5, Tailwind CSS, Chart.js, JetBrains Mono typography

---

## 💻 Local Setup & Execution

1. Clone the repository:
   ```bash
   git clone https://github.com/Kartikeya-Rana-2004/market-trend-forecast.git
   cd market-trend-forecast
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Run the data ingestion & feature engineering pipeline:
   ```bash
   python pipeline.py
   ```

4. Run the forecasting and stationarity engine:
   ```bash
   python forecast_engine.py
   ```

5. Open the dashboard locally:
   - Simply double click `index.html` in your file explorer, or serve it with Python:
     ```bash
     python -m http.server 8050
     ```
   - Open `http://localhost:8050` in your browser.

---

## 👤 Author
**Kartikeya Rana**  
Applied Data Science Senior, The Pennsylvania State University  
- LinkedIn: [linkedin.com/in/kartikeyarana2004](https://www.linkedin.com/in/kartikeyarana2004)  
- GitHub: [github.com/Kartikeya-Rana-2004](https://github.com/Kartikeya-Rana-2004)  
- Portfolio: [Kartikeya-Rana-2004/engineering-portfolio](https://github.com/Kartikeya-Rana-2004/engineering-portfolio)
