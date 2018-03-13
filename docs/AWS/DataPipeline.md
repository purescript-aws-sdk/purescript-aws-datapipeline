## Module AWS.DataPipeline

<p>AWS Data Pipeline configures and manages a data-driven workflow called a pipeline. AWS Data Pipeline handles the details of scheduling and ensuring that data dependencies are met so that your application can focus on processing the data.</p> <p>AWS Data Pipeline provides a JAR implementation of a task runner called AWS Data Pipeline Task Runner. AWS Data Pipeline Task Runner provides logic for common data management scenarios, such as performing database queries and running data analysis using Amazon Elastic MapReduce (Amazon EMR). You can use AWS Data Pipeline Task Runner as your task runner, or you can write your own task runner to provide custom data management.</p> <p>AWS Data Pipeline implements two main sets of functionality. Use the first set to create a pipeline and define data sources, schedules, dependencies, and the transforms to be performed on the data. Use the second set in your task runner application to receive the next task ready for processing. The logic for performing the task, such as querying the data, running data analysis, or converting the data from one format to another, is contained within the task runner. The task runner performs the task assigned to it by the web service, reporting progress to the web service as it does so. When the task is done, the task runner reports the final success or failure of the task to the web service.</p>

#### `activatePipeline`

``` purescript
activatePipeline :: forall eff. ActivatePipelineInput -> Aff (exception :: EXCEPTION | eff) ActivatePipelineOutput
```

<p>Validates the specified pipeline and starts processing pipeline tasks. If the pipeline does not pass validation, activation fails.</p> <p>If you need to pause the pipeline to investigate an issue with a component, such as a data source or script, call <a>DeactivatePipeline</a>.</p> <p>To activate a finished pipeline, modify the end date for the pipeline and then activate it.</p>

#### `addTags`

``` purescript
addTags :: forall eff. AddTagsInput -> Aff (exception :: EXCEPTION | eff) AddTagsOutput
```

<p>Adds or modifies tags for the specified pipeline.</p>

#### `createPipeline`

``` purescript
createPipeline :: forall eff. CreatePipelineInput -> Aff (exception :: EXCEPTION | eff) CreatePipelineOutput
```

<p>Creates a new, empty pipeline. Use <a>PutPipelineDefinition</a> to populate the pipeline.</p>

#### `deactivatePipeline`

``` purescript
deactivatePipeline :: forall eff. DeactivatePipelineInput -> Aff (exception :: EXCEPTION | eff) DeactivatePipelineOutput
```

<p>Deactivates the specified running pipeline. The pipeline is set to the <code>DEACTIVATING</code> state until the deactivation process completes.</p> <p>To resume a deactivated pipeline, use <a>ActivatePipeline</a>. By default, the pipeline resumes from the last completed execution. Optionally, you can specify the date and time to resume the pipeline.</p>

#### `deletePipeline`

``` purescript
deletePipeline :: forall eff. DeletePipelineInput -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Deletes a pipeline, its pipeline definition, and its run history. AWS Data Pipeline attempts to cancel instances associated with the pipeline that are currently being processed by task runners.</p> <p>Deleting a pipeline cannot be undone. You cannot query or restore a deleted pipeline. To temporarily pause a pipeline instead of deleting it, call <a>SetStatus</a> with the status set to <code>PAUSE</code> on individual components. Components that are paused by <a>SetStatus</a> can be resumed.</p>

#### `describeObjects`

``` purescript
describeObjects :: forall eff. DescribeObjectsInput -> Aff (exception :: EXCEPTION | eff) DescribeObjectsOutput
```

<p>Gets the object definitions for a set of objects associated with the pipeline. Object definitions are composed of a set of fields that define the properties of the object.</p>

#### `describePipelines`

``` purescript
describePipelines :: forall eff. DescribePipelinesInput -> Aff (exception :: EXCEPTION | eff) DescribePipelinesOutput
```

<p>Retrieves metadata about one or more pipelines. The information retrieved includes the name of the pipeline, the pipeline identifier, its current state, and the user account that owns the pipeline. Using account credentials, you can retrieve metadata about pipelines that you or your IAM users have created. If you are using an IAM user account, you can retrieve metadata about only those pipelines for which you have read permissions.</p> <p>To retrieve the full pipeline definition instead of metadata about the pipeline, call <a>GetPipelineDefinition</a>.</p>

#### `evaluateExpression`

``` purescript
evaluateExpression :: forall eff. EvaluateExpressionInput -> Aff (exception :: EXCEPTION | eff) EvaluateExpressionOutput
```

<p>Task runners call <code>EvaluateExpression</code> to evaluate a string in the context of the specified object. For example, a task runner can evaluate SQL queries stored in Amazon S3.</p>

#### `getPipelineDefinition`

``` purescript
getPipelineDefinition :: forall eff. GetPipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) GetPipelineDefinitionOutput
```

<p>Gets the definition of the specified pipeline. You can call <code>GetPipelineDefinition</code> to retrieve the pipeline definition that you provided using <a>PutPipelineDefinition</a>.</p>

#### `listPipelines`

``` purescript
listPipelines :: forall eff. ListPipelinesInput -> Aff (exception :: EXCEPTION | eff) ListPipelinesOutput
```

<p>Lists the pipeline identifiers for all active pipelines that you have permission to access.</p>

#### `pollForTask`

``` purescript
pollForTask :: forall eff. PollForTaskInput -> Aff (exception :: EXCEPTION | eff) PollForTaskOutput
```

<p>Task runners call <code>PollForTask</code> to receive a task to perform from AWS Data Pipeline. The task runner specifies which tasks it can perform by setting a value for the <code>workerGroup</code> parameter. The task returned can come from any of the pipelines that match the <code>workerGroup</code> value passed in by the task runner and that was launched using the IAM user credentials specified by the task runner.</p> <p>If tasks are ready in the work queue, <code>PollForTask</code> returns a response immediately. If no tasks are available in the queue, <code>PollForTask</code> uses long-polling and holds on to a poll connection for up to a 90 seconds, during which time the first newly scheduled task is handed to the task runner. To accomodate this, set the socket timeout in your task runner to 90 seconds. The task runner should not call <code>PollForTask</code> again on the same <code>workerGroup</code> until it receives a response, and this can take up to 90 seconds. </p>

#### `putPipelineDefinition`

``` purescript
putPipelineDefinition :: forall eff. PutPipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) PutPipelineDefinitionOutput
```

<p>Adds tasks, schedules, and preconditions to the specified pipeline. You can use <code>PutPipelineDefinition</code> to populate a new pipeline.</p> <p> <code>PutPipelineDefinition</code> also validates the configuration as it adds it to the pipeline. Changes to the pipeline are saved unless one of the following three validation errors exists in the pipeline. </p> <ol> <li>An object is missing a name or identifier field.</li> <li>A string or reference field is empty.</li> <li>The number of objects in the pipeline exceeds the maximum allowed objects.</li> <li>The pipeline is in a FINISHED state.</li> </ol> <p> Pipeline object definitions are passed to the <code>PutPipelineDefinition</code> action and returned by the <a>GetPipelineDefinition</a> action. </p>

#### `queryObjects`

``` purescript
queryObjects :: forall eff. QueryObjectsInput -> Aff (exception :: EXCEPTION | eff) QueryObjectsOutput
```

<p>Queries the specified pipeline for the names of objects that match the specified set of conditions.</p>

#### `removeTags`

``` purescript
removeTags :: forall eff. RemoveTagsInput -> Aff (exception :: EXCEPTION | eff) RemoveTagsOutput
```

<p>Removes existing tags from the specified pipeline.</p>

#### `reportTaskProgress`

``` purescript
reportTaskProgress :: forall eff. ReportTaskProgressInput -> Aff (exception :: EXCEPTION | eff) ReportTaskProgressOutput
```

<p>Task runners call <code>ReportTaskProgress</code> when assigned a task to acknowledge that it has the task. If the web service does not receive this acknowledgement within 2 minutes, it assigns the task in a subsequent <a>PollForTask</a> call. After this initial acknowledgement, the task runner only needs to report progress every 15 minutes to maintain its ownership of the task. You can change this reporting time from 15 minutes by specifying a <code>reportProgressTimeout</code> field in your pipeline.</p> <p>If a task runner does not report its status after 5 minutes, AWS Data Pipeline assumes that the task runner is unable to process the task and reassigns the task in a subsequent response to <a>PollForTask</a>. Task runners should call <code>ReportTaskProgress</code> every 60 seconds.</p>

#### `reportTaskRunnerHeartbeat`

``` purescript
reportTaskRunnerHeartbeat :: forall eff. ReportTaskRunnerHeartbeatInput -> Aff (exception :: EXCEPTION | eff) ReportTaskRunnerHeartbeatOutput
```

<p>Task runners call <code>ReportTaskRunnerHeartbeat</code> every 15 minutes to indicate that they are operational. If the AWS Data Pipeline Task Runner is launched on a resource managed by AWS Data Pipeline, the web service can use this call to detect when the task runner application has failed and restart a new instance.</p>

#### `setStatus`

``` purescript
setStatus :: forall eff. SetStatusInput -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Requests that the status of the specified physical or logical pipeline objects be updated in the specified pipeline. This update might not occur immediately, but is eventually consistent. The status that can be set depends on the type of object (for example, DataNode or Activity). You cannot perform this operation on <code>FINISHED</code> pipelines and attempting to do so returns <code>InvalidRequestException</code>.</p>

#### `setTaskStatus`

``` purescript
setTaskStatus :: forall eff. SetTaskStatusInput -> Aff (exception :: EXCEPTION | eff) SetTaskStatusOutput
```

<p>Task runners call <code>SetTaskStatus</code> to notify AWS Data Pipeline that a task is completed and provide information about the final status. A task runner makes this call regardless of whether the task was sucessful. A task runner does not need to call <code>SetTaskStatus</code> for tasks that are canceled by the web service during a call to <a>ReportTaskProgress</a>.</p>

#### `validatePipelineDefinition`

``` purescript
validatePipelineDefinition :: forall eff. ValidatePipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) ValidatePipelineDefinitionOutput
```

<p>Validates the specified pipeline definition to ensure that it is well formed and can be run without error.</p>

#### `ActivatePipelineInput`

``` purescript
newtype ActivatePipelineInput
  = ActivatePipelineInput { pipelineId :: Id', parameterValues :: NullOrUndefined (ParameterValueList), startTimestamp :: NullOrUndefined (Timestamp) }
```

<p>Contains the parameters for ActivatePipeline.</p>

##### Instances
``` purescript
Newtype ActivatePipelineInput _
Generic ActivatePipelineInput _
Show ActivatePipelineInput
Decode ActivatePipelineInput
Encode ActivatePipelineInput
```

#### `newActivatePipelineInput`

``` purescript
newActivatePipelineInput :: Id' -> ActivatePipelineInput
```

Constructs ActivatePipelineInput from required parameters

#### `newActivatePipelineInput'`

``` purescript
newActivatePipelineInput' :: Id' -> ({ pipelineId :: Id', parameterValues :: NullOrUndefined (ParameterValueList), startTimestamp :: NullOrUndefined (Timestamp) } -> { pipelineId :: Id', parameterValues :: NullOrUndefined (ParameterValueList), startTimestamp :: NullOrUndefined (Timestamp) }) -> ActivatePipelineInput
```

Constructs ActivatePipelineInput's fields from required parameters

#### `ActivatePipelineOutput`

``` purescript
newtype ActivatePipelineOutput
  = ActivatePipelineOutput NoArguments
```

<p>Contains the output of ActivatePipeline.</p>

##### Instances
``` purescript
Newtype ActivatePipelineOutput _
Generic ActivatePipelineOutput _
Show ActivatePipelineOutput
Decode ActivatePipelineOutput
Encode ActivatePipelineOutput
```

#### `AddTagsInput`

``` purescript
newtype AddTagsInput
  = AddTagsInput { pipelineId :: Id', tags :: TagList' }
```

<p>Contains the parameters for AddTags.</p>

##### Instances
``` purescript
Newtype AddTagsInput _
Generic AddTagsInput _
Show AddTagsInput
Decode AddTagsInput
Encode AddTagsInput
```

#### `newAddTagsInput`

``` purescript
newAddTagsInput :: Id' -> TagList' -> AddTagsInput
```

Constructs AddTagsInput from required parameters

#### `newAddTagsInput'`

``` purescript
newAddTagsInput' :: Id' -> TagList' -> ({ pipelineId :: Id', tags :: TagList' } -> { pipelineId :: Id', tags :: TagList' }) -> AddTagsInput
```

Constructs AddTagsInput's fields from required parameters

#### `AddTagsOutput`

``` purescript
newtype AddTagsOutput
  = AddTagsOutput NoArguments
```

<p>Contains the output of AddTags.</p>

##### Instances
``` purescript
Newtype AddTagsOutput _
Generic AddTagsOutput _
Show AddTagsOutput
Decode AddTagsOutput
Encode AddTagsOutput
```

#### `CreatePipelineInput`

``` purescript
newtype CreatePipelineInput
  = CreatePipelineInput { name :: Id', uniqueId :: Id', description :: NullOrUndefined (String), tags :: NullOrUndefined (TagList') }
```

<p>Contains the parameters for CreatePipeline.</p>

##### Instances
``` purescript
Newtype CreatePipelineInput _
Generic CreatePipelineInput _
Show CreatePipelineInput
Decode CreatePipelineInput
Encode CreatePipelineInput
```

#### `newCreatePipelineInput`

``` purescript
newCreatePipelineInput :: Id' -> Id' -> CreatePipelineInput
```

Constructs CreatePipelineInput from required parameters

#### `newCreatePipelineInput'`

``` purescript
newCreatePipelineInput' :: Id' -> Id' -> ({ name :: Id', uniqueId :: Id', description :: NullOrUndefined (String), tags :: NullOrUndefined (TagList') } -> { name :: Id', uniqueId :: Id', description :: NullOrUndefined (String), tags :: NullOrUndefined (TagList') }) -> CreatePipelineInput
```

Constructs CreatePipelineInput's fields from required parameters

#### `CreatePipelineOutput`

``` purescript
newtype CreatePipelineOutput
  = CreatePipelineOutput { pipelineId :: Id' }
```

<p>Contains the output of CreatePipeline.</p>

##### Instances
``` purescript
Newtype CreatePipelineOutput _
Generic CreatePipelineOutput _
Show CreatePipelineOutput
Decode CreatePipelineOutput
Encode CreatePipelineOutput
```

#### `newCreatePipelineOutput`

``` purescript
newCreatePipelineOutput :: Id' -> CreatePipelineOutput
```

Constructs CreatePipelineOutput from required parameters

#### `newCreatePipelineOutput'`

``` purescript
newCreatePipelineOutput' :: Id' -> ({ pipelineId :: Id' } -> { pipelineId :: Id' }) -> CreatePipelineOutput
```

Constructs CreatePipelineOutput's fields from required parameters

#### `DeactivatePipelineInput`

``` purescript
newtype DeactivatePipelineInput
  = DeactivatePipelineInput { pipelineId :: Id', cancelActive :: NullOrUndefined (CancelActive') }
```

<p>Contains the parameters for DeactivatePipeline.</p>

##### Instances
``` purescript
Newtype DeactivatePipelineInput _
Generic DeactivatePipelineInput _
Show DeactivatePipelineInput
Decode DeactivatePipelineInput
Encode DeactivatePipelineInput
```

#### `newDeactivatePipelineInput`

``` purescript
newDeactivatePipelineInput :: Id' -> DeactivatePipelineInput
```

Constructs DeactivatePipelineInput from required parameters

#### `newDeactivatePipelineInput'`

``` purescript
newDeactivatePipelineInput' :: Id' -> ({ pipelineId :: Id', cancelActive :: NullOrUndefined (CancelActive') } -> { pipelineId :: Id', cancelActive :: NullOrUndefined (CancelActive') }) -> DeactivatePipelineInput
```

Constructs DeactivatePipelineInput's fields from required parameters

#### `DeactivatePipelineOutput`

``` purescript
newtype DeactivatePipelineOutput
  = DeactivatePipelineOutput NoArguments
```

<p>Contains the output of DeactivatePipeline.</p>

##### Instances
``` purescript
Newtype DeactivatePipelineOutput _
Generic DeactivatePipelineOutput _
Show DeactivatePipelineOutput
Decode DeactivatePipelineOutput
Encode DeactivatePipelineOutput
```

#### `DeletePipelineInput`

``` purescript
newtype DeletePipelineInput
  = DeletePipelineInput { pipelineId :: Id' }
```

<p>Contains the parameters for DeletePipeline.</p>

##### Instances
``` purescript
Newtype DeletePipelineInput _
Generic DeletePipelineInput _
Show DeletePipelineInput
Decode DeletePipelineInput
Encode DeletePipelineInput
```

#### `newDeletePipelineInput`

``` purescript
newDeletePipelineInput :: Id' -> DeletePipelineInput
```

Constructs DeletePipelineInput from required parameters

#### `newDeletePipelineInput'`

``` purescript
newDeletePipelineInput' :: Id' -> ({ pipelineId :: Id' } -> { pipelineId :: Id' }) -> DeletePipelineInput
```

Constructs DeletePipelineInput's fields from required parameters

#### `DescribeObjectsInput`

``` purescript
newtype DescribeObjectsInput
  = DescribeObjectsInput { pipelineId :: Id', objectIds :: IdList', evaluateExpressions :: NullOrUndefined (Boolean), marker :: NullOrUndefined (String) }
```

<p>Contains the parameters for DescribeObjects.</p>

##### Instances
``` purescript
Newtype DescribeObjectsInput _
Generic DescribeObjectsInput _
Show DescribeObjectsInput
Decode DescribeObjectsInput
Encode DescribeObjectsInput
```

#### `newDescribeObjectsInput`

``` purescript
newDescribeObjectsInput :: IdList' -> Id' -> DescribeObjectsInput
```

Constructs DescribeObjectsInput from required parameters

#### `newDescribeObjectsInput'`

``` purescript
newDescribeObjectsInput' :: IdList' -> Id' -> ({ pipelineId :: Id', objectIds :: IdList', evaluateExpressions :: NullOrUndefined (Boolean), marker :: NullOrUndefined (String) } -> { pipelineId :: Id', objectIds :: IdList', evaluateExpressions :: NullOrUndefined (Boolean), marker :: NullOrUndefined (String) }) -> DescribeObjectsInput
```

Constructs DescribeObjectsInput's fields from required parameters

#### `DescribeObjectsOutput`

``` purescript
newtype DescribeObjectsOutput
  = DescribeObjectsOutput { pipelineObjects :: PipelineObjectList, marker :: NullOrUndefined (String), hasMoreResults :: NullOrUndefined (Boolean) }
```

<p>Contains the output of DescribeObjects.</p>

##### Instances
``` purescript
Newtype DescribeObjectsOutput _
Generic DescribeObjectsOutput _
Show DescribeObjectsOutput
Decode DescribeObjectsOutput
Encode DescribeObjectsOutput
```

#### `newDescribeObjectsOutput`

``` purescript
newDescribeObjectsOutput :: PipelineObjectList -> DescribeObjectsOutput
```

Constructs DescribeObjectsOutput from required parameters

#### `newDescribeObjectsOutput'`

``` purescript
newDescribeObjectsOutput' :: PipelineObjectList -> ({ pipelineObjects :: PipelineObjectList, marker :: NullOrUndefined (String), hasMoreResults :: NullOrUndefined (Boolean) } -> { pipelineObjects :: PipelineObjectList, marker :: NullOrUndefined (String), hasMoreResults :: NullOrUndefined (Boolean) }) -> DescribeObjectsOutput
```

Constructs DescribeObjectsOutput's fields from required parameters

#### `DescribePipelinesInput`

``` purescript
newtype DescribePipelinesInput
  = DescribePipelinesInput { pipelineIds :: IdList' }
```

<p>Contains the parameters for DescribePipelines.</p>

##### Instances
``` purescript
Newtype DescribePipelinesInput _
Generic DescribePipelinesInput _
Show DescribePipelinesInput
Decode DescribePipelinesInput
Encode DescribePipelinesInput
```

#### `newDescribePipelinesInput`

``` purescript
newDescribePipelinesInput :: IdList' -> DescribePipelinesInput
```

Constructs DescribePipelinesInput from required parameters

#### `newDescribePipelinesInput'`

``` purescript
newDescribePipelinesInput' :: IdList' -> ({ pipelineIds :: IdList' } -> { pipelineIds :: IdList' }) -> DescribePipelinesInput
```

Constructs DescribePipelinesInput's fields from required parameters

#### `DescribePipelinesOutput`

``` purescript
newtype DescribePipelinesOutput
  = DescribePipelinesOutput { pipelineDescriptionList :: PipelineDescriptionList }
```

<p>Contains the output of DescribePipelines.</p>

##### Instances
``` purescript
Newtype DescribePipelinesOutput _
Generic DescribePipelinesOutput _
Show DescribePipelinesOutput
Decode DescribePipelinesOutput
Encode DescribePipelinesOutput
```

#### `newDescribePipelinesOutput`

``` purescript
newDescribePipelinesOutput :: PipelineDescriptionList -> DescribePipelinesOutput
```

Constructs DescribePipelinesOutput from required parameters

#### `newDescribePipelinesOutput'`

``` purescript
newDescribePipelinesOutput' :: PipelineDescriptionList -> ({ pipelineDescriptionList :: PipelineDescriptionList } -> { pipelineDescriptionList :: PipelineDescriptionList }) -> DescribePipelinesOutput
```

Constructs DescribePipelinesOutput's fields from required parameters

#### `EvaluateExpressionInput`

``` purescript
newtype EvaluateExpressionInput
  = EvaluateExpressionInput { pipelineId :: Id', objectId :: Id', expression :: LongString' }
```

<p>Contains the parameters for EvaluateExpression.</p>

##### Instances
``` purescript
Newtype EvaluateExpressionInput _
Generic EvaluateExpressionInput _
Show EvaluateExpressionInput
Decode EvaluateExpressionInput
Encode EvaluateExpressionInput
```

#### `newEvaluateExpressionInput`

``` purescript
newEvaluateExpressionInput :: LongString' -> Id' -> Id' -> EvaluateExpressionInput
```

Constructs EvaluateExpressionInput from required parameters

#### `newEvaluateExpressionInput'`

``` purescript
newEvaluateExpressionInput' :: LongString' -> Id' -> Id' -> ({ pipelineId :: Id', objectId :: Id', expression :: LongString' } -> { pipelineId :: Id', objectId :: Id', expression :: LongString' }) -> EvaluateExpressionInput
```

Constructs EvaluateExpressionInput's fields from required parameters

#### `EvaluateExpressionOutput`

``` purescript
newtype EvaluateExpressionOutput
  = EvaluateExpressionOutput { evaluatedExpression :: LongString' }
```

<p>Contains the output of EvaluateExpression.</p>

##### Instances
``` purescript
Newtype EvaluateExpressionOutput _
Generic EvaluateExpressionOutput _
Show EvaluateExpressionOutput
Decode EvaluateExpressionOutput
Encode EvaluateExpressionOutput
```

#### `newEvaluateExpressionOutput`

``` purescript
newEvaluateExpressionOutput :: LongString' -> EvaluateExpressionOutput
```

Constructs EvaluateExpressionOutput from required parameters

#### `newEvaluateExpressionOutput'`

``` purescript
newEvaluateExpressionOutput' :: LongString' -> ({ evaluatedExpression :: LongString' } -> { evaluatedExpression :: LongString' }) -> EvaluateExpressionOutput
```

Constructs EvaluateExpressionOutput's fields from required parameters

#### `Field`

``` purescript
newtype Field
  = Field { key :: FieldNameString', stringValue :: NullOrUndefined (FieldStringValue'), refValue :: NullOrUndefined (FieldNameString') }
```

<p>A key-value pair that describes a property of a pipeline object. The value is specified as either a string value (<code>StringValue</code>) or a reference to another object (<code>RefValue</code>) but not as both.</p>

##### Instances
``` purescript
Newtype Field _
Generic Field _
Show Field
Decode Field
Encode Field
```

#### `newField`

``` purescript
newField :: FieldNameString' -> Field
```

Constructs Field from required parameters

#### `newField'`

``` purescript
newField' :: FieldNameString' -> ({ key :: FieldNameString', stringValue :: NullOrUndefined (FieldStringValue'), refValue :: NullOrUndefined (FieldNameString') } -> { key :: FieldNameString', stringValue :: NullOrUndefined (FieldStringValue'), refValue :: NullOrUndefined (FieldNameString') }) -> Field
```

Constructs Field's fields from required parameters

#### `GetPipelineDefinitionInput`

``` purescript
newtype GetPipelineDefinitionInput
  = GetPipelineDefinitionInput { pipelineId :: Id', version :: NullOrUndefined (String) }
```

<p>Contains the parameters for GetPipelineDefinition.</p>

##### Instances
``` purescript
Newtype GetPipelineDefinitionInput _
Generic GetPipelineDefinitionInput _
Show GetPipelineDefinitionInput
Decode GetPipelineDefinitionInput
Encode GetPipelineDefinitionInput
```

#### `newGetPipelineDefinitionInput`

``` purescript
newGetPipelineDefinitionInput :: Id' -> GetPipelineDefinitionInput
```

Constructs GetPipelineDefinitionInput from required parameters

#### `newGetPipelineDefinitionInput'`

``` purescript
newGetPipelineDefinitionInput' :: Id' -> ({ pipelineId :: Id', version :: NullOrUndefined (String) } -> { pipelineId :: Id', version :: NullOrUndefined (String) }) -> GetPipelineDefinitionInput
```

Constructs GetPipelineDefinitionInput's fields from required parameters

#### `GetPipelineDefinitionOutput`

``` purescript
newtype GetPipelineDefinitionOutput
  = GetPipelineDefinitionOutput { pipelineObjects :: NullOrUndefined (PipelineObjectList), parameterObjects :: NullOrUndefined (ParameterObjectList), parameterValues :: NullOrUndefined (ParameterValueList) }
```

<p>Contains the output of GetPipelineDefinition.</p>

##### Instances
``` purescript
Newtype GetPipelineDefinitionOutput _
Generic GetPipelineDefinitionOutput _
Show GetPipelineDefinitionOutput
Decode GetPipelineDefinitionOutput
Encode GetPipelineDefinitionOutput
```

#### `newGetPipelineDefinitionOutput`

``` purescript
newGetPipelineDefinitionOutput :: GetPipelineDefinitionOutput
```

Constructs GetPipelineDefinitionOutput from required parameters

#### `newGetPipelineDefinitionOutput'`

``` purescript
newGetPipelineDefinitionOutput' :: ({ pipelineObjects :: NullOrUndefined (PipelineObjectList), parameterObjects :: NullOrUndefined (ParameterObjectList), parameterValues :: NullOrUndefined (ParameterValueList) } -> { pipelineObjects :: NullOrUndefined (PipelineObjectList), parameterObjects :: NullOrUndefined (ParameterObjectList), parameterValues :: NullOrUndefined (ParameterValueList) }) -> GetPipelineDefinitionOutput
```

Constructs GetPipelineDefinitionOutput's fields from required parameters

#### `InstanceIdentity`

``` purescript
newtype InstanceIdentity
  = InstanceIdentity { document :: NullOrUndefined (String), signature :: NullOrUndefined (String) }
```

<p><p>Identity information for the EC2 instance that is hosting the task runner. You can get this value by calling a metadata URI from the EC2 instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html">Instance Metadata</a> in the <i>Amazon Elastic Compute Cloud User Guide.</i> Passing in this value proves that your task runner is running on an EC2 instance, and ensures the proper AWS Data Pipeline service charges are applied to your pipeline.</p></p>

##### Instances
``` purescript
Newtype InstanceIdentity _
Generic InstanceIdentity _
Show InstanceIdentity
Decode InstanceIdentity
Encode InstanceIdentity
```

#### `newInstanceIdentity`

``` purescript
newInstanceIdentity :: InstanceIdentity
```

Constructs InstanceIdentity from required parameters

#### `newInstanceIdentity'`

``` purescript
newInstanceIdentity' :: ({ document :: NullOrUndefined (String), signature :: NullOrUndefined (String) } -> { document :: NullOrUndefined (String), signature :: NullOrUndefined (String) }) -> InstanceIdentity
```

Constructs InstanceIdentity's fields from required parameters

#### `InternalServiceError`

``` purescript
newtype InternalServiceError
  = InternalServiceError { message :: NullOrUndefined (ErrorMessage') }
```

<p>An internal service error occurred.</p>

##### Instances
``` purescript
Newtype InternalServiceError _
Generic InternalServiceError _
Show InternalServiceError
Decode InternalServiceError
Encode InternalServiceError
```

#### `newInternalServiceError`

``` purescript
newInternalServiceError :: InternalServiceError
```

Constructs InternalServiceError from required parameters

#### `newInternalServiceError'`

``` purescript
newInternalServiceError' :: ({ message :: NullOrUndefined (ErrorMessage') } -> { message :: NullOrUndefined (ErrorMessage') }) -> InternalServiceError
```

Constructs InternalServiceError's fields from required parameters

#### `InvalidRequestException`

``` purescript
newtype InvalidRequestException
  = InvalidRequestException { message :: NullOrUndefined (ErrorMessage') }
```

<p>The request was not valid. Verify that your request was properly formatted, that the signature was generated with the correct credentials, and that you haven't exceeded any of the service limits for your account.</p>

##### Instances
``` purescript
Newtype InvalidRequestException _
Generic InvalidRequestException _
Show InvalidRequestException
Decode InvalidRequestException
Encode InvalidRequestException
```

#### `newInvalidRequestException`

``` purescript
newInvalidRequestException :: InvalidRequestException
```

Constructs InvalidRequestException from required parameters

#### `newInvalidRequestException'`

``` purescript
newInvalidRequestException' :: ({ message :: NullOrUndefined (ErrorMessage') } -> { message :: NullOrUndefined (ErrorMessage') }) -> InvalidRequestException
```

Constructs InvalidRequestException's fields from required parameters

#### `ListPipelinesInput`

``` purescript
newtype ListPipelinesInput
  = ListPipelinesInput { marker :: NullOrUndefined (String) }
```

<p>Contains the parameters for ListPipelines.</p>

##### Instances
``` purescript
Newtype ListPipelinesInput _
Generic ListPipelinesInput _
Show ListPipelinesInput
Decode ListPipelinesInput
Encode ListPipelinesInput
```

#### `newListPipelinesInput`

``` purescript
newListPipelinesInput :: ListPipelinesInput
```

Constructs ListPipelinesInput from required parameters

#### `newListPipelinesInput'`

``` purescript
newListPipelinesInput' :: ({ marker :: NullOrUndefined (String) } -> { marker :: NullOrUndefined (String) }) -> ListPipelinesInput
```

Constructs ListPipelinesInput's fields from required parameters

#### `ListPipelinesOutput`

``` purescript
newtype ListPipelinesOutput
  = ListPipelinesOutput { pipelineIdList :: PipelineList', marker :: NullOrUndefined (String), hasMoreResults :: NullOrUndefined (Boolean) }
```

<p>Contains the output of ListPipelines.</p>

##### Instances
``` purescript
Newtype ListPipelinesOutput _
Generic ListPipelinesOutput _
Show ListPipelinesOutput
Decode ListPipelinesOutput
Encode ListPipelinesOutput
```

#### `newListPipelinesOutput`

``` purescript
newListPipelinesOutput :: PipelineList' -> ListPipelinesOutput
```

Constructs ListPipelinesOutput from required parameters

#### `newListPipelinesOutput'`

``` purescript
newListPipelinesOutput' :: PipelineList' -> ({ pipelineIdList :: PipelineList', marker :: NullOrUndefined (String), hasMoreResults :: NullOrUndefined (Boolean) } -> { pipelineIdList :: PipelineList', marker :: NullOrUndefined (String), hasMoreResults :: NullOrUndefined (Boolean) }) -> ListPipelinesOutput
```

Constructs ListPipelinesOutput's fields from required parameters

#### `Operator`

``` purescript
newtype Operator
  = Operator { "type" :: NullOrUndefined (OperatorType), values :: NullOrUndefined (StringList') }
```

<p>Contains a logical operation for comparing the value of a field with a specified value.</p>

##### Instances
``` purescript
Newtype Operator _
Generic Operator _
Show Operator
Decode Operator
Encode Operator
```

#### `newOperator`

``` purescript
newOperator :: Operator
```

Constructs Operator from required parameters

#### `newOperator'`

``` purescript
newOperator' :: ({ "type" :: NullOrUndefined (OperatorType), values :: NullOrUndefined (StringList') } -> { "type" :: NullOrUndefined (OperatorType), values :: NullOrUndefined (StringList') }) -> Operator
```

Constructs Operator's fields from required parameters

#### `OperatorType`

``` purescript
newtype OperatorType
  = OperatorType String
```

##### Instances
``` purescript
Newtype OperatorType _
Generic OperatorType _
Show OperatorType
Decode OperatorType
Encode OperatorType
```

#### `ParameterAttribute`

``` purescript
newtype ParameterAttribute
  = ParameterAttribute { key :: AttributeNameString', stringValue :: AttributeValueString' }
```

<p>The attributes allowed or specified with a parameter object.</p>

##### Instances
``` purescript
Newtype ParameterAttribute _
Generic ParameterAttribute _
Show ParameterAttribute
Decode ParameterAttribute
Encode ParameterAttribute
```

#### `newParameterAttribute`

``` purescript
newParameterAttribute :: AttributeNameString' -> AttributeValueString' -> ParameterAttribute
```

Constructs ParameterAttribute from required parameters

#### `newParameterAttribute'`

``` purescript
newParameterAttribute' :: AttributeNameString' -> AttributeValueString' -> ({ key :: AttributeNameString', stringValue :: AttributeValueString' } -> { key :: AttributeNameString', stringValue :: AttributeValueString' }) -> ParameterAttribute
```

Constructs ParameterAttribute's fields from required parameters

#### `ParameterAttributeList`

``` purescript
newtype ParameterAttributeList
  = ParameterAttributeList (Array ParameterAttribute)
```

##### Instances
``` purescript
Newtype ParameterAttributeList _
Generic ParameterAttributeList _
Show ParameterAttributeList
Decode ParameterAttributeList
Encode ParameterAttributeList
```

#### `ParameterObject`

``` purescript
newtype ParameterObject
  = ParameterObject { id :: FieldNameString', attributes :: ParameterAttributeList }
```

<p>Contains information about a parameter object.</p>

##### Instances
``` purescript
Newtype ParameterObject _
Generic ParameterObject _
Show ParameterObject
Decode ParameterObject
Encode ParameterObject
```

#### `newParameterObject`

``` purescript
newParameterObject :: ParameterAttributeList -> FieldNameString' -> ParameterObject
```

Constructs ParameterObject from required parameters

#### `newParameterObject'`

``` purescript
newParameterObject' :: ParameterAttributeList -> FieldNameString' -> ({ id :: FieldNameString', attributes :: ParameterAttributeList } -> { id :: FieldNameString', attributes :: ParameterAttributeList }) -> ParameterObject
```

Constructs ParameterObject's fields from required parameters

#### `ParameterObjectList`

``` purescript
newtype ParameterObjectList
  = ParameterObjectList (Array ParameterObject)
```

##### Instances
``` purescript
Newtype ParameterObjectList _
Generic ParameterObjectList _
Show ParameterObjectList
Decode ParameterObjectList
Encode ParameterObjectList
```

#### `ParameterValue`

``` purescript
newtype ParameterValue
  = ParameterValue { id :: FieldNameString', stringValue :: FieldStringValue' }
```

<p>A value or list of parameter values. </p>

##### Instances
``` purescript
Newtype ParameterValue _
Generic ParameterValue _
Show ParameterValue
Decode ParameterValue
Encode ParameterValue
```

#### `newParameterValue`

``` purescript
newParameterValue :: FieldNameString' -> FieldStringValue' -> ParameterValue
```

Constructs ParameterValue from required parameters

#### `newParameterValue'`

``` purescript
newParameterValue' :: FieldNameString' -> FieldStringValue' -> ({ id :: FieldNameString', stringValue :: FieldStringValue' } -> { id :: FieldNameString', stringValue :: FieldStringValue' }) -> ParameterValue
```

Constructs ParameterValue's fields from required parameters

#### `ParameterValueList`

``` purescript
newtype ParameterValueList
  = ParameterValueList (Array ParameterValue)
```

##### Instances
``` purescript
Newtype ParameterValueList _
Generic ParameterValueList _
Show ParameterValueList
Decode ParameterValueList
Encode ParameterValueList
```

#### `PipelineDeletedException`

``` purescript
newtype PipelineDeletedException
  = PipelineDeletedException { message :: NullOrUndefined (ErrorMessage') }
```

<p>The specified pipeline has been deleted.</p>

##### Instances
``` purescript
Newtype PipelineDeletedException _
Generic PipelineDeletedException _
Show PipelineDeletedException
Decode PipelineDeletedException
Encode PipelineDeletedException
```

#### `newPipelineDeletedException`

``` purescript
newPipelineDeletedException :: PipelineDeletedException
```

Constructs PipelineDeletedException from required parameters

#### `newPipelineDeletedException'`

``` purescript
newPipelineDeletedException' :: ({ message :: NullOrUndefined (ErrorMessage') } -> { message :: NullOrUndefined (ErrorMessage') }) -> PipelineDeletedException
```

Constructs PipelineDeletedException's fields from required parameters

#### `PipelineDescription`

``` purescript
newtype PipelineDescription
  = PipelineDescription { pipelineId :: Id', name :: Id', fields :: FieldList', description :: NullOrUndefined (String), tags :: NullOrUndefined (TagList') }
```

<p>Contains pipeline metadata.</p>

##### Instances
``` purescript
Newtype PipelineDescription _
Generic PipelineDescription _
Show PipelineDescription
Decode PipelineDescription
Encode PipelineDescription
```

#### `newPipelineDescription`

``` purescript
newPipelineDescription :: FieldList' -> Id' -> Id' -> PipelineDescription
```

Constructs PipelineDescription from required parameters

#### `newPipelineDescription'`

``` purescript
newPipelineDescription' :: FieldList' -> Id' -> Id' -> ({ pipelineId :: Id', name :: Id', fields :: FieldList', description :: NullOrUndefined (String), tags :: NullOrUndefined (TagList') } -> { pipelineId :: Id', name :: Id', fields :: FieldList', description :: NullOrUndefined (String), tags :: NullOrUndefined (TagList') }) -> PipelineDescription
```

Constructs PipelineDescription's fields from required parameters

#### `PipelineDescriptionList`

``` purescript
newtype PipelineDescriptionList
  = PipelineDescriptionList (Array PipelineDescription)
```

##### Instances
``` purescript
Newtype PipelineDescriptionList _
Generic PipelineDescriptionList _
Show PipelineDescriptionList
Decode PipelineDescriptionList
Encode PipelineDescriptionList
```

#### `PipelineIdName`

``` purescript
newtype PipelineIdName
  = PipelineIdName { id :: NullOrUndefined (Id'), name :: NullOrUndefined (Id') }
```

<p>Contains the name and identifier of a pipeline.</p>

##### Instances
``` purescript
Newtype PipelineIdName _
Generic PipelineIdName _
Show PipelineIdName
Decode PipelineIdName
Encode PipelineIdName
```

#### `newPipelineIdName`

``` purescript
newPipelineIdName :: PipelineIdName
```

Constructs PipelineIdName from required parameters

#### `newPipelineIdName'`

``` purescript
newPipelineIdName' :: ({ id :: NullOrUndefined (Id'), name :: NullOrUndefined (Id') } -> { id :: NullOrUndefined (Id'), name :: NullOrUndefined (Id') }) -> PipelineIdName
```

Constructs PipelineIdName's fields from required parameters

#### `PipelineNotFoundException`

``` purescript
newtype PipelineNotFoundException
  = PipelineNotFoundException { message :: NullOrUndefined (ErrorMessage') }
```

<p>The specified pipeline was not found. Verify that you used the correct user and account identifiers.</p>

##### Instances
``` purescript
Newtype PipelineNotFoundException _
Generic PipelineNotFoundException _
Show PipelineNotFoundException
Decode PipelineNotFoundException
Encode PipelineNotFoundException
```

#### `newPipelineNotFoundException`

``` purescript
newPipelineNotFoundException :: PipelineNotFoundException
```

Constructs PipelineNotFoundException from required parameters

#### `newPipelineNotFoundException'`

``` purescript
newPipelineNotFoundException' :: ({ message :: NullOrUndefined (ErrorMessage') } -> { message :: NullOrUndefined (ErrorMessage') }) -> PipelineNotFoundException
```

Constructs PipelineNotFoundException's fields from required parameters

#### `PipelineObject`

``` purescript
newtype PipelineObject
  = PipelineObject { id :: Id', name :: Id', fields :: FieldList' }
```

<p>Contains information about a pipeline object. This can be a logical, physical, or physical attempt pipeline object. The complete set of components of a pipeline defines the pipeline.</p>

##### Instances
``` purescript
Newtype PipelineObject _
Generic PipelineObject _
Show PipelineObject
Decode PipelineObject
Encode PipelineObject
```

#### `newPipelineObject`

``` purescript
newPipelineObject :: FieldList' -> Id' -> Id' -> PipelineObject
```

Constructs PipelineObject from required parameters

#### `newPipelineObject'`

``` purescript
newPipelineObject' :: FieldList' -> Id' -> Id' -> ({ id :: Id', name :: Id', fields :: FieldList' } -> { id :: Id', name :: Id', fields :: FieldList' }) -> PipelineObject
```

Constructs PipelineObject's fields from required parameters

#### `PipelineObjectList`

``` purescript
newtype PipelineObjectList
  = PipelineObjectList (Array PipelineObject)
```

##### Instances
``` purescript
Newtype PipelineObjectList _
Generic PipelineObjectList _
Show PipelineObjectList
Decode PipelineObjectList
Encode PipelineObjectList
```

#### `PipelineObjectMap`

``` purescript
newtype PipelineObjectMap
  = PipelineObjectMap (StrMap PipelineObject)
```

##### Instances
``` purescript
Newtype PipelineObjectMap _
Generic PipelineObjectMap _
Show PipelineObjectMap
Decode PipelineObjectMap
Encode PipelineObjectMap
```

#### `PollForTaskInput`

``` purescript
newtype PollForTaskInput
  = PollForTaskInput { workerGroup :: String, hostname :: NullOrUndefined (Id'), instanceIdentity :: NullOrUndefined (InstanceIdentity) }
```

<p>Contains the parameters for PollForTask.</p>

##### Instances
``` purescript
Newtype PollForTaskInput _
Generic PollForTaskInput _
Show PollForTaskInput
Decode PollForTaskInput
Encode PollForTaskInput
```

#### `newPollForTaskInput`

``` purescript
newPollForTaskInput :: String -> PollForTaskInput
```

Constructs PollForTaskInput from required parameters

#### `newPollForTaskInput'`

``` purescript
newPollForTaskInput' :: String -> ({ workerGroup :: String, hostname :: NullOrUndefined (Id'), instanceIdentity :: NullOrUndefined (InstanceIdentity) } -> { workerGroup :: String, hostname :: NullOrUndefined (Id'), instanceIdentity :: NullOrUndefined (InstanceIdentity) }) -> PollForTaskInput
```

Constructs PollForTaskInput's fields from required parameters

#### `PollForTaskOutput`

``` purescript
newtype PollForTaskOutput
  = PollForTaskOutput { taskObject :: NullOrUndefined (TaskObject) }
```

<p>Contains the output of PollForTask.</p>

##### Instances
``` purescript
Newtype PollForTaskOutput _
Generic PollForTaskOutput _
Show PollForTaskOutput
Decode PollForTaskOutput
Encode PollForTaskOutput
```

#### `newPollForTaskOutput`

``` purescript
newPollForTaskOutput :: PollForTaskOutput
```

Constructs PollForTaskOutput from required parameters

#### `newPollForTaskOutput'`

``` purescript
newPollForTaskOutput' :: ({ taskObject :: NullOrUndefined (TaskObject) } -> { taskObject :: NullOrUndefined (TaskObject) }) -> PollForTaskOutput
```

Constructs PollForTaskOutput's fields from required parameters

#### `PutPipelineDefinitionInput`

``` purescript
newtype PutPipelineDefinitionInput
  = PutPipelineDefinitionInput { pipelineId :: Id', pipelineObjects :: PipelineObjectList, parameterObjects :: NullOrUndefined (ParameterObjectList), parameterValues :: NullOrUndefined (ParameterValueList) }
```

<p>Contains the parameters for PutPipelineDefinition.</p>

##### Instances
``` purescript
Newtype PutPipelineDefinitionInput _
Generic PutPipelineDefinitionInput _
Show PutPipelineDefinitionInput
Decode PutPipelineDefinitionInput
Encode PutPipelineDefinitionInput
```

#### `newPutPipelineDefinitionInput`

``` purescript
newPutPipelineDefinitionInput :: Id' -> PipelineObjectList -> PutPipelineDefinitionInput
```

Constructs PutPipelineDefinitionInput from required parameters

#### `newPutPipelineDefinitionInput'`

``` purescript
newPutPipelineDefinitionInput' :: Id' -> PipelineObjectList -> ({ pipelineId :: Id', pipelineObjects :: PipelineObjectList, parameterObjects :: NullOrUndefined (ParameterObjectList), parameterValues :: NullOrUndefined (ParameterValueList) } -> { pipelineId :: Id', pipelineObjects :: PipelineObjectList, parameterObjects :: NullOrUndefined (ParameterObjectList), parameterValues :: NullOrUndefined (ParameterValueList) }) -> PutPipelineDefinitionInput
```

Constructs PutPipelineDefinitionInput's fields from required parameters

#### `PutPipelineDefinitionOutput`

``` purescript
newtype PutPipelineDefinitionOutput
  = PutPipelineDefinitionOutput { validationErrors :: NullOrUndefined (ValidationErrors), validationWarnings :: NullOrUndefined (ValidationWarnings), errored :: Boolean }
```

<p>Contains the output of PutPipelineDefinition.</p>

##### Instances
``` purescript
Newtype PutPipelineDefinitionOutput _
Generic PutPipelineDefinitionOutput _
Show PutPipelineDefinitionOutput
Decode PutPipelineDefinitionOutput
Encode PutPipelineDefinitionOutput
```

#### `newPutPipelineDefinitionOutput`

``` purescript
newPutPipelineDefinitionOutput :: Boolean -> PutPipelineDefinitionOutput
```

Constructs PutPipelineDefinitionOutput from required parameters

#### `newPutPipelineDefinitionOutput'`

``` purescript
newPutPipelineDefinitionOutput' :: Boolean -> ({ validationErrors :: NullOrUndefined (ValidationErrors), validationWarnings :: NullOrUndefined (ValidationWarnings), errored :: Boolean } -> { validationErrors :: NullOrUndefined (ValidationErrors), validationWarnings :: NullOrUndefined (ValidationWarnings), errored :: Boolean }) -> PutPipelineDefinitionOutput
```

Constructs PutPipelineDefinitionOutput's fields from required parameters

#### `Query`

``` purescript
newtype Query
  = Query { selectors :: NullOrUndefined (SelectorList) }
```

<p>Defines the query to run against an object.</p>

##### Instances
``` purescript
Newtype Query _
Generic Query _
Show Query
Decode Query
Encode Query
```

#### `newQuery`

``` purescript
newQuery :: Query
```

Constructs Query from required parameters

#### `newQuery'`

``` purescript
newQuery' :: ({ selectors :: NullOrUndefined (SelectorList) } -> { selectors :: NullOrUndefined (SelectorList) }) -> Query
```

Constructs Query's fields from required parameters

#### `QueryObjectsInput`

``` purescript
newtype QueryObjectsInput
  = QueryObjectsInput { pipelineId :: Id', query :: NullOrUndefined (Query), sphere :: String, marker :: NullOrUndefined (String), limit :: NullOrUndefined (Int) }
```

<p>Contains the parameters for QueryObjects.</p>

##### Instances
``` purescript
Newtype QueryObjectsInput _
Generic QueryObjectsInput _
Show QueryObjectsInput
Decode QueryObjectsInput
Encode QueryObjectsInput
```

#### `newQueryObjectsInput`

``` purescript
newQueryObjectsInput :: Id' -> String -> QueryObjectsInput
```

Constructs QueryObjectsInput from required parameters

#### `newQueryObjectsInput'`

``` purescript
newQueryObjectsInput' :: Id' -> String -> ({ pipelineId :: Id', query :: NullOrUndefined (Query), sphere :: String, marker :: NullOrUndefined (String), limit :: NullOrUndefined (Int) } -> { pipelineId :: Id', query :: NullOrUndefined (Query), sphere :: String, marker :: NullOrUndefined (String), limit :: NullOrUndefined (Int) }) -> QueryObjectsInput
```

Constructs QueryObjectsInput's fields from required parameters

#### `QueryObjectsOutput`

``` purescript
newtype QueryObjectsOutput
  = QueryObjectsOutput { ids :: NullOrUndefined (IdList'), marker :: NullOrUndefined (String), hasMoreResults :: NullOrUndefined (Boolean) }
```

<p>Contains the output of QueryObjects.</p>

##### Instances
``` purescript
Newtype QueryObjectsOutput _
Generic QueryObjectsOutput _
Show QueryObjectsOutput
Decode QueryObjectsOutput
Encode QueryObjectsOutput
```

#### `newQueryObjectsOutput`

``` purescript
newQueryObjectsOutput :: QueryObjectsOutput
```

Constructs QueryObjectsOutput from required parameters

#### `newQueryObjectsOutput'`

``` purescript
newQueryObjectsOutput' :: ({ ids :: NullOrUndefined (IdList'), marker :: NullOrUndefined (String), hasMoreResults :: NullOrUndefined (Boolean) } -> { ids :: NullOrUndefined (IdList'), marker :: NullOrUndefined (String), hasMoreResults :: NullOrUndefined (Boolean) }) -> QueryObjectsOutput
```

Constructs QueryObjectsOutput's fields from required parameters

#### `RemoveTagsInput`

``` purescript
newtype RemoveTagsInput
  = RemoveTagsInput { pipelineId :: Id', tagKeys :: StringList' }
```

<p>Contains the parameters for RemoveTags.</p>

##### Instances
``` purescript
Newtype RemoveTagsInput _
Generic RemoveTagsInput _
Show RemoveTagsInput
Decode RemoveTagsInput
Encode RemoveTagsInput
```

#### `newRemoveTagsInput`

``` purescript
newRemoveTagsInput :: Id' -> StringList' -> RemoveTagsInput
```

Constructs RemoveTagsInput from required parameters

#### `newRemoveTagsInput'`

``` purescript
newRemoveTagsInput' :: Id' -> StringList' -> ({ pipelineId :: Id', tagKeys :: StringList' } -> { pipelineId :: Id', tagKeys :: StringList' }) -> RemoveTagsInput
```

Constructs RemoveTagsInput's fields from required parameters

#### `RemoveTagsOutput`

``` purescript
newtype RemoveTagsOutput
  = RemoveTagsOutput NoArguments
```

<p>Contains the output of RemoveTags.</p>

##### Instances
``` purescript
Newtype RemoveTagsOutput _
Generic RemoveTagsOutput _
Show RemoveTagsOutput
Decode RemoveTagsOutput
Encode RemoveTagsOutput
```

#### `ReportTaskProgressInput`

``` purescript
newtype ReportTaskProgressInput
  = ReportTaskProgressInput { taskId :: TaskId', fields :: NullOrUndefined (FieldList') }
```

<p>Contains the parameters for ReportTaskProgress.</p>

##### Instances
``` purescript
Newtype ReportTaskProgressInput _
Generic ReportTaskProgressInput _
Show ReportTaskProgressInput
Decode ReportTaskProgressInput
Encode ReportTaskProgressInput
```

#### `newReportTaskProgressInput`

``` purescript
newReportTaskProgressInput :: TaskId' -> ReportTaskProgressInput
```

Constructs ReportTaskProgressInput from required parameters

#### `newReportTaskProgressInput'`

``` purescript
newReportTaskProgressInput' :: TaskId' -> ({ taskId :: TaskId', fields :: NullOrUndefined (FieldList') } -> { taskId :: TaskId', fields :: NullOrUndefined (FieldList') }) -> ReportTaskProgressInput
```

Constructs ReportTaskProgressInput's fields from required parameters

#### `ReportTaskProgressOutput`

``` purescript
newtype ReportTaskProgressOutput
  = ReportTaskProgressOutput { canceled :: Boolean }
```

<p>Contains the output of ReportTaskProgress.</p>

##### Instances
``` purescript
Newtype ReportTaskProgressOutput _
Generic ReportTaskProgressOutput _
Show ReportTaskProgressOutput
Decode ReportTaskProgressOutput
Encode ReportTaskProgressOutput
```

#### `newReportTaskProgressOutput`

``` purescript
newReportTaskProgressOutput :: Boolean -> ReportTaskProgressOutput
```

Constructs ReportTaskProgressOutput from required parameters

#### `newReportTaskProgressOutput'`

``` purescript
newReportTaskProgressOutput' :: Boolean -> ({ canceled :: Boolean } -> { canceled :: Boolean }) -> ReportTaskProgressOutput
```

Constructs ReportTaskProgressOutput's fields from required parameters

#### `ReportTaskRunnerHeartbeatInput`

``` purescript
newtype ReportTaskRunnerHeartbeatInput
  = ReportTaskRunnerHeartbeatInput { taskrunnerId :: Id', workerGroup :: NullOrUndefined (String), hostname :: NullOrUndefined (Id') }
```

<p>Contains the parameters for ReportTaskRunnerHeartbeat.</p>

##### Instances
``` purescript
Newtype ReportTaskRunnerHeartbeatInput _
Generic ReportTaskRunnerHeartbeatInput _
Show ReportTaskRunnerHeartbeatInput
Decode ReportTaskRunnerHeartbeatInput
Encode ReportTaskRunnerHeartbeatInput
```

#### `newReportTaskRunnerHeartbeatInput`

``` purescript
newReportTaskRunnerHeartbeatInput :: Id' -> ReportTaskRunnerHeartbeatInput
```

Constructs ReportTaskRunnerHeartbeatInput from required parameters

#### `newReportTaskRunnerHeartbeatInput'`

``` purescript
newReportTaskRunnerHeartbeatInput' :: Id' -> ({ taskrunnerId :: Id', workerGroup :: NullOrUndefined (String), hostname :: NullOrUndefined (Id') } -> { taskrunnerId :: Id', workerGroup :: NullOrUndefined (String), hostname :: NullOrUndefined (Id') }) -> ReportTaskRunnerHeartbeatInput
```

Constructs ReportTaskRunnerHeartbeatInput's fields from required parameters

#### `ReportTaskRunnerHeartbeatOutput`

``` purescript
newtype ReportTaskRunnerHeartbeatOutput
  = ReportTaskRunnerHeartbeatOutput { terminate :: Boolean }
```

<p>Contains the output of ReportTaskRunnerHeartbeat.</p>

##### Instances
``` purescript
Newtype ReportTaskRunnerHeartbeatOutput _
Generic ReportTaskRunnerHeartbeatOutput _
Show ReportTaskRunnerHeartbeatOutput
Decode ReportTaskRunnerHeartbeatOutput
Encode ReportTaskRunnerHeartbeatOutput
```

#### `newReportTaskRunnerHeartbeatOutput`

``` purescript
newReportTaskRunnerHeartbeatOutput :: Boolean -> ReportTaskRunnerHeartbeatOutput
```

Constructs ReportTaskRunnerHeartbeatOutput from required parameters

#### `newReportTaskRunnerHeartbeatOutput'`

``` purescript
newReportTaskRunnerHeartbeatOutput' :: Boolean -> ({ terminate :: Boolean } -> { terminate :: Boolean }) -> ReportTaskRunnerHeartbeatOutput
```

Constructs ReportTaskRunnerHeartbeatOutput's fields from required parameters

#### `Selector`

``` purescript
newtype Selector
  = Selector { fieldName :: NullOrUndefined (String), operator :: NullOrUndefined (Operator) }
```

<p>A comparision that is used to determine whether a query should return this object.</p>

##### Instances
``` purescript
Newtype Selector _
Generic Selector _
Show Selector
Decode Selector
Encode Selector
```

#### `newSelector`

``` purescript
newSelector :: Selector
```

Constructs Selector from required parameters

#### `newSelector'`

``` purescript
newSelector' :: ({ fieldName :: NullOrUndefined (String), operator :: NullOrUndefined (Operator) } -> { fieldName :: NullOrUndefined (String), operator :: NullOrUndefined (Operator) }) -> Selector
```

Constructs Selector's fields from required parameters

#### `SelectorList`

``` purescript
newtype SelectorList
  = SelectorList (Array Selector)
```

<p>The list of Selectors that define queries on individual fields.</p>

##### Instances
``` purescript
Newtype SelectorList _
Generic SelectorList _
Show SelectorList
Decode SelectorList
Encode SelectorList
```

#### `SetStatusInput`

``` purescript
newtype SetStatusInput
  = SetStatusInput { pipelineId :: Id', objectIds :: IdList', status :: String }
```

<p>Contains the parameters for SetStatus.</p>

##### Instances
``` purescript
Newtype SetStatusInput _
Generic SetStatusInput _
Show SetStatusInput
Decode SetStatusInput
Encode SetStatusInput
```

#### `newSetStatusInput`

``` purescript
newSetStatusInput :: IdList' -> Id' -> String -> SetStatusInput
```

Constructs SetStatusInput from required parameters

#### `newSetStatusInput'`

``` purescript
newSetStatusInput' :: IdList' -> Id' -> String -> ({ pipelineId :: Id', objectIds :: IdList', status :: String } -> { pipelineId :: Id', objectIds :: IdList', status :: String }) -> SetStatusInput
```

Constructs SetStatusInput's fields from required parameters

#### `SetTaskStatusInput`

``` purescript
newtype SetTaskStatusInput
  = SetTaskStatusInput { taskId :: TaskId', taskStatus :: TaskStatus, errorId :: NullOrUndefined (String), errorMessage :: NullOrUndefined (ErrorMessage'), errorStackTrace :: NullOrUndefined (String) }
```

<p>Contains the parameters for SetTaskStatus.</p>

##### Instances
``` purescript
Newtype SetTaskStatusInput _
Generic SetTaskStatusInput _
Show SetTaskStatusInput
Decode SetTaskStatusInput
Encode SetTaskStatusInput
```

#### `newSetTaskStatusInput`

``` purescript
newSetTaskStatusInput :: TaskId' -> TaskStatus -> SetTaskStatusInput
```

Constructs SetTaskStatusInput from required parameters

#### `newSetTaskStatusInput'`

``` purescript
newSetTaskStatusInput' :: TaskId' -> TaskStatus -> ({ taskId :: TaskId', taskStatus :: TaskStatus, errorId :: NullOrUndefined (String), errorMessage :: NullOrUndefined (ErrorMessage'), errorStackTrace :: NullOrUndefined (String) } -> { taskId :: TaskId', taskStatus :: TaskStatus, errorId :: NullOrUndefined (String), errorMessage :: NullOrUndefined (ErrorMessage'), errorStackTrace :: NullOrUndefined (String) }) -> SetTaskStatusInput
```

Constructs SetTaskStatusInput's fields from required parameters

#### `SetTaskStatusOutput`

``` purescript
newtype SetTaskStatusOutput
  = SetTaskStatusOutput NoArguments
```

<p>Contains the output of SetTaskStatus.</p>

##### Instances
``` purescript
Newtype SetTaskStatusOutput _
Generic SetTaskStatusOutput _
Show SetTaskStatusOutput
Decode SetTaskStatusOutput
Encode SetTaskStatusOutput
```

#### `Tag`

``` purescript
newtype Tag
  = Tag { key :: TagKey', value :: TagValue' }
```

<p>Tags are key/value pairs defined by a user and associated with a pipeline to control access. AWS Data Pipeline allows you to associate ten tags per pipeline. For more information, see <a href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer Guide</i>.</p>

##### Instances
``` purescript
Newtype Tag _
Generic Tag _
Show Tag
Decode Tag
Encode Tag
```

#### `newTag`

``` purescript
newTag :: TagKey' -> TagValue' -> Tag
```

Constructs Tag from required parameters

#### `newTag'`

``` purescript
newTag' :: TagKey' -> TagValue' -> ({ key :: TagKey', value :: TagValue' } -> { key :: TagKey', value :: TagValue' }) -> Tag
```

Constructs Tag's fields from required parameters

#### `TaskNotFoundException`

``` purescript
newtype TaskNotFoundException
  = TaskNotFoundException { message :: NullOrUndefined (ErrorMessage') }
```

<p>The specified task was not found. </p>

##### Instances
``` purescript
Newtype TaskNotFoundException _
Generic TaskNotFoundException _
Show TaskNotFoundException
Decode TaskNotFoundException
Encode TaskNotFoundException
```

#### `newTaskNotFoundException`

``` purescript
newTaskNotFoundException :: TaskNotFoundException
```

Constructs TaskNotFoundException from required parameters

#### `newTaskNotFoundException'`

``` purescript
newTaskNotFoundException' :: ({ message :: NullOrUndefined (ErrorMessage') } -> { message :: NullOrUndefined (ErrorMessage') }) -> TaskNotFoundException
```

Constructs TaskNotFoundException's fields from required parameters

#### `TaskObject`

``` purescript
newtype TaskObject
  = TaskObject { taskId :: NullOrUndefined (TaskId'), pipelineId :: NullOrUndefined (Id'), attemptId :: NullOrUndefined (Id'), objects :: NullOrUndefined (PipelineObjectMap) }
```

<p>Contains information about a pipeline task that is assigned to a task runner.</p>

##### Instances
``` purescript
Newtype TaskObject _
Generic TaskObject _
Show TaskObject
Decode TaskObject
Encode TaskObject
```

#### `newTaskObject`

``` purescript
newTaskObject :: TaskObject
```

Constructs TaskObject from required parameters

#### `newTaskObject'`

``` purescript
newTaskObject' :: ({ taskId :: NullOrUndefined (TaskId'), pipelineId :: NullOrUndefined (Id'), attemptId :: NullOrUndefined (Id'), objects :: NullOrUndefined (PipelineObjectMap) } -> { taskId :: NullOrUndefined (TaskId'), pipelineId :: NullOrUndefined (Id'), attemptId :: NullOrUndefined (Id'), objects :: NullOrUndefined (PipelineObjectMap) }) -> TaskObject
```

Constructs TaskObject's fields from required parameters

#### `TaskStatus`

``` purescript
newtype TaskStatus
  = TaskStatus String
```

##### Instances
``` purescript
Newtype TaskStatus _
Generic TaskStatus _
Show TaskStatus
Decode TaskStatus
Encode TaskStatus
```

#### `ValidatePipelineDefinitionInput`

``` purescript
newtype ValidatePipelineDefinitionInput
  = ValidatePipelineDefinitionInput { pipelineId :: Id', pipelineObjects :: PipelineObjectList, parameterObjects :: NullOrUndefined (ParameterObjectList), parameterValues :: NullOrUndefined (ParameterValueList) }
```

<p>Contains the parameters for ValidatePipelineDefinition.</p>

##### Instances
``` purescript
Newtype ValidatePipelineDefinitionInput _
Generic ValidatePipelineDefinitionInput _
Show ValidatePipelineDefinitionInput
Decode ValidatePipelineDefinitionInput
Encode ValidatePipelineDefinitionInput
```

#### `newValidatePipelineDefinitionInput`

``` purescript
newValidatePipelineDefinitionInput :: Id' -> PipelineObjectList -> ValidatePipelineDefinitionInput
```

Constructs ValidatePipelineDefinitionInput from required parameters

#### `newValidatePipelineDefinitionInput'`

``` purescript
newValidatePipelineDefinitionInput' :: Id' -> PipelineObjectList -> ({ pipelineId :: Id', pipelineObjects :: PipelineObjectList, parameterObjects :: NullOrUndefined (ParameterObjectList), parameterValues :: NullOrUndefined (ParameterValueList) } -> { pipelineId :: Id', pipelineObjects :: PipelineObjectList, parameterObjects :: NullOrUndefined (ParameterObjectList), parameterValues :: NullOrUndefined (ParameterValueList) }) -> ValidatePipelineDefinitionInput
```

Constructs ValidatePipelineDefinitionInput's fields from required parameters

#### `ValidatePipelineDefinitionOutput`

``` purescript
newtype ValidatePipelineDefinitionOutput
  = ValidatePipelineDefinitionOutput { validationErrors :: NullOrUndefined (ValidationErrors), validationWarnings :: NullOrUndefined (ValidationWarnings), errored :: Boolean }
```

<p>Contains the output of ValidatePipelineDefinition.</p>

##### Instances
``` purescript
Newtype ValidatePipelineDefinitionOutput _
Generic ValidatePipelineDefinitionOutput _
Show ValidatePipelineDefinitionOutput
Decode ValidatePipelineDefinitionOutput
Encode ValidatePipelineDefinitionOutput
```

#### `newValidatePipelineDefinitionOutput`

``` purescript
newValidatePipelineDefinitionOutput :: Boolean -> ValidatePipelineDefinitionOutput
```

Constructs ValidatePipelineDefinitionOutput from required parameters

#### `newValidatePipelineDefinitionOutput'`

``` purescript
newValidatePipelineDefinitionOutput' :: Boolean -> ({ validationErrors :: NullOrUndefined (ValidationErrors), validationWarnings :: NullOrUndefined (ValidationWarnings), errored :: Boolean } -> { validationErrors :: NullOrUndefined (ValidationErrors), validationWarnings :: NullOrUndefined (ValidationWarnings), errored :: Boolean }) -> ValidatePipelineDefinitionOutput
```

Constructs ValidatePipelineDefinitionOutput's fields from required parameters

#### `ValidationError`

``` purescript
newtype ValidationError
  = ValidationError { id :: NullOrUndefined (Id'), errors :: NullOrUndefined (ValidationMessages') }
```

<p>Defines a validation error. Validation errors prevent pipeline activation. The set of validation errors that can be returned are defined by AWS Data Pipeline.</p>

##### Instances
``` purescript
Newtype ValidationError _
Generic ValidationError _
Show ValidationError
Decode ValidationError
Encode ValidationError
```

#### `newValidationError`

``` purescript
newValidationError :: ValidationError
```

Constructs ValidationError from required parameters

#### `newValidationError'`

``` purescript
newValidationError' :: ({ id :: NullOrUndefined (Id'), errors :: NullOrUndefined (ValidationMessages') } -> { id :: NullOrUndefined (Id'), errors :: NullOrUndefined (ValidationMessages') }) -> ValidationError
```

Constructs ValidationError's fields from required parameters

#### `ValidationErrors`

``` purescript
newtype ValidationErrors
  = ValidationErrors (Array ValidationError)
```

##### Instances
``` purescript
Newtype ValidationErrors _
Generic ValidationErrors _
Show ValidationErrors
Decode ValidationErrors
Encode ValidationErrors
```

#### `ValidationWarning`

``` purescript
newtype ValidationWarning
  = ValidationWarning { id :: NullOrUndefined (Id'), warnings :: NullOrUndefined (ValidationMessages') }
```

<p>Defines a validation warning. Validation warnings do not prevent pipeline activation. The set of validation warnings that can be returned are defined by AWS Data Pipeline.</p>

##### Instances
``` purescript
Newtype ValidationWarning _
Generic ValidationWarning _
Show ValidationWarning
Decode ValidationWarning
Encode ValidationWarning
```

#### `newValidationWarning`

``` purescript
newValidationWarning :: ValidationWarning
```

Constructs ValidationWarning from required parameters

#### `newValidationWarning'`

``` purescript
newValidationWarning' :: ({ id :: NullOrUndefined (Id'), warnings :: NullOrUndefined (ValidationMessages') } -> { id :: NullOrUndefined (Id'), warnings :: NullOrUndefined (ValidationMessages') }) -> ValidationWarning
```

Constructs ValidationWarning's fields from required parameters

#### `ValidationWarnings`

``` purescript
newtype ValidationWarnings
  = ValidationWarnings (Array ValidationWarning)
```

##### Instances
``` purescript
Newtype ValidationWarnings _
Generic ValidationWarnings _
Show ValidationWarnings
Decode ValidationWarnings
Encode ValidationWarnings
```

#### `AttributeNameString'`

``` purescript
newtype AttributeNameString'
  = AttributeNameString' String
```

##### Instances
``` purescript
Newtype AttributeNameString' _
Generic AttributeNameString' _
Show AttributeNameString'
Decode AttributeNameString'
Encode AttributeNameString'
```

#### `AttributeValueString'`

``` purescript
newtype AttributeValueString'
  = AttributeValueString' String
```

##### Instances
``` purescript
Newtype AttributeValueString' _
Generic AttributeValueString' _
Show AttributeValueString'
Decode AttributeValueString'
Encode AttributeValueString'
```

#### `CancelActive'`

``` purescript
newtype CancelActive'
  = CancelActive' Boolean
```

##### Instances
``` purescript
Newtype CancelActive' _
Generic CancelActive' _
Show CancelActive'
Decode CancelActive'
Encode CancelActive'
```

#### `ErrorMessage'`

``` purescript
newtype ErrorMessage'
  = ErrorMessage' String
```

##### Instances
``` purescript
Newtype ErrorMessage' _
Generic ErrorMessage' _
Show ErrorMessage'
Decode ErrorMessage'
Encode ErrorMessage'
```

#### `FieldList'`

``` purescript
newtype FieldList'
  = FieldList' (Array Field)
```

##### Instances
``` purescript
Newtype FieldList' _
Generic FieldList' _
Show FieldList'
Decode FieldList'
Encode FieldList'
```

#### `FieldNameString'`

``` purescript
newtype FieldNameString'
  = FieldNameString' String
```

##### Instances
``` purescript
Newtype FieldNameString' _
Generic FieldNameString' _
Show FieldNameString'
Decode FieldNameString'
Encode FieldNameString'
```

#### `FieldStringValue'`

``` purescript
newtype FieldStringValue'
  = FieldStringValue' String
```

##### Instances
``` purescript
Newtype FieldStringValue' _
Generic FieldStringValue' _
Show FieldStringValue'
Decode FieldStringValue'
Encode FieldStringValue'
```

#### `Id'`

``` purescript
newtype Id'
  = Id' String
```

##### Instances
``` purescript
Newtype Id' _
Generic Id' _
Show Id'
Decode Id'
Encode Id'
```

#### `IdList'`

``` purescript
newtype IdList'
  = IdList' (Array Id')
```

##### Instances
``` purescript
Newtype IdList' _
Generic IdList' _
Show IdList'
Decode IdList'
Encode IdList'
```

#### `LongString'`

``` purescript
newtype LongString'
  = LongString' String
```

##### Instances
``` purescript
Newtype LongString' _
Generic LongString' _
Show LongString'
Decode LongString'
Encode LongString'
```

#### `PipelineList'`

``` purescript
newtype PipelineList'
  = PipelineList' (Array PipelineIdName)
```

##### Instances
``` purescript
Newtype PipelineList' _
Generic PipelineList' _
Show PipelineList'
Decode PipelineList'
Encode PipelineList'
```

#### `StringList'`

``` purescript
newtype StringList'
  = StringList' (Array String)
```

##### Instances
``` purescript
Newtype StringList' _
Generic StringList' _
Show StringList'
Decode StringList'
Encode StringList'
```

#### `TagKey'`

``` purescript
newtype TagKey'
  = TagKey' String
```

##### Instances
``` purescript
Newtype TagKey' _
Generic TagKey' _
Show TagKey'
Decode TagKey'
Encode TagKey'
```

#### `TagList'`

``` purescript
newtype TagList'
  = TagList' (Array Tag)
```

##### Instances
``` purescript
Newtype TagList' _
Generic TagList' _
Show TagList'
Decode TagList'
Encode TagList'
```

#### `TagValue'`

``` purescript
newtype TagValue'
  = TagValue' String
```

##### Instances
``` purescript
Newtype TagValue' _
Generic TagValue' _
Show TagValue'
Decode TagValue'
Encode TagValue'
```

#### `TaskId'`

``` purescript
newtype TaskId'
  = TaskId' String
```

##### Instances
``` purescript
Newtype TaskId' _
Generic TaskId' _
Show TaskId'
Decode TaskId'
Encode TaskId'
```

#### `ValidationMessage'`

``` purescript
newtype ValidationMessage'
  = ValidationMessage' String
```

##### Instances
``` purescript
Newtype ValidationMessage' _
Generic ValidationMessage' _
Show ValidationMessage'
Decode ValidationMessage'
Encode ValidationMessage'
```

#### `ValidationMessages'`

``` purescript
newtype ValidationMessages'
  = ValidationMessages' (Array ValidationMessage')
```

##### Instances
``` purescript
Newtype ValidationMessages' _
Generic ValidationMessages' _
Show ValidationMessages'
Decode ValidationMessages'
Encode ValidationMessages'
```


