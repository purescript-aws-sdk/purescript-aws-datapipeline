## Module AWS.DataPipeline.Requests

#### `activatePipeline`

``` purescript
activatePipeline :: forall eff. Service -> ActivatePipelineInput -> Aff (exception :: EXCEPTION | eff) ActivatePipelineOutput
```

<p>Validates the specified pipeline and starts processing pipeline tasks. If the pipeline does not pass validation, activation fails.</p> <p>If you need to pause the pipeline to investigate an issue with a component, such as a data source or script, call <a>DeactivatePipeline</a>.</p> <p>To activate a finished pipeline, modify the end date for the pipeline and then activate it.</p>

#### `addTags`

``` purescript
addTags :: forall eff. Service -> AddTagsInput -> Aff (exception :: EXCEPTION | eff) AddTagsOutput
```

<p>Adds or modifies tags for the specified pipeline.</p>

#### `createPipeline`

``` purescript
createPipeline :: forall eff. Service -> CreatePipelineInput -> Aff (exception :: EXCEPTION | eff) CreatePipelineOutput
```

<p>Creates a new, empty pipeline. Use <a>PutPipelineDefinition</a> to populate the pipeline.</p>

#### `deactivatePipeline`

``` purescript
deactivatePipeline :: forall eff. Service -> DeactivatePipelineInput -> Aff (exception :: EXCEPTION | eff) DeactivatePipelineOutput
```

<p>Deactivates the specified running pipeline. The pipeline is set to the <code>DEACTIVATING</code> state until the deactivation process completes.</p> <p>To resume a deactivated pipeline, use <a>ActivatePipeline</a>. By default, the pipeline resumes from the last completed execution. Optionally, you can specify the date and time to resume the pipeline.</p>

#### `deletePipeline`

``` purescript
deletePipeline :: forall eff. Service -> DeletePipelineInput -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Deletes a pipeline, its pipeline definition, and its run history. AWS Data Pipeline attempts to cancel instances associated with the pipeline that are currently being processed by task runners.</p> <p>Deleting a pipeline cannot be undone. You cannot query or restore a deleted pipeline. To temporarily pause a pipeline instead of deleting it, call <a>SetStatus</a> with the status set to <code>PAUSE</code> on individual components. Components that are paused by <a>SetStatus</a> can be resumed.</p>

#### `describeObjects`

``` purescript
describeObjects :: forall eff. Service -> DescribeObjectsInput -> Aff (exception :: EXCEPTION | eff) DescribeObjectsOutput
```

<p>Gets the object definitions for a set of objects associated with the pipeline. Object definitions are composed of a set of fields that define the properties of the object.</p>

#### `describePipelines`

``` purescript
describePipelines :: forall eff. Service -> DescribePipelinesInput -> Aff (exception :: EXCEPTION | eff) DescribePipelinesOutput
```

<p>Retrieves metadata about one or more pipelines. The information retrieved includes the name of the pipeline, the pipeline identifier, its current state, and the user account that owns the pipeline. Using account credentials, you can retrieve metadata about pipelines that you or your IAM users have created. If you are using an IAM user account, you can retrieve metadata about only those pipelines for which you have read permissions.</p> <p>To retrieve the full pipeline definition instead of metadata about the pipeline, call <a>GetPipelineDefinition</a>.</p>

#### `evaluateExpression`

``` purescript
evaluateExpression :: forall eff. Service -> EvaluateExpressionInput -> Aff (exception :: EXCEPTION | eff) EvaluateExpressionOutput
```

<p>Task runners call <code>EvaluateExpression</code> to evaluate a string in the context of the specified object. For example, a task runner can evaluate SQL queries stored in Amazon S3.</p>

#### `getPipelineDefinition`

``` purescript
getPipelineDefinition :: forall eff. Service -> GetPipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) GetPipelineDefinitionOutput
```

<p>Gets the definition of the specified pipeline. You can call <code>GetPipelineDefinition</code> to retrieve the pipeline definition that you provided using <a>PutPipelineDefinition</a>.</p>

#### `listPipelines`

``` purescript
listPipelines :: forall eff. Service -> ListPipelinesInput -> Aff (exception :: EXCEPTION | eff) ListPipelinesOutput
```

<p>Lists the pipeline identifiers for all active pipelines that you have permission to access.</p>

#### `pollForTask`

``` purescript
pollForTask :: forall eff. Service -> PollForTaskInput -> Aff (exception :: EXCEPTION | eff) PollForTaskOutput
```

<p>Task runners call <code>PollForTask</code> to receive a task to perform from AWS Data Pipeline. The task runner specifies which tasks it can perform by setting a value for the <code>workerGroup</code> parameter. The task returned can come from any of the pipelines that match the <code>workerGroup</code> value passed in by the task runner and that was launched using the IAM user credentials specified by the task runner.</p> <p>If tasks are ready in the work queue, <code>PollForTask</code> returns a response immediately. If no tasks are available in the queue, <code>PollForTask</code> uses long-polling and holds on to a poll connection for up to a 90 seconds, during which time the first newly scheduled task is handed to the task runner. To accomodate this, set the socket timeout in your task runner to 90 seconds. The task runner should not call <code>PollForTask</code> again on the same <code>workerGroup</code> until it receives a response, and this can take up to 90 seconds. </p>

#### `putPipelineDefinition`

``` purescript
putPipelineDefinition :: forall eff. Service -> PutPipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) PutPipelineDefinitionOutput
```

<p>Adds tasks, schedules, and preconditions to the specified pipeline. You can use <code>PutPipelineDefinition</code> to populate a new pipeline.</p> <p> <code>PutPipelineDefinition</code> also validates the configuration as it adds it to the pipeline. Changes to the pipeline are saved unless one of the following three validation errors exists in the pipeline. </p> <ol> <li>An object is missing a name or identifier field.</li> <li>A string or reference field is empty.</li> <li>The number of objects in the pipeline exceeds the maximum allowed objects.</li> <li>The pipeline is in a FINISHED state.</li> </ol> <p> Pipeline object definitions are passed to the <code>PutPipelineDefinition</code> action and returned by the <a>GetPipelineDefinition</a> action. </p>

#### `queryObjects`

``` purescript
queryObjects :: forall eff. Service -> QueryObjectsInput -> Aff (exception :: EXCEPTION | eff) QueryObjectsOutput
```

<p>Queries the specified pipeline for the names of objects that match the specified set of conditions.</p>

#### `removeTags`

``` purescript
removeTags :: forall eff. Service -> RemoveTagsInput -> Aff (exception :: EXCEPTION | eff) RemoveTagsOutput
```

<p>Removes existing tags from the specified pipeline.</p>

#### `reportTaskProgress`

``` purescript
reportTaskProgress :: forall eff. Service -> ReportTaskProgressInput -> Aff (exception :: EXCEPTION | eff) ReportTaskProgressOutput
```

<p>Task runners call <code>ReportTaskProgress</code> when assigned a task to acknowledge that it has the task. If the web service does not receive this acknowledgement within 2 minutes, it assigns the task in a subsequent <a>PollForTask</a> call. After this initial acknowledgement, the task runner only needs to report progress every 15 minutes to maintain its ownership of the task. You can change this reporting time from 15 minutes by specifying a <code>reportProgressTimeout</code> field in your pipeline.</p> <p>If a task runner does not report its status after 5 minutes, AWS Data Pipeline assumes that the task runner is unable to process the task and reassigns the task in a subsequent response to <a>PollForTask</a>. Task runners should call <code>ReportTaskProgress</code> every 60 seconds.</p>

#### `reportTaskRunnerHeartbeat`

``` purescript
reportTaskRunnerHeartbeat :: forall eff. Service -> ReportTaskRunnerHeartbeatInput -> Aff (exception :: EXCEPTION | eff) ReportTaskRunnerHeartbeatOutput
```

<p>Task runners call <code>ReportTaskRunnerHeartbeat</code> every 15 minutes to indicate that they are operational. If the AWS Data Pipeline Task Runner is launched on a resource managed by AWS Data Pipeline, the web service can use this call to detect when the task runner application has failed and restart a new instance.</p>

#### `setStatus`

``` purescript
setStatus :: forall eff. Service -> SetStatusInput -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Requests that the status of the specified physical or logical pipeline objects be updated in the specified pipeline. This update might not occur immediately, but is eventually consistent. The status that can be set depends on the type of object (for example, DataNode or Activity). You cannot perform this operation on <code>FINISHED</code> pipelines and attempting to do so returns <code>InvalidRequestException</code>.</p>

#### `setTaskStatus`

``` purescript
setTaskStatus :: forall eff. Service -> SetTaskStatusInput -> Aff (exception :: EXCEPTION | eff) SetTaskStatusOutput
```

<p>Task runners call <code>SetTaskStatus</code> to notify AWS Data Pipeline that a task is completed and provide information about the final status. A task runner makes this call regardless of whether the task was sucessful. A task runner does not need to call <code>SetTaskStatus</code> for tasks that are canceled by the web service during a call to <a>ReportTaskProgress</a>.</p>

#### `validatePipelineDefinition`

``` purescript
validatePipelineDefinition :: forall eff. Service -> ValidatePipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) ValidatePipelineDefinitionOutput
```

<p>Validates the specified pipeline definition to ensure that it is well formed and can be run without error.</p>


