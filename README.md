# sql-challenge
## Employee Information Data analysis
> This project began with the creation of a PostgreSQL database created from the csv files found in the *data* folder. We analyzed a number of attributes of the database that displayed our skill with SQL data manipulation.
* List of employee information
* List of employees hired in 1986
* List of departments with their department names and the information for the managers of each department
* List of each employee with their department name
* List of all employees with the name "Hercules" whose last names begin with the letter B (There are a surprising number of them)
* List of all the people in the Sales department
* List of all the people in the Sales and Development departments
* List of the frequency of last names among our employees.


![Database Structure](/Database_Structure.png)
<p align = "center"> **Database Structure Diagram** </p>

## *The Twist*
> As we examined the data we became increasingly concerned that it was fake in some way... We created a Jupyter Notebook titled *SQL_challenge_analysis* and imported our data from the database into pandas dataframes. We then binned the data and visualized the distribution of people in each salary grouping. Finding nothing amiss we continued to press in. We displayed the frequency with which a specific salary occurred in our salary column and uncovered... ~1/3 of the people in the company make exactly $40,000 / year. This is immediately suspicious that so many people have an exactly identical salary. But there are explanations for this, perhaps the company pays a specific amount above minimum wage to specific subsets of workers. Finally, we average our salaries by title and uncover something interesting... We discover that the most senior staff in the company makes ~120% of what the lowest level engineer in the company. Seeing this incredibly flat distribution we feel confirmed in our suspicions that this dataset has been doctored. It seems more likely that the dataset was generated with a random distribution of salaries across positions instead of broken down into salary brackets that increase meaningfully between positions.

### *The Reveal*
We bring our findings to our boss who applauds our discovery and encourages us to look up ourselves in the dataset. We do so and find:


|emp_no | emp_title_id | birth_date | first_name | last_name | sex | hire_date | salary | salary_bin|
|----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | -----|
|499942 | e0004 | 1/10/1963 | April | Foolsday | F | 2/10/1997 | 40000 | 40k|

One can only hope that our next project will involve some real data.