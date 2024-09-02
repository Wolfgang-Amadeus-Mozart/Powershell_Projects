Workflow getTime {
    while(1){
        (get-date).ToString() + "From script" #get time and date
        Start-Sleep -Seconds 2 #execute every two seconds
    }
}

function execut_job {
    return getTime -AsJob #runs getTime workflow as a job, so it runs quitly
}

function get_job_status {
    param($job) #needs to pass the job to function

    Receive-job $job #get the results of job
}

function stop_job {
    param($job_to_stop)  #needs to pass the job to function
    
    Stop-Job $job_to_stop #stop the job
}


$job_execution = execut_job #storaging the function as a variable

$job_execution #running the functions

get_job_status -job $job_execution #checking the status of job

stop_job -job_to_stop $job_execution #stoping the job