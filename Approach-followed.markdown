## Summary of the Overview/ Approach  followed and Gems used
```
Overview of Application:
1. The default-page would ask you create a user to sign-up. Please create a user with valid email-id and password.
2. After Sign-in, it will take you to the dashboard page, where you can see the targets listing with a pie-chart of reachable vs un-reachable target analysis.
3. On the targets listing page, you can see the status of each target against it.
4. The corresponding appliace has a hyper-link which will take you to the appliance details page.

```
```
Approach followed
1. Implemented a rake task(rake targets:monitor) which will keep updating the status (is_alive) for each of the target in the DB(targets table)
I have scheduled this rake task using 'whenever' gem to run once n a day, so as to get updated data. Sheduling can beed seen at config/schedule.rb.
2. The Pie-chart is prepared based on the data gathered from the above rake task, which gives us the count of total reachable and/or unreachable targets.
3. Gems Used:
  ```
  a. Devise : For user authentication
  b. cancan : Role based implementation
  c. bootstrap-sass : styling 
  d. will-paginate : Pagination so as to make the loading faster
  e. whenever : For scheduling rake-tasks same like cron-jobs
  f. chartkick : To draw simple pie-chart
  g. capybara : For Sepcs
  ```

```
NOTE: 
```
      After rake:db setup command please make sure to run below rake tasks, then start the rails server;
            a. rake db:seed
            b. rake targets:monitor(This rake task will start checking for target's availability and keep updating the status at targets table (is_alive field))
```
Future Enhancements:
Listing down a few things which I would like to include in this application further. 
```
1. Add seaching a target, based on  name/address.
2. Sort the targets per-columns OR sort based on the status.
```
