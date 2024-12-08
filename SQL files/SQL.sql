-- 1. -No of Invoice by Accnt Exec


SELECT 
    invoice_202001231041.`Account Executive`, 
    COUNT(invoice_202001231041.`invoice_number`) AS InvoiceCount
FROM 
    invoice_202001231041
GROUP BY 
    invoice_202001231041.`Account Executive`
order by InvoiceCount asc;
    

-- 2-Yearly Meeting Count

SELECT 
    YEAR(STR_TO_DATE(meeting_list_202001231041.`meeting_date`, '%d/%m/%Y')) AS Meet_Year, 
    COUNT(*) AS MeetingCount
FROM 
    meeting_list_202001231041
GROUP BY 
    YEAR(STR_TO_DATE(meeting_list_202001231041.`meeting_date`, '%d/%m/%Y'))
ORDER BY MeetingCount;
    
    
-- 4 Stage Funnel by Revenue

SELECT 
    gcrm_opportunity_202001231041.`stage`, 
    SUM(gcrm_opportunity_202001231041.`revenue_amount`) AS TotalRevenue
FROM 
    gcrm_opportunity_202001231041
GROUP BY 
    gcrm_opportunity_202001231041.`stage`;
    
-- 5  Number of Meetings by Account Executive:

SELECT 
    meeting_list_202001231041.`Account Executive`, 
    COUNT(meeting_list_202001231041.`meeting_date`) AS MeetingCount
FROM 
    meeting_list_202001231041
GROUP BY 
    meeting_list_202001231041.`Account Executive`
order by MeetingCount asc;


-- 6  Top Open Opportunities:

SELECT 
    gcrm_opportunity_202001231041.`opportunity_name`, 
    gcrm_opportunity_202001231041.`revenue_amount`
FROM 
    gcrm_opportunity_202001231041

ORDER BY 
    gcrm_opportunity_202001231041.`revenue_amount` DESC;






