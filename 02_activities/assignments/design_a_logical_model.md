# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

![Assignment1_question1_bookstore](https://github.com/user-attachments/assets/4bf3527d-89ae-4b71-a9ff-aaac250f0d6c)


## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.

Added Employee_shift table in the above ERD
![Assignment1_question2](https://github.com/user-attachments/assets/c52609dc-83ae-4ec3-96e3-8c516cea39ec)


## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._
![Customer_address](https://github.com/user-attachments/assets/9c980ccb-1baa-4c1b-8522-2f8baf27f60d)

Bonus: Are there privacy implications to this, why or why not?
```
There are privacy implications in both scenarios.
 In Type 1 keeping the current address is low risk and it should follow the data privacy law. To keep it safe, there will be authorization access. Only authorised persons can access sensitive data.

While in Type 2, Keeping a history of customer addresses may increase the risk of sensitive information being exposed over time, especially if an address can reveal private details (e.g., someone’s place of residence or work). It will be hard to maintain data privacy law and higher chances of data breaching. 
Your answer...
```

## Question 4
Review the AdventureWorks Schema [here](https://imgur.com/a/u0m8fX6)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
Your answer...
After reviewing the Adventure schema, Out of many below are two highlighted differences:
The schema tables are more in depth with clear idea about data type and connection between tables
First the schema is planned and designed according to the department. And then each department has detailed tables with primary keys and foreign keys

I would like to add more details in tables and would try to add HumanResources and dbo schemas. 

```

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `September 28, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-4-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
