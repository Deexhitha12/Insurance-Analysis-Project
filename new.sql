#new
SELECT 
    ib.Account_Exe_ID,
    ib.Employee_Name,
    ib.New_Budget AS Target_new,
    
    -- Placed Achievement (Brokerage + Fees)
    SUM(COALESCE(b.Amount, 0) + COALESCE(f.Amount, 0)) AS Achieved_New,
    
    -- Invoiced Achievement
    SUM(COALESCE(inv.Amount, 0)) AS Invoiced_New

FROM 
    individual_budgets ib

-- Join with Brokerage table
LEFT JOIN 
    (SELECT 
        `Account Exe ID`,
        Amount
    FROM 
        brokerage
    WHERE 
        income_class = 'NEW'
    ) b 
ON 
    ib.Account_Exe_ID = b.`Account Exe ID`

-- Join with Fees table
LEFT JOIN 
    (SELECT 
        `Account Exe ID`,
        Amount
    FROM 
        fees
    WHERE 
        income_class = 'NEW'
    ) f 
ON 
    ib.Account_Exe_ID = f.`Account Exe ID`

-- Join with Invoice table
LEFT JOIN 
    (SELECT 
        `Account Exe ID`,
        Amount
    FROM 
        invoice
    #WHERE 
        #income_class = 'NEW'
    ) inv 
ON 
    ib.Account_Exe_ID = inv.`Account Exe ID`

GROUP BY 
    ib.Account_Exe_ID,
    ib.Employee_Name,
    ib.New_Budget;