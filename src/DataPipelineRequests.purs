
module AWS.DataPipeline.Requests where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff.Exception (EXCEPTION)

import AWS.Request (MethodName(..), request) as AWS
import AWS.Request.Types as Types

import AWS.DataPipeline as DataPipeline
import AWS.DataPipeline.Types as DataPipelineTypes


-- | <p>Validates the specified pipeline and starts processing pipeline tasks. If the pipeline does not pass validation, activation fails.</p> <p>If you need to pause the pipeline to investigate an issue with a component, such as a data source or script, call <a>DeactivatePipeline</a>.</p> <p>To activate a finished pipeline, modify the end date for the pipeline and then activate it.</p>
activatePipeline :: forall eff. DataPipeline.Service -> DataPipelineTypes.ActivatePipelineInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.ActivatePipelineOutput
activatePipeline (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "activatePipeline"


-- | <p>Adds or modifies tags for the specified pipeline.</p>
addTags :: forall eff. DataPipeline.Service -> DataPipelineTypes.AddTagsInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.AddTagsOutput
addTags (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "addTags"


-- | <p>Creates a new, empty pipeline. Use <a>PutPipelineDefinition</a> to populate the pipeline.</p>
createPipeline :: forall eff. DataPipeline.Service -> DataPipelineTypes.CreatePipelineInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.CreatePipelineOutput
createPipeline (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "createPipeline"


-- | <p>Deactivates the specified running pipeline. The pipeline is set to the <code>DEACTIVATING</code> state until the deactivation process completes.</p> <p>To resume a deactivated pipeline, use <a>ActivatePipeline</a>. By default, the pipeline resumes from the last completed execution. Optionally, you can specify the date and time to resume the pipeline.</p>
deactivatePipeline :: forall eff. DataPipeline.Service -> DataPipelineTypes.DeactivatePipelineInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.DeactivatePipelineOutput
deactivatePipeline (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "deactivatePipeline"


-- | <p>Deletes a pipeline, its pipeline definition, and its run history. AWS Data Pipeline attempts to cancel instances associated with the pipeline that are currently being processed by task runners.</p> <p>Deleting a pipeline cannot be undone. You cannot query or restore a deleted pipeline. To temporarily pause a pipeline instead of deleting it, call <a>SetStatus</a> with the status set to <code>PAUSE</code> on individual components. Components that are paused by <a>SetStatus</a> can be resumed.</p>
deletePipeline :: forall eff. DataPipeline.Service -> DataPipelineTypes.DeletePipelineInput -> Aff (exception :: EXCEPTION | eff) Unit
deletePipeline (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "deletePipeline"


-- | <p>Gets the object definitions for a set of objects associated with the pipeline. Object definitions are composed of a set of fields that define the properties of the object.</p>
describeObjects :: forall eff. DataPipeline.Service -> DataPipelineTypes.DescribeObjectsInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.DescribeObjectsOutput
describeObjects (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeObjects"


-- | <p>Retrieves metadata about one or more pipelines. The information retrieved includes the name of the pipeline, the pipeline identifier, its current state, and the user account that owns the pipeline. Using account credentials, you can retrieve metadata about pipelines that you or your IAM users have created. If you are using an IAM user account, you can retrieve metadata about only those pipelines for which you have read permissions.</p> <p>To retrieve the full pipeline definition instead of metadata about the pipeline, call <a>GetPipelineDefinition</a>.</p>
describePipelines :: forall eff. DataPipeline.Service -> DataPipelineTypes.DescribePipelinesInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.DescribePipelinesOutput
describePipelines (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describePipelines"


-- | <p>Task runners call <code>EvaluateExpression</code> to evaluate a string in the context of the specified object. For example, a task runner can evaluate SQL queries stored in Amazon S3.</p>
evaluateExpression :: forall eff. DataPipeline.Service -> DataPipelineTypes.EvaluateExpressionInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.EvaluateExpressionOutput
evaluateExpression (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "evaluateExpression"


-- | <p>Gets the definition of the specified pipeline. You can call <code>GetPipelineDefinition</code> to retrieve the pipeline definition that you provided using <a>PutPipelineDefinition</a>.</p>
getPipelineDefinition :: forall eff. DataPipeline.Service -> DataPipelineTypes.GetPipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.GetPipelineDefinitionOutput
getPipelineDefinition (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "getPipelineDefinition"


-- | <p>Lists the pipeline identifiers for all active pipelines that you have permission to access.</p>
listPipelines :: forall eff. DataPipeline.Service -> DataPipelineTypes.ListPipelinesInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.ListPipelinesOutput
listPipelines (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "listPipelines"


-- | <p>Task runners call <code>PollForTask</code> to receive a task to perform from AWS Data Pipeline. The task runner specifies which tasks it can perform by setting a value for the <code>workerGroup</code> parameter. The task returned can come from any of the pipelines that match the <code>workerGroup</code> value passed in by the task runner and that was launched using the IAM user credentials specified by the task runner.</p> <p>If tasks are ready in the work queue, <code>PollForTask</code> returns a response immediately. If no tasks are available in the queue, <code>PollForTask</code> uses long-polling and holds on to a poll connection for up to a 90 seconds, during which time the first newly scheduled task is handed to the task runner. To accomodate this, set the socket timeout in your task runner to 90 seconds. The task runner should not call <code>PollForTask</code> again on the same <code>workerGroup</code> until it receives a response, and this can take up to 90 seconds. </p>
pollForTask :: forall eff. DataPipeline.Service -> DataPipelineTypes.PollForTaskInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.PollForTaskOutput
pollForTask (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "pollForTask"


-- | <p>Adds tasks, schedules, and preconditions to the specified pipeline. You can use <code>PutPipelineDefinition</code> to populate a new pipeline.</p> <p> <code>PutPipelineDefinition</code> also validates the configuration as it adds it to the pipeline. Changes to the pipeline are saved unless one of the following three validation errors exists in the pipeline. </p> <ol> <li>An object is missing a name or identifier field.</li> <li>A string or reference field is empty.</li> <li>The number of objects in the pipeline exceeds the maximum allowed objects.</li> <li>The pipeline is in a FINISHED state.</li> </ol> <p> Pipeline object definitions are passed to the <code>PutPipelineDefinition</code> action and returned by the <a>GetPipelineDefinition</a> action. </p>
putPipelineDefinition :: forall eff. DataPipeline.Service -> DataPipelineTypes.PutPipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.PutPipelineDefinitionOutput
putPipelineDefinition (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "putPipelineDefinition"


-- | <p>Queries the specified pipeline for the names of objects that match the specified set of conditions.</p>
queryObjects :: forall eff. DataPipeline.Service -> DataPipelineTypes.QueryObjectsInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.QueryObjectsOutput
queryObjects (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "queryObjects"


-- | <p>Removes existing tags from the specified pipeline.</p>
removeTags :: forall eff. DataPipeline.Service -> DataPipelineTypes.RemoveTagsInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.RemoveTagsOutput
removeTags (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "removeTags"


-- | <p>Task runners call <code>ReportTaskProgress</code> when assigned a task to acknowledge that it has the task. If the web service does not receive this acknowledgement within 2 minutes, it assigns the task in a subsequent <a>PollForTask</a> call. After this initial acknowledgement, the task runner only needs to report progress every 15 minutes to maintain its ownership of the task. You can change this reporting time from 15 minutes by specifying a <code>reportProgressTimeout</code> field in your pipeline.</p> <p>If a task runner does not report its status after 5 minutes, AWS Data Pipeline assumes that the task runner is unable to process the task and reassigns the task in a subsequent response to <a>PollForTask</a>. Task runners should call <code>ReportTaskProgress</code> every 60 seconds.</p>
reportTaskProgress :: forall eff. DataPipeline.Service -> DataPipelineTypes.ReportTaskProgressInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.ReportTaskProgressOutput
reportTaskProgress (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "reportTaskProgress"


-- | <p>Task runners call <code>ReportTaskRunnerHeartbeat</code> every 15 minutes to indicate that they are operational. If the AWS Data Pipeline Task Runner is launched on a resource managed by AWS Data Pipeline, the web service can use this call to detect when the task runner application has failed and restart a new instance.</p>
reportTaskRunnerHeartbeat :: forall eff. DataPipeline.Service -> DataPipelineTypes.ReportTaskRunnerHeartbeatInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.ReportTaskRunnerHeartbeatOutput
reportTaskRunnerHeartbeat (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "reportTaskRunnerHeartbeat"


-- | <p>Requests that the status of the specified physical or logical pipeline objects be updated in the specified pipeline. This update might not occur immediately, but is eventually consistent. The status that can be set depends on the type of object (for example, DataNode or Activity). You cannot perform this operation on <code>FINISHED</code> pipelines and attempting to do so returns <code>InvalidRequestException</code>.</p>
setStatus :: forall eff. DataPipeline.Service -> DataPipelineTypes.SetStatusInput -> Aff (exception :: EXCEPTION | eff) Unit
setStatus (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "setStatus"


-- | <p>Task runners call <code>SetTaskStatus</code> to notify AWS Data Pipeline that a task is completed and provide information about the final status. A task runner makes this call regardless of whether the task was sucessful. A task runner does not need to call <code>SetTaskStatus</code> for tasks that are canceled by the web service during a call to <a>ReportTaskProgress</a>.</p>
setTaskStatus :: forall eff. DataPipeline.Service -> DataPipelineTypes.SetTaskStatusInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.SetTaskStatusOutput
setTaskStatus (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "setTaskStatus"


-- | <p>Validates the specified pipeline definition to ensure that it is well formed and can be run without error.</p>
validatePipelineDefinition :: forall eff. DataPipeline.Service -> DataPipelineTypes.ValidatePipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) DataPipelineTypes.ValidatePipelineDefinitionOutput
validatePipelineDefinition (DataPipeline.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "validatePipelineDefinition"
