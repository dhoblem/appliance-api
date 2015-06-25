## Summary of the approach I followed and gems used
```
1. Implemented a rake task which will keep monitoring the targets for reachability and maintain the count in TargetStatics DB
2. This rake task would be then scheduled to run on a regular intervals to keep checking for the target status
3. Gems Used:
  a. Devise : For user authentication
  b. cancan : Role based implementation
  c. bootstrap-sass : styling 
  d. will-paginate : Pagination so as to make the loading faster
  e. whenever : For scheduling rake-tasks same like cron-jobs
  f. chartkick : To draw simple pie-chart

```
NOTE: 1. For First time connecting to the system, please sign-up with some user
      2. After rake:db setup command please make sure to run below rake tasks, then start the rails server;
```
            a. rake db:seed
            b. rake targets:monitor(rake task will keep running for a while, just keep it running and you may start exploring the application. No need to wait until it finishes.
```
