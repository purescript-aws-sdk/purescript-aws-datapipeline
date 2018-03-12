

-- | <p>AWS Data Pipeline configures and manages a data-driven workflow called a pipeline. AWS Data Pipeline handles the details of scheduling and ensuring that data dependencies are met so that your application can focus on processing the data.</p> <p>AWS Data Pipeline provides a JAR implementation of a task runner called AWS Data Pipeline Task Runner. AWS Data Pipeline Task Runner provides logic for common data management scenarios, such as performing database queries and running data analysis using Amazon Elastic MapReduce (Amazon EMR). You can use AWS Data Pipeline Task Runner as your task runner, or you can write your own task runner to provide custom data management.</p> <p>AWS Data Pipeline implements two main sets of functionality. Use the first set to create a pipeline and define data sources, schedules, dependencies, and the transforms to be performed on the data. Use the second set in your task runner application to receive the next task ready for processing. The logic for performing the task, such as querying the data, running data analysis, or converting the data from one format to another, is contained within the task runner. The task runner performs the task assigned to it by the web service, reporting progress to the web service as it does so. When the task is done, the task runner reports the final success or failure of the task to the web service.</p>
module AWS.DataPipeline where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Foreign as Foreign
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.NullOrUndefined as NullOrUndefined
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.StrMap as StrMap

import AWS.Request as Request
import AWS.Request.Types as Types


-- | <p>Validates the specified pipeline and starts processing pipeline tasks. If the pipeline does not pass validation, activation fails.</p> <p>If you need to pause the pipeline to investigate an issue with a component, such as a data source or script, call <a>DeactivatePipeline</a>.</p> <p>To activate a finished pipeline, modify the end date for the pipeline and then activate it.</p>
activatePipeline :: forall eff. ActivatePipelineInput -> Aff (exception :: EXCEPTION | eff) ActivatePipelineOutput
activatePipeline = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "activatePipeline"


-- | <p>Adds or modifies tags for the specified pipeline.</p>
addTags :: forall eff. AddTagsInput -> Aff (exception :: EXCEPTION | eff) AddTagsOutput
addTags = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "addTags"


-- | <p>Creates a new, empty pipeline. Use <a>PutPipelineDefinition</a> to populate the pipeline.</p>
createPipeline :: forall eff. CreatePipelineInput -> Aff (exception :: EXCEPTION | eff) CreatePipelineOutput
createPipeline = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "createPipeline"


-- | <p>Deactivates the specified running pipeline. The pipeline is set to the <code>DEACTIVATING</code> state until the deactivation process completes.</p> <p>To resume a deactivated pipeline, use <a>ActivatePipeline</a>. By default, the pipeline resumes from the last completed execution. Optionally, you can specify the date and time to resume the pipeline.</p>
deactivatePipeline :: forall eff. DeactivatePipelineInput -> Aff (exception :: EXCEPTION | eff) DeactivatePipelineOutput
deactivatePipeline = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "deactivatePipeline"


-- | <p>Deletes a pipeline, its pipeline definition, and its run history. AWS Data Pipeline attempts to cancel instances associated with the pipeline that are currently being processed by task runners.</p> <p>Deleting a pipeline cannot be undone. You cannot query or restore a deleted pipeline. To temporarily pause a pipeline instead of deleting it, call <a>SetStatus</a> with the status set to <code>PAUSE</code> on individual components. Components that are paused by <a>SetStatus</a> can be resumed.</p>
deletePipeline :: forall eff. DeletePipelineInput -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
deletePipeline = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "deletePipeline"


-- | <p>Gets the object definitions for a set of objects associated with the pipeline. Object definitions are composed of a set of fields that define the properties of the object.</p>
describeObjects :: forall eff. DescribeObjectsInput -> Aff (exception :: EXCEPTION | eff) DescribeObjectsOutput
describeObjects = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "describeObjects"


-- | <p>Retrieves metadata about one or more pipelines. The information retrieved includes the name of the pipeline, the pipeline identifier, its current state, and the user account that owns the pipeline. Using account credentials, you can retrieve metadata about pipelines that you or your IAM users have created. If you are using an IAM user account, you can retrieve metadata about only those pipelines for which you have read permissions.</p> <p>To retrieve the full pipeline definition instead of metadata about the pipeline, call <a>GetPipelineDefinition</a>.</p>
describePipelines :: forall eff. DescribePipelinesInput -> Aff (exception :: EXCEPTION | eff) DescribePipelinesOutput
describePipelines = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "describePipelines"


-- | <p>Task runners call <code>EvaluateExpression</code> to evaluate a string in the context of the specified object. For example, a task runner can evaluate SQL queries stored in Amazon S3.</p>
evaluateExpression :: forall eff. EvaluateExpressionInput -> Aff (exception :: EXCEPTION | eff) EvaluateExpressionOutput
evaluateExpression = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "evaluateExpression"


-- | <p>Gets the definition of the specified pipeline. You can call <code>GetPipelineDefinition</code> to retrieve the pipeline definition that you provided using <a>PutPipelineDefinition</a>.</p>
getPipelineDefinition :: forall eff. GetPipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) GetPipelineDefinitionOutput
getPipelineDefinition = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "getPipelineDefinition"


-- | <p>Lists the pipeline identifiers for all active pipelines that you have permission to access.</p>
listPipelines :: forall eff. ListPipelinesInput -> Aff (exception :: EXCEPTION | eff) ListPipelinesOutput
listPipelines = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "listPipelines"


-- | <p>Task runners call <code>PollForTask</code> to receive a task to perform from AWS Data Pipeline. The task runner specifies which tasks it can perform by setting a value for the <code>workerGroup</code> parameter. The task returned can come from any of the pipelines that match the <code>workerGroup</code> value passed in by the task runner and that was launched using the IAM user credentials specified by the task runner.</p> <p>If tasks are ready in the work queue, <code>PollForTask</code> returns a response immediately. If no tasks are available in the queue, <code>PollForTask</code> uses long-polling and holds on to a poll connection for up to a 90 seconds, during which time the first newly scheduled task is handed to the task runner. To accomodate this, set the socket timeout in your task runner to 90 seconds. The task runner should not call <code>PollForTask</code> again on the same <code>workerGroup</code> until it receives a response, and this can take up to 90 seconds. </p>
pollForTask :: forall eff. PollForTaskInput -> Aff (exception :: EXCEPTION | eff) PollForTaskOutput
pollForTask = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "pollForTask"


-- | <p>Adds tasks, schedules, and preconditions to the specified pipeline. You can use <code>PutPipelineDefinition</code> to populate a new pipeline.</p> <p> <code>PutPipelineDefinition</code> also validates the configuration as it adds it to the pipeline. Changes to the pipeline are saved unless one of the following three validation errors exists in the pipeline. </p> <ol> <li>An object is missing a name or identifier field.</li> <li>A string or reference field is empty.</li> <li>The number of objects in the pipeline exceeds the maximum allowed objects.</li> <li>The pipeline is in a FINISHED state.</li> </ol> <p> Pipeline object definitions are passed to the <code>PutPipelineDefinition</code> action and returned by the <a>GetPipelineDefinition</a> action. </p>
putPipelineDefinition :: forall eff. PutPipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) PutPipelineDefinitionOutput
putPipelineDefinition = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "putPipelineDefinition"


-- | <p>Queries the specified pipeline for the names of objects that match the specified set of conditions.</p>
queryObjects :: forall eff. QueryObjectsInput -> Aff (exception :: EXCEPTION | eff) QueryObjectsOutput
queryObjects = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "queryObjects"


-- | <p>Removes existing tags from the specified pipeline.</p>
removeTags :: forall eff. RemoveTagsInput -> Aff (exception :: EXCEPTION | eff) RemoveTagsOutput
removeTags = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "removeTags"


-- | <p>Task runners call <code>ReportTaskProgress</code> when assigned a task to acknowledge that it has the task. If the web service does not receive this acknowledgement within 2 minutes, it assigns the task in a subsequent <a>PollForTask</a> call. After this initial acknowledgement, the task runner only needs to report progress every 15 minutes to maintain its ownership of the task. You can change this reporting time from 15 minutes by specifying a <code>reportProgressTimeout</code> field in your pipeline.</p> <p>If a task runner does not report its status after 5 minutes, AWS Data Pipeline assumes that the task runner is unable to process the task and reassigns the task in a subsequent response to <a>PollForTask</a>. Task runners should call <code>ReportTaskProgress</code> every 60 seconds.</p>
reportTaskProgress :: forall eff. ReportTaskProgressInput -> Aff (exception :: EXCEPTION | eff) ReportTaskProgressOutput
reportTaskProgress = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "reportTaskProgress"


-- | <p>Task runners call <code>ReportTaskRunnerHeartbeat</code> every 15 minutes to indicate that they are operational. If the AWS Data Pipeline Task Runner is launched on a resource managed by AWS Data Pipeline, the web service can use this call to detect when the task runner application has failed and restart a new instance.</p>
reportTaskRunnerHeartbeat :: forall eff. ReportTaskRunnerHeartbeatInput -> Aff (exception :: EXCEPTION | eff) ReportTaskRunnerHeartbeatOutput
reportTaskRunnerHeartbeat = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "reportTaskRunnerHeartbeat"


-- | <p>Requests that the status of the specified physical or logical pipeline objects be updated in the specified pipeline. This update might not occur immediately, but is eventually consistent. The status that can be set depends on the type of object (for example, DataNode or Activity). You cannot perform this operation on <code>FINISHED</code> pipelines and attempting to do so returns <code>InvalidRequestException</code>.</p>
setStatus :: forall eff. SetStatusInput -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
setStatus = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "setStatus"


-- | <p>Task runners call <code>SetTaskStatus</code> to notify AWS Data Pipeline that a task is completed and provide information about the final status. A task runner makes this call regardless of whether the task was sucessful. A task runner does not need to call <code>SetTaskStatus</code> for tasks that are canceled by the web service during a call to <a>ReportTaskProgress</a>.</p>
setTaskStatus :: forall eff. SetTaskStatusInput -> Aff (exception :: EXCEPTION | eff) SetTaskStatusOutput
setTaskStatus = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "setTaskStatus"


-- | <p>Validates the specified pipeline definition to ensure that it is well formed and can be run without error.</p>
validatePipelineDefinition :: forall eff. ValidatePipelineDefinitionInput -> Aff (exception :: EXCEPTION | eff) ValidatePipelineDefinitionOutput
validatePipelineDefinition = Request.request service method  where
    service = Request.ServiceName "DataPipeline"
    method = Request.MethodName "validatePipelineDefinition"


-- | <p>Contains the parameters for ActivatePipeline.</p>
newtype ActivatePipelineInput = ActivatePipelineInput 
  { "pipelineId" :: (Id')
  , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList)
  , "startTimestamp" :: NullOrUndefined.NullOrUndefined (Types.Timestamp)
  }
derive instance newtypeActivatePipelineInput :: Newtype ActivatePipelineInput _
derive instance repGenericActivatePipelineInput :: Generic ActivatePipelineInput _
instance showActivatePipelineInput :: Show ActivatePipelineInput where
  show = genericShow
instance decodeActivatePipelineInput :: Decode ActivatePipelineInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeActivatePipelineInput :: Encode ActivatePipelineInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ActivatePipelineInput from required parameters
newActivatePipelineInput :: Id' -> ActivatePipelineInput
newActivatePipelineInput _pipelineId = ActivatePipelineInput { "pipelineId": _pipelineId, "parameterValues": (NullOrUndefined Nothing), "startTimestamp": (NullOrUndefined Nothing) }

-- | Constructs ActivatePipelineInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newActivatePipelineInput' :: Id' -> ( { "pipelineId" :: (Id') , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList) , "startTimestamp" :: NullOrUndefined.NullOrUndefined (Types.Timestamp) } -> {"pipelineId" :: (Id') , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList) , "startTimestamp" :: NullOrUndefined.NullOrUndefined (Types.Timestamp) } ) -> ActivatePipelineInput
newActivatePipelineInput' _pipelineId customize = (ActivatePipelineInput <<< customize) { "pipelineId": _pipelineId, "parameterValues": (NullOrUndefined Nothing), "startTimestamp": (NullOrUndefined Nothing) }



-- | <p>Contains the output of ActivatePipeline.</p>
newtype ActivatePipelineOutput = ActivatePipelineOutput Types.NoArguments
derive instance newtypeActivatePipelineOutput :: Newtype ActivatePipelineOutput _
derive instance repGenericActivatePipelineOutput :: Generic ActivatePipelineOutput _
instance showActivatePipelineOutput :: Show ActivatePipelineOutput where
  show = genericShow
instance decodeActivatePipelineOutput :: Decode ActivatePipelineOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeActivatePipelineOutput :: Encode ActivatePipelineOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Contains the parameters for AddTags.</p>
newtype AddTagsInput = AddTagsInput 
  { "pipelineId" :: (Id')
  , "tags" :: (TagList')
  }
derive instance newtypeAddTagsInput :: Newtype AddTagsInput _
derive instance repGenericAddTagsInput :: Generic AddTagsInput _
instance showAddTagsInput :: Show AddTagsInput where
  show = genericShow
instance decodeAddTagsInput :: Decode AddTagsInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAddTagsInput :: Encode AddTagsInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AddTagsInput from required parameters
newAddTagsInput :: Id' -> TagList' -> AddTagsInput
newAddTagsInput _pipelineId _tags = AddTagsInput { "pipelineId": _pipelineId, "tags": _tags }

-- | Constructs AddTagsInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAddTagsInput' :: Id' -> TagList' -> ( { "pipelineId" :: (Id') , "tags" :: (TagList') } -> {"pipelineId" :: (Id') , "tags" :: (TagList') } ) -> AddTagsInput
newAddTagsInput' _pipelineId _tags customize = (AddTagsInput <<< customize) { "pipelineId": _pipelineId, "tags": _tags }



-- | <p>Contains the output of AddTags.</p>
newtype AddTagsOutput = AddTagsOutput Types.NoArguments
derive instance newtypeAddTagsOutput :: Newtype AddTagsOutput _
derive instance repGenericAddTagsOutput :: Generic AddTagsOutput _
instance showAddTagsOutput :: Show AddTagsOutput where
  show = genericShow
instance decodeAddTagsOutput :: Decode AddTagsOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAddTagsOutput :: Encode AddTagsOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Contains the parameters for CreatePipeline.</p>
newtype CreatePipelineInput = CreatePipelineInput 
  { "name" :: (Id')
  , "uniqueId" :: (Id')
  , "description" :: NullOrUndefined.NullOrUndefined (String)
  , "tags" :: NullOrUndefined.NullOrUndefined (TagList')
  }
derive instance newtypeCreatePipelineInput :: Newtype CreatePipelineInput _
derive instance repGenericCreatePipelineInput :: Generic CreatePipelineInput _
instance showCreatePipelineInput :: Show CreatePipelineInput where
  show = genericShow
instance decodeCreatePipelineInput :: Decode CreatePipelineInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCreatePipelineInput :: Encode CreatePipelineInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs CreatePipelineInput from required parameters
newCreatePipelineInput :: Id' -> Id' -> CreatePipelineInput
newCreatePipelineInput _name _uniqueId = CreatePipelineInput { "name": _name, "uniqueId": _uniqueId, "description": (NullOrUndefined Nothing), "tags": (NullOrUndefined Nothing) }

-- | Constructs CreatePipelineInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCreatePipelineInput' :: Id' -> Id' -> ( { "name" :: (Id') , "uniqueId" :: (Id') , "description" :: NullOrUndefined.NullOrUndefined (String) , "tags" :: NullOrUndefined.NullOrUndefined (TagList') } -> {"name" :: (Id') , "uniqueId" :: (Id') , "description" :: NullOrUndefined.NullOrUndefined (String) , "tags" :: NullOrUndefined.NullOrUndefined (TagList') } ) -> CreatePipelineInput
newCreatePipelineInput' _name _uniqueId customize = (CreatePipelineInput <<< customize) { "name": _name, "uniqueId": _uniqueId, "description": (NullOrUndefined Nothing), "tags": (NullOrUndefined Nothing) }



-- | <p>Contains the output of CreatePipeline.</p>
newtype CreatePipelineOutput = CreatePipelineOutput 
  { "pipelineId" :: (Id')
  }
derive instance newtypeCreatePipelineOutput :: Newtype CreatePipelineOutput _
derive instance repGenericCreatePipelineOutput :: Generic CreatePipelineOutput _
instance showCreatePipelineOutput :: Show CreatePipelineOutput where
  show = genericShow
instance decodeCreatePipelineOutput :: Decode CreatePipelineOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCreatePipelineOutput :: Encode CreatePipelineOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs CreatePipelineOutput from required parameters
newCreatePipelineOutput :: Id' -> CreatePipelineOutput
newCreatePipelineOutput _pipelineId = CreatePipelineOutput { "pipelineId": _pipelineId }

-- | Constructs CreatePipelineOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCreatePipelineOutput' :: Id' -> ( { "pipelineId" :: (Id') } -> {"pipelineId" :: (Id') } ) -> CreatePipelineOutput
newCreatePipelineOutput' _pipelineId customize = (CreatePipelineOutput <<< customize) { "pipelineId": _pipelineId }



-- | <p>Contains the parameters for DeactivatePipeline.</p>
newtype DeactivatePipelineInput = DeactivatePipelineInput 
  { "pipelineId" :: (Id')
  , "cancelActive" :: NullOrUndefined.NullOrUndefined (CancelActive')
  }
derive instance newtypeDeactivatePipelineInput :: Newtype DeactivatePipelineInput _
derive instance repGenericDeactivatePipelineInput :: Generic DeactivatePipelineInput _
instance showDeactivatePipelineInput :: Show DeactivatePipelineInput where
  show = genericShow
instance decodeDeactivatePipelineInput :: Decode DeactivatePipelineInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDeactivatePipelineInput :: Encode DeactivatePipelineInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DeactivatePipelineInput from required parameters
newDeactivatePipelineInput :: Id' -> DeactivatePipelineInput
newDeactivatePipelineInput _pipelineId = DeactivatePipelineInput { "pipelineId": _pipelineId, "cancelActive": (NullOrUndefined Nothing) }

-- | Constructs DeactivatePipelineInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeactivatePipelineInput' :: Id' -> ( { "pipelineId" :: (Id') , "cancelActive" :: NullOrUndefined.NullOrUndefined (CancelActive') } -> {"pipelineId" :: (Id') , "cancelActive" :: NullOrUndefined.NullOrUndefined (CancelActive') } ) -> DeactivatePipelineInput
newDeactivatePipelineInput' _pipelineId customize = (DeactivatePipelineInput <<< customize) { "pipelineId": _pipelineId, "cancelActive": (NullOrUndefined Nothing) }



-- | <p>Contains the output of DeactivatePipeline.</p>
newtype DeactivatePipelineOutput = DeactivatePipelineOutput Types.NoArguments
derive instance newtypeDeactivatePipelineOutput :: Newtype DeactivatePipelineOutput _
derive instance repGenericDeactivatePipelineOutput :: Generic DeactivatePipelineOutput _
instance showDeactivatePipelineOutput :: Show DeactivatePipelineOutput where
  show = genericShow
instance decodeDeactivatePipelineOutput :: Decode DeactivatePipelineOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDeactivatePipelineOutput :: Encode DeactivatePipelineOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Contains the parameters for DeletePipeline.</p>
newtype DeletePipelineInput = DeletePipelineInput 
  { "pipelineId" :: (Id')
  }
derive instance newtypeDeletePipelineInput :: Newtype DeletePipelineInput _
derive instance repGenericDeletePipelineInput :: Generic DeletePipelineInput _
instance showDeletePipelineInput :: Show DeletePipelineInput where
  show = genericShow
instance decodeDeletePipelineInput :: Decode DeletePipelineInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDeletePipelineInput :: Encode DeletePipelineInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DeletePipelineInput from required parameters
newDeletePipelineInput :: Id' -> DeletePipelineInput
newDeletePipelineInput _pipelineId = DeletePipelineInput { "pipelineId": _pipelineId }

-- | Constructs DeletePipelineInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeletePipelineInput' :: Id' -> ( { "pipelineId" :: (Id') } -> {"pipelineId" :: (Id') } ) -> DeletePipelineInput
newDeletePipelineInput' _pipelineId customize = (DeletePipelineInput <<< customize) { "pipelineId": _pipelineId }



-- | <p>Contains the parameters for DescribeObjects.</p>
newtype DescribeObjectsInput = DescribeObjectsInput 
  { "pipelineId" :: (Id')
  , "objectIds" :: (IdList')
  , "evaluateExpressions" :: NullOrUndefined.NullOrUndefined (Boolean)
  , "marker" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeDescribeObjectsInput :: Newtype DescribeObjectsInput _
derive instance repGenericDescribeObjectsInput :: Generic DescribeObjectsInput _
instance showDescribeObjectsInput :: Show DescribeObjectsInput where
  show = genericShow
instance decodeDescribeObjectsInput :: Decode DescribeObjectsInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeObjectsInput :: Encode DescribeObjectsInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeObjectsInput from required parameters
newDescribeObjectsInput :: IdList' -> Id' -> DescribeObjectsInput
newDescribeObjectsInput _objectIds _pipelineId = DescribeObjectsInput { "objectIds": _objectIds, "pipelineId": _pipelineId, "evaluateExpressions": (NullOrUndefined Nothing), "marker": (NullOrUndefined Nothing) }

-- | Constructs DescribeObjectsInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeObjectsInput' :: IdList' -> Id' -> ( { "pipelineId" :: (Id') , "objectIds" :: (IdList') , "evaluateExpressions" :: NullOrUndefined.NullOrUndefined (Boolean) , "marker" :: NullOrUndefined.NullOrUndefined (String) } -> {"pipelineId" :: (Id') , "objectIds" :: (IdList') , "evaluateExpressions" :: NullOrUndefined.NullOrUndefined (Boolean) , "marker" :: NullOrUndefined.NullOrUndefined (String) } ) -> DescribeObjectsInput
newDescribeObjectsInput' _objectIds _pipelineId customize = (DescribeObjectsInput <<< customize) { "objectIds": _objectIds, "pipelineId": _pipelineId, "evaluateExpressions": (NullOrUndefined Nothing), "marker": (NullOrUndefined Nothing) }



-- | <p>Contains the output of DescribeObjects.</p>
newtype DescribeObjectsOutput = DescribeObjectsOutput 
  { "pipelineObjects" :: (PipelineObjectList)
  , "marker" :: NullOrUndefined.NullOrUndefined (String)
  , "hasMoreResults" :: NullOrUndefined.NullOrUndefined (Boolean)
  }
derive instance newtypeDescribeObjectsOutput :: Newtype DescribeObjectsOutput _
derive instance repGenericDescribeObjectsOutput :: Generic DescribeObjectsOutput _
instance showDescribeObjectsOutput :: Show DescribeObjectsOutput where
  show = genericShow
instance decodeDescribeObjectsOutput :: Decode DescribeObjectsOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeObjectsOutput :: Encode DescribeObjectsOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeObjectsOutput from required parameters
newDescribeObjectsOutput :: PipelineObjectList -> DescribeObjectsOutput
newDescribeObjectsOutput _pipelineObjects = DescribeObjectsOutput { "pipelineObjects": _pipelineObjects, "hasMoreResults": (NullOrUndefined Nothing), "marker": (NullOrUndefined Nothing) }

-- | Constructs DescribeObjectsOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeObjectsOutput' :: PipelineObjectList -> ( { "pipelineObjects" :: (PipelineObjectList) , "marker" :: NullOrUndefined.NullOrUndefined (String) , "hasMoreResults" :: NullOrUndefined.NullOrUndefined (Boolean) } -> {"pipelineObjects" :: (PipelineObjectList) , "marker" :: NullOrUndefined.NullOrUndefined (String) , "hasMoreResults" :: NullOrUndefined.NullOrUndefined (Boolean) } ) -> DescribeObjectsOutput
newDescribeObjectsOutput' _pipelineObjects customize = (DescribeObjectsOutput <<< customize) { "pipelineObjects": _pipelineObjects, "hasMoreResults": (NullOrUndefined Nothing), "marker": (NullOrUndefined Nothing) }



-- | <p>Contains the parameters for DescribePipelines.</p>
newtype DescribePipelinesInput = DescribePipelinesInput 
  { "pipelineIds" :: (IdList')
  }
derive instance newtypeDescribePipelinesInput :: Newtype DescribePipelinesInput _
derive instance repGenericDescribePipelinesInput :: Generic DescribePipelinesInput _
instance showDescribePipelinesInput :: Show DescribePipelinesInput where
  show = genericShow
instance decodeDescribePipelinesInput :: Decode DescribePipelinesInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribePipelinesInput :: Encode DescribePipelinesInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribePipelinesInput from required parameters
newDescribePipelinesInput :: IdList' -> DescribePipelinesInput
newDescribePipelinesInput _pipelineIds = DescribePipelinesInput { "pipelineIds": _pipelineIds }

-- | Constructs DescribePipelinesInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribePipelinesInput' :: IdList' -> ( { "pipelineIds" :: (IdList') } -> {"pipelineIds" :: (IdList') } ) -> DescribePipelinesInput
newDescribePipelinesInput' _pipelineIds customize = (DescribePipelinesInput <<< customize) { "pipelineIds": _pipelineIds }



-- | <p>Contains the output of DescribePipelines.</p>
newtype DescribePipelinesOutput = DescribePipelinesOutput 
  { "pipelineDescriptionList" :: (PipelineDescriptionList)
  }
derive instance newtypeDescribePipelinesOutput :: Newtype DescribePipelinesOutput _
derive instance repGenericDescribePipelinesOutput :: Generic DescribePipelinesOutput _
instance showDescribePipelinesOutput :: Show DescribePipelinesOutput where
  show = genericShow
instance decodeDescribePipelinesOutput :: Decode DescribePipelinesOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribePipelinesOutput :: Encode DescribePipelinesOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribePipelinesOutput from required parameters
newDescribePipelinesOutput :: PipelineDescriptionList -> DescribePipelinesOutput
newDescribePipelinesOutput _pipelineDescriptionList = DescribePipelinesOutput { "pipelineDescriptionList": _pipelineDescriptionList }

-- | Constructs DescribePipelinesOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribePipelinesOutput' :: PipelineDescriptionList -> ( { "pipelineDescriptionList" :: (PipelineDescriptionList) } -> {"pipelineDescriptionList" :: (PipelineDescriptionList) } ) -> DescribePipelinesOutput
newDescribePipelinesOutput' _pipelineDescriptionList customize = (DescribePipelinesOutput <<< customize) { "pipelineDescriptionList": _pipelineDescriptionList }



-- | <p>Contains the parameters for EvaluateExpression.</p>
newtype EvaluateExpressionInput = EvaluateExpressionInput 
  { "pipelineId" :: (Id')
  , "objectId" :: (Id')
  , "expression" :: (LongString')
  }
derive instance newtypeEvaluateExpressionInput :: Newtype EvaluateExpressionInput _
derive instance repGenericEvaluateExpressionInput :: Generic EvaluateExpressionInput _
instance showEvaluateExpressionInput :: Show EvaluateExpressionInput where
  show = genericShow
instance decodeEvaluateExpressionInput :: Decode EvaluateExpressionInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeEvaluateExpressionInput :: Encode EvaluateExpressionInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs EvaluateExpressionInput from required parameters
newEvaluateExpressionInput :: LongString' -> Id' -> Id' -> EvaluateExpressionInput
newEvaluateExpressionInput _expression _objectId _pipelineId = EvaluateExpressionInput { "expression": _expression, "objectId": _objectId, "pipelineId": _pipelineId }

-- | Constructs EvaluateExpressionInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newEvaluateExpressionInput' :: LongString' -> Id' -> Id' -> ( { "pipelineId" :: (Id') , "objectId" :: (Id') , "expression" :: (LongString') } -> {"pipelineId" :: (Id') , "objectId" :: (Id') , "expression" :: (LongString') } ) -> EvaluateExpressionInput
newEvaluateExpressionInput' _expression _objectId _pipelineId customize = (EvaluateExpressionInput <<< customize) { "expression": _expression, "objectId": _objectId, "pipelineId": _pipelineId }



-- | <p>Contains the output of EvaluateExpression.</p>
newtype EvaluateExpressionOutput = EvaluateExpressionOutput 
  { "evaluatedExpression" :: (LongString')
  }
derive instance newtypeEvaluateExpressionOutput :: Newtype EvaluateExpressionOutput _
derive instance repGenericEvaluateExpressionOutput :: Generic EvaluateExpressionOutput _
instance showEvaluateExpressionOutput :: Show EvaluateExpressionOutput where
  show = genericShow
instance decodeEvaluateExpressionOutput :: Decode EvaluateExpressionOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeEvaluateExpressionOutput :: Encode EvaluateExpressionOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs EvaluateExpressionOutput from required parameters
newEvaluateExpressionOutput :: LongString' -> EvaluateExpressionOutput
newEvaluateExpressionOutput _evaluatedExpression = EvaluateExpressionOutput { "evaluatedExpression": _evaluatedExpression }

-- | Constructs EvaluateExpressionOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newEvaluateExpressionOutput' :: LongString' -> ( { "evaluatedExpression" :: (LongString') } -> {"evaluatedExpression" :: (LongString') } ) -> EvaluateExpressionOutput
newEvaluateExpressionOutput' _evaluatedExpression customize = (EvaluateExpressionOutput <<< customize) { "evaluatedExpression": _evaluatedExpression }



-- | <p>A key-value pair that describes a property of a pipeline object. The value is specified as either a string value (<code>StringValue</code>) or a reference to another object (<code>RefValue</code>) but not as both.</p>
newtype Field = Field 
  { "key" :: (FieldNameString')
  , "stringValue" :: NullOrUndefined.NullOrUndefined (FieldStringValue')
  , "refValue" :: NullOrUndefined.NullOrUndefined (FieldNameString')
  }
derive instance newtypeField :: Newtype Field _
derive instance repGenericField :: Generic Field _
instance showField :: Show Field where
  show = genericShow
instance decodeField :: Decode Field where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeField :: Encode Field where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Field from required parameters
newField :: FieldNameString' -> Field
newField _key = Field { "key": _key, "refValue": (NullOrUndefined Nothing), "stringValue": (NullOrUndefined Nothing) }

-- | Constructs Field's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newField' :: FieldNameString' -> ( { "key" :: (FieldNameString') , "stringValue" :: NullOrUndefined.NullOrUndefined (FieldStringValue') , "refValue" :: NullOrUndefined.NullOrUndefined (FieldNameString') } -> {"key" :: (FieldNameString') , "stringValue" :: NullOrUndefined.NullOrUndefined (FieldStringValue') , "refValue" :: NullOrUndefined.NullOrUndefined (FieldNameString') } ) -> Field
newField' _key customize = (Field <<< customize) { "key": _key, "refValue": (NullOrUndefined Nothing), "stringValue": (NullOrUndefined Nothing) }



-- | <p>Contains the parameters for GetPipelineDefinition.</p>
newtype GetPipelineDefinitionInput = GetPipelineDefinitionInput 
  { "pipelineId" :: (Id')
  , "version" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeGetPipelineDefinitionInput :: Newtype GetPipelineDefinitionInput _
derive instance repGenericGetPipelineDefinitionInput :: Generic GetPipelineDefinitionInput _
instance showGetPipelineDefinitionInput :: Show GetPipelineDefinitionInput where
  show = genericShow
instance decodeGetPipelineDefinitionInput :: Decode GetPipelineDefinitionInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeGetPipelineDefinitionInput :: Encode GetPipelineDefinitionInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs GetPipelineDefinitionInput from required parameters
newGetPipelineDefinitionInput :: Id' -> GetPipelineDefinitionInput
newGetPipelineDefinitionInput _pipelineId = GetPipelineDefinitionInput { "pipelineId": _pipelineId, "version": (NullOrUndefined Nothing) }

-- | Constructs GetPipelineDefinitionInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newGetPipelineDefinitionInput' :: Id' -> ( { "pipelineId" :: (Id') , "version" :: NullOrUndefined.NullOrUndefined (String) } -> {"pipelineId" :: (Id') , "version" :: NullOrUndefined.NullOrUndefined (String) } ) -> GetPipelineDefinitionInput
newGetPipelineDefinitionInput' _pipelineId customize = (GetPipelineDefinitionInput <<< customize) { "pipelineId": _pipelineId, "version": (NullOrUndefined Nothing) }



-- | <p>Contains the output of GetPipelineDefinition.</p>
newtype GetPipelineDefinitionOutput = GetPipelineDefinitionOutput 
  { "pipelineObjects" :: NullOrUndefined.NullOrUndefined (PipelineObjectList)
  , "parameterObjects" :: NullOrUndefined.NullOrUndefined (ParameterObjectList)
  , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList)
  }
derive instance newtypeGetPipelineDefinitionOutput :: Newtype GetPipelineDefinitionOutput _
derive instance repGenericGetPipelineDefinitionOutput :: Generic GetPipelineDefinitionOutput _
instance showGetPipelineDefinitionOutput :: Show GetPipelineDefinitionOutput where
  show = genericShow
instance decodeGetPipelineDefinitionOutput :: Decode GetPipelineDefinitionOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeGetPipelineDefinitionOutput :: Encode GetPipelineDefinitionOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs GetPipelineDefinitionOutput from required parameters
newGetPipelineDefinitionOutput :: GetPipelineDefinitionOutput
newGetPipelineDefinitionOutput  = GetPipelineDefinitionOutput { "parameterObjects": (NullOrUndefined Nothing), "parameterValues": (NullOrUndefined Nothing), "pipelineObjects": (NullOrUndefined Nothing) }

-- | Constructs GetPipelineDefinitionOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newGetPipelineDefinitionOutput' :: ( { "pipelineObjects" :: NullOrUndefined.NullOrUndefined (PipelineObjectList) , "parameterObjects" :: NullOrUndefined.NullOrUndefined (ParameterObjectList) , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList) } -> {"pipelineObjects" :: NullOrUndefined.NullOrUndefined (PipelineObjectList) , "parameterObjects" :: NullOrUndefined.NullOrUndefined (ParameterObjectList) , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList) } ) -> GetPipelineDefinitionOutput
newGetPipelineDefinitionOutput'  customize = (GetPipelineDefinitionOutput <<< customize) { "parameterObjects": (NullOrUndefined Nothing), "parameterValues": (NullOrUndefined Nothing), "pipelineObjects": (NullOrUndefined Nothing) }



-- | <p><p>Identity information for the EC2 instance that is hosting the task runner. You can get this value by calling a metadata URI from the EC2 instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html">Instance Metadata</a> in the <i>Amazon Elastic Compute Cloud User Guide.</i> Passing in this value proves that your task runner is running on an EC2 instance, and ensures the proper AWS Data Pipeline service charges are applied to your pipeline.</p></p>
newtype InstanceIdentity = InstanceIdentity 
  { "document" :: NullOrUndefined.NullOrUndefined (String)
  , "signature" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeInstanceIdentity :: Newtype InstanceIdentity _
derive instance repGenericInstanceIdentity :: Generic InstanceIdentity _
instance showInstanceIdentity :: Show InstanceIdentity where
  show = genericShow
instance decodeInstanceIdentity :: Decode InstanceIdentity where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInstanceIdentity :: Encode InstanceIdentity where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs InstanceIdentity from required parameters
newInstanceIdentity :: InstanceIdentity
newInstanceIdentity  = InstanceIdentity { "document": (NullOrUndefined Nothing), "signature": (NullOrUndefined Nothing) }

-- | Constructs InstanceIdentity's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInstanceIdentity' :: ( { "document" :: NullOrUndefined.NullOrUndefined (String) , "signature" :: NullOrUndefined.NullOrUndefined (String) } -> {"document" :: NullOrUndefined.NullOrUndefined (String) , "signature" :: NullOrUndefined.NullOrUndefined (String) } ) -> InstanceIdentity
newInstanceIdentity'  customize = (InstanceIdentity <<< customize) { "document": (NullOrUndefined Nothing), "signature": (NullOrUndefined Nothing) }



-- | <p>An internal service error occurred.</p>
newtype InternalServiceError = InternalServiceError 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage')
  }
derive instance newtypeInternalServiceError :: Newtype InternalServiceError _
derive instance repGenericInternalServiceError :: Generic InternalServiceError _
instance showInternalServiceError :: Show InternalServiceError where
  show = genericShow
instance decodeInternalServiceError :: Decode InternalServiceError where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInternalServiceError :: Encode InternalServiceError where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs InternalServiceError from required parameters
newInternalServiceError :: InternalServiceError
newInternalServiceError  = InternalServiceError { "message": (NullOrUndefined Nothing) }

-- | Constructs InternalServiceError's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInternalServiceError' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage') } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage') } ) -> InternalServiceError
newInternalServiceError'  customize = (InternalServiceError <<< customize) { "message": (NullOrUndefined Nothing) }



-- | <p>The request was not valid. Verify that your request was properly formatted, that the signature was generated with the correct credentials, and that you haven't exceeded any of the service limits for your account.</p>
newtype InvalidRequestException = InvalidRequestException 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage')
  }
derive instance newtypeInvalidRequestException :: Newtype InvalidRequestException _
derive instance repGenericInvalidRequestException :: Generic InvalidRequestException _
instance showInvalidRequestException :: Show InvalidRequestException where
  show = genericShow
instance decodeInvalidRequestException :: Decode InvalidRequestException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInvalidRequestException :: Encode InvalidRequestException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs InvalidRequestException from required parameters
newInvalidRequestException :: InvalidRequestException
newInvalidRequestException  = InvalidRequestException { "message": (NullOrUndefined Nothing) }

-- | Constructs InvalidRequestException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidRequestException' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage') } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage') } ) -> InvalidRequestException
newInvalidRequestException'  customize = (InvalidRequestException <<< customize) { "message": (NullOrUndefined Nothing) }



-- | <p>Contains the parameters for ListPipelines.</p>
newtype ListPipelinesInput = ListPipelinesInput 
  { "marker" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeListPipelinesInput :: Newtype ListPipelinesInput _
derive instance repGenericListPipelinesInput :: Generic ListPipelinesInput _
instance showListPipelinesInput :: Show ListPipelinesInput where
  show = genericShow
instance decodeListPipelinesInput :: Decode ListPipelinesInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeListPipelinesInput :: Encode ListPipelinesInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ListPipelinesInput from required parameters
newListPipelinesInput :: ListPipelinesInput
newListPipelinesInput  = ListPipelinesInput { "marker": (NullOrUndefined Nothing) }

-- | Constructs ListPipelinesInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListPipelinesInput' :: ( { "marker" :: NullOrUndefined.NullOrUndefined (String) } -> {"marker" :: NullOrUndefined.NullOrUndefined (String) } ) -> ListPipelinesInput
newListPipelinesInput'  customize = (ListPipelinesInput <<< customize) { "marker": (NullOrUndefined Nothing) }



-- | <p>Contains the output of ListPipelines.</p>
newtype ListPipelinesOutput = ListPipelinesOutput 
  { "pipelineIdList" :: (PipelineList')
  , "marker" :: NullOrUndefined.NullOrUndefined (String)
  , "hasMoreResults" :: NullOrUndefined.NullOrUndefined (Boolean)
  }
derive instance newtypeListPipelinesOutput :: Newtype ListPipelinesOutput _
derive instance repGenericListPipelinesOutput :: Generic ListPipelinesOutput _
instance showListPipelinesOutput :: Show ListPipelinesOutput where
  show = genericShow
instance decodeListPipelinesOutput :: Decode ListPipelinesOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeListPipelinesOutput :: Encode ListPipelinesOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ListPipelinesOutput from required parameters
newListPipelinesOutput :: PipelineList' -> ListPipelinesOutput
newListPipelinesOutput _pipelineIdList = ListPipelinesOutput { "pipelineIdList": _pipelineIdList, "hasMoreResults": (NullOrUndefined Nothing), "marker": (NullOrUndefined Nothing) }

-- | Constructs ListPipelinesOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListPipelinesOutput' :: PipelineList' -> ( { "pipelineIdList" :: (PipelineList') , "marker" :: NullOrUndefined.NullOrUndefined (String) , "hasMoreResults" :: NullOrUndefined.NullOrUndefined (Boolean) } -> {"pipelineIdList" :: (PipelineList') , "marker" :: NullOrUndefined.NullOrUndefined (String) , "hasMoreResults" :: NullOrUndefined.NullOrUndefined (Boolean) } ) -> ListPipelinesOutput
newListPipelinesOutput' _pipelineIdList customize = (ListPipelinesOutput <<< customize) { "pipelineIdList": _pipelineIdList, "hasMoreResults": (NullOrUndefined Nothing), "marker": (NullOrUndefined Nothing) }



-- | <p>Contains a logical operation for comparing the value of a field with a specified value.</p>
newtype Operator = Operator 
  { "type" :: NullOrUndefined.NullOrUndefined (OperatorType)
  , "values" :: NullOrUndefined.NullOrUndefined (StringList')
  }
derive instance newtypeOperator :: Newtype Operator _
derive instance repGenericOperator :: Generic Operator _
instance showOperator :: Show Operator where
  show = genericShow
instance decodeOperator :: Decode Operator where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeOperator :: Encode Operator where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Operator from required parameters
newOperator :: Operator
newOperator  = Operator { "type": (NullOrUndefined Nothing), "values": (NullOrUndefined Nothing) }

-- | Constructs Operator's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newOperator' :: ( { "type" :: NullOrUndefined.NullOrUndefined (OperatorType) , "values" :: NullOrUndefined.NullOrUndefined (StringList') } -> {"type" :: NullOrUndefined.NullOrUndefined (OperatorType) , "values" :: NullOrUndefined.NullOrUndefined (StringList') } ) -> Operator
newOperator'  customize = (Operator <<< customize) { "type": (NullOrUndefined Nothing), "values": (NullOrUndefined Nothing) }



newtype OperatorType = OperatorType String
derive instance newtypeOperatorType :: Newtype OperatorType _
derive instance repGenericOperatorType :: Generic OperatorType _
instance showOperatorType :: Show OperatorType where
  show = genericShow
instance decodeOperatorType :: Decode OperatorType where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeOperatorType :: Encode OperatorType where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The attributes allowed or specified with a parameter object.</p>
newtype ParameterAttribute = ParameterAttribute 
  { "key" :: (AttributeNameString')
  , "stringValue" :: (AttributeValueString')
  }
derive instance newtypeParameterAttribute :: Newtype ParameterAttribute _
derive instance repGenericParameterAttribute :: Generic ParameterAttribute _
instance showParameterAttribute :: Show ParameterAttribute where
  show = genericShow
instance decodeParameterAttribute :: Decode ParameterAttribute where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeParameterAttribute :: Encode ParameterAttribute where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ParameterAttribute from required parameters
newParameterAttribute :: AttributeNameString' -> AttributeValueString' -> ParameterAttribute
newParameterAttribute _key _stringValue = ParameterAttribute { "key": _key, "stringValue": _stringValue }

-- | Constructs ParameterAttribute's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newParameterAttribute' :: AttributeNameString' -> AttributeValueString' -> ( { "key" :: (AttributeNameString') , "stringValue" :: (AttributeValueString') } -> {"key" :: (AttributeNameString') , "stringValue" :: (AttributeValueString') } ) -> ParameterAttribute
newParameterAttribute' _key _stringValue customize = (ParameterAttribute <<< customize) { "key": _key, "stringValue": _stringValue }



newtype ParameterAttributeList = ParameterAttributeList (Array ParameterAttribute)
derive instance newtypeParameterAttributeList :: Newtype ParameterAttributeList _
derive instance repGenericParameterAttributeList :: Generic ParameterAttributeList _
instance showParameterAttributeList :: Show ParameterAttributeList where
  show = genericShow
instance decodeParameterAttributeList :: Decode ParameterAttributeList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeParameterAttributeList :: Encode ParameterAttributeList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Contains information about a parameter object.</p>
newtype ParameterObject = ParameterObject 
  { "id" :: (FieldNameString')
  , "attributes" :: (ParameterAttributeList)
  }
derive instance newtypeParameterObject :: Newtype ParameterObject _
derive instance repGenericParameterObject :: Generic ParameterObject _
instance showParameterObject :: Show ParameterObject where
  show = genericShow
instance decodeParameterObject :: Decode ParameterObject where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeParameterObject :: Encode ParameterObject where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ParameterObject from required parameters
newParameterObject :: ParameterAttributeList -> FieldNameString' -> ParameterObject
newParameterObject _attributes _id = ParameterObject { "attributes": _attributes, "id": _id }

-- | Constructs ParameterObject's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newParameterObject' :: ParameterAttributeList -> FieldNameString' -> ( { "id" :: (FieldNameString') , "attributes" :: (ParameterAttributeList) } -> {"id" :: (FieldNameString') , "attributes" :: (ParameterAttributeList) } ) -> ParameterObject
newParameterObject' _attributes _id customize = (ParameterObject <<< customize) { "attributes": _attributes, "id": _id }



newtype ParameterObjectList = ParameterObjectList (Array ParameterObject)
derive instance newtypeParameterObjectList :: Newtype ParameterObjectList _
derive instance repGenericParameterObjectList :: Generic ParameterObjectList _
instance showParameterObjectList :: Show ParameterObjectList where
  show = genericShow
instance decodeParameterObjectList :: Decode ParameterObjectList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeParameterObjectList :: Encode ParameterObjectList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>A value or list of parameter values. </p>
newtype ParameterValue = ParameterValue 
  { "id" :: (FieldNameString')
  , "stringValue" :: (FieldStringValue')
  }
derive instance newtypeParameterValue :: Newtype ParameterValue _
derive instance repGenericParameterValue :: Generic ParameterValue _
instance showParameterValue :: Show ParameterValue where
  show = genericShow
instance decodeParameterValue :: Decode ParameterValue where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeParameterValue :: Encode ParameterValue where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ParameterValue from required parameters
newParameterValue :: FieldNameString' -> FieldStringValue' -> ParameterValue
newParameterValue _id _stringValue = ParameterValue { "id": _id, "stringValue": _stringValue }

-- | Constructs ParameterValue's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newParameterValue' :: FieldNameString' -> FieldStringValue' -> ( { "id" :: (FieldNameString') , "stringValue" :: (FieldStringValue') } -> {"id" :: (FieldNameString') , "stringValue" :: (FieldStringValue') } ) -> ParameterValue
newParameterValue' _id _stringValue customize = (ParameterValue <<< customize) { "id": _id, "stringValue": _stringValue }



newtype ParameterValueList = ParameterValueList (Array ParameterValue)
derive instance newtypeParameterValueList :: Newtype ParameterValueList _
derive instance repGenericParameterValueList :: Generic ParameterValueList _
instance showParameterValueList :: Show ParameterValueList where
  show = genericShow
instance decodeParameterValueList :: Decode ParameterValueList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeParameterValueList :: Encode ParameterValueList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The specified pipeline has been deleted.</p>
newtype PipelineDeletedException = PipelineDeletedException 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage')
  }
derive instance newtypePipelineDeletedException :: Newtype PipelineDeletedException _
derive instance repGenericPipelineDeletedException :: Generic PipelineDeletedException _
instance showPipelineDeletedException :: Show PipelineDeletedException where
  show = genericShow
instance decodePipelineDeletedException :: Decode PipelineDeletedException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePipelineDeletedException :: Encode PipelineDeletedException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PipelineDeletedException from required parameters
newPipelineDeletedException :: PipelineDeletedException
newPipelineDeletedException  = PipelineDeletedException { "message": (NullOrUndefined Nothing) }

-- | Constructs PipelineDeletedException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPipelineDeletedException' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage') } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage') } ) -> PipelineDeletedException
newPipelineDeletedException'  customize = (PipelineDeletedException <<< customize) { "message": (NullOrUndefined Nothing) }



-- | <p>Contains pipeline metadata.</p>
newtype PipelineDescription = PipelineDescription 
  { "pipelineId" :: (Id')
  , "name" :: (Id')
  , "fields" :: (FieldList')
  , "description" :: NullOrUndefined.NullOrUndefined (String)
  , "tags" :: NullOrUndefined.NullOrUndefined (TagList')
  }
derive instance newtypePipelineDescription :: Newtype PipelineDescription _
derive instance repGenericPipelineDescription :: Generic PipelineDescription _
instance showPipelineDescription :: Show PipelineDescription where
  show = genericShow
instance decodePipelineDescription :: Decode PipelineDescription where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePipelineDescription :: Encode PipelineDescription where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PipelineDescription from required parameters
newPipelineDescription :: FieldList' -> Id' -> Id' -> PipelineDescription
newPipelineDescription _fields _name _pipelineId = PipelineDescription { "fields": _fields, "name": _name, "pipelineId": _pipelineId, "description": (NullOrUndefined Nothing), "tags": (NullOrUndefined Nothing) }

-- | Constructs PipelineDescription's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPipelineDescription' :: FieldList' -> Id' -> Id' -> ( { "pipelineId" :: (Id') , "name" :: (Id') , "fields" :: (FieldList') , "description" :: NullOrUndefined.NullOrUndefined (String) , "tags" :: NullOrUndefined.NullOrUndefined (TagList') } -> {"pipelineId" :: (Id') , "name" :: (Id') , "fields" :: (FieldList') , "description" :: NullOrUndefined.NullOrUndefined (String) , "tags" :: NullOrUndefined.NullOrUndefined (TagList') } ) -> PipelineDescription
newPipelineDescription' _fields _name _pipelineId customize = (PipelineDescription <<< customize) { "fields": _fields, "name": _name, "pipelineId": _pipelineId, "description": (NullOrUndefined Nothing), "tags": (NullOrUndefined Nothing) }



newtype PipelineDescriptionList = PipelineDescriptionList (Array PipelineDescription)
derive instance newtypePipelineDescriptionList :: Newtype PipelineDescriptionList _
derive instance repGenericPipelineDescriptionList :: Generic PipelineDescriptionList _
instance showPipelineDescriptionList :: Show PipelineDescriptionList where
  show = genericShow
instance decodePipelineDescriptionList :: Decode PipelineDescriptionList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePipelineDescriptionList :: Encode PipelineDescriptionList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Contains the name and identifier of a pipeline.</p>
newtype PipelineIdName = PipelineIdName 
  { "id" :: NullOrUndefined.NullOrUndefined (Id')
  , "name" :: NullOrUndefined.NullOrUndefined (Id')
  }
derive instance newtypePipelineIdName :: Newtype PipelineIdName _
derive instance repGenericPipelineIdName :: Generic PipelineIdName _
instance showPipelineIdName :: Show PipelineIdName where
  show = genericShow
instance decodePipelineIdName :: Decode PipelineIdName where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePipelineIdName :: Encode PipelineIdName where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PipelineIdName from required parameters
newPipelineIdName :: PipelineIdName
newPipelineIdName  = PipelineIdName { "id": (NullOrUndefined Nothing), "name": (NullOrUndefined Nothing) }

-- | Constructs PipelineIdName's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPipelineIdName' :: ( { "id" :: NullOrUndefined.NullOrUndefined (Id') , "name" :: NullOrUndefined.NullOrUndefined (Id') } -> {"id" :: NullOrUndefined.NullOrUndefined (Id') , "name" :: NullOrUndefined.NullOrUndefined (Id') } ) -> PipelineIdName
newPipelineIdName'  customize = (PipelineIdName <<< customize) { "id": (NullOrUndefined Nothing), "name": (NullOrUndefined Nothing) }



-- | <p>The specified pipeline was not found. Verify that you used the correct user and account identifiers.</p>
newtype PipelineNotFoundException = PipelineNotFoundException 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage')
  }
derive instance newtypePipelineNotFoundException :: Newtype PipelineNotFoundException _
derive instance repGenericPipelineNotFoundException :: Generic PipelineNotFoundException _
instance showPipelineNotFoundException :: Show PipelineNotFoundException where
  show = genericShow
instance decodePipelineNotFoundException :: Decode PipelineNotFoundException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePipelineNotFoundException :: Encode PipelineNotFoundException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PipelineNotFoundException from required parameters
newPipelineNotFoundException :: PipelineNotFoundException
newPipelineNotFoundException  = PipelineNotFoundException { "message": (NullOrUndefined Nothing) }

-- | Constructs PipelineNotFoundException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPipelineNotFoundException' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage') } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage') } ) -> PipelineNotFoundException
newPipelineNotFoundException'  customize = (PipelineNotFoundException <<< customize) { "message": (NullOrUndefined Nothing) }



-- | <p>Contains information about a pipeline object. This can be a logical, physical, or physical attempt pipeline object. The complete set of components of a pipeline defines the pipeline.</p>
newtype PipelineObject = PipelineObject 
  { "id" :: (Id')
  , "name" :: (Id')
  , "fields" :: (FieldList')
  }
derive instance newtypePipelineObject :: Newtype PipelineObject _
derive instance repGenericPipelineObject :: Generic PipelineObject _
instance showPipelineObject :: Show PipelineObject where
  show = genericShow
instance decodePipelineObject :: Decode PipelineObject where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePipelineObject :: Encode PipelineObject where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PipelineObject from required parameters
newPipelineObject :: FieldList' -> Id' -> Id' -> PipelineObject
newPipelineObject _fields _id _name = PipelineObject { "fields": _fields, "id": _id, "name": _name }

-- | Constructs PipelineObject's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPipelineObject' :: FieldList' -> Id' -> Id' -> ( { "id" :: (Id') , "name" :: (Id') , "fields" :: (FieldList') } -> {"id" :: (Id') , "name" :: (Id') , "fields" :: (FieldList') } ) -> PipelineObject
newPipelineObject' _fields _id _name customize = (PipelineObject <<< customize) { "fields": _fields, "id": _id, "name": _name }



newtype PipelineObjectList = PipelineObjectList (Array PipelineObject)
derive instance newtypePipelineObjectList :: Newtype PipelineObjectList _
derive instance repGenericPipelineObjectList :: Generic PipelineObjectList _
instance showPipelineObjectList :: Show PipelineObjectList where
  show = genericShow
instance decodePipelineObjectList :: Decode PipelineObjectList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePipelineObjectList :: Encode PipelineObjectList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype PipelineObjectMap = PipelineObjectMap (StrMap.StrMap PipelineObject)
derive instance newtypePipelineObjectMap :: Newtype PipelineObjectMap _
derive instance repGenericPipelineObjectMap :: Generic PipelineObjectMap _
instance showPipelineObjectMap :: Show PipelineObjectMap where
  show = genericShow
instance decodePipelineObjectMap :: Decode PipelineObjectMap where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePipelineObjectMap :: Encode PipelineObjectMap where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Contains the parameters for PollForTask.</p>
newtype PollForTaskInput = PollForTaskInput 
  { "workerGroup" :: (String)
  , "hostname" :: NullOrUndefined.NullOrUndefined (Id')
  , "instanceIdentity" :: NullOrUndefined.NullOrUndefined (InstanceIdentity)
  }
derive instance newtypePollForTaskInput :: Newtype PollForTaskInput _
derive instance repGenericPollForTaskInput :: Generic PollForTaskInput _
instance showPollForTaskInput :: Show PollForTaskInput where
  show = genericShow
instance decodePollForTaskInput :: Decode PollForTaskInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePollForTaskInput :: Encode PollForTaskInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PollForTaskInput from required parameters
newPollForTaskInput :: String -> PollForTaskInput
newPollForTaskInput _workerGroup = PollForTaskInput { "workerGroup": _workerGroup, "hostname": (NullOrUndefined Nothing), "instanceIdentity": (NullOrUndefined Nothing) }

-- | Constructs PollForTaskInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPollForTaskInput' :: String -> ( { "workerGroup" :: (String) , "hostname" :: NullOrUndefined.NullOrUndefined (Id') , "instanceIdentity" :: NullOrUndefined.NullOrUndefined (InstanceIdentity) } -> {"workerGroup" :: (String) , "hostname" :: NullOrUndefined.NullOrUndefined (Id') , "instanceIdentity" :: NullOrUndefined.NullOrUndefined (InstanceIdentity) } ) -> PollForTaskInput
newPollForTaskInput' _workerGroup customize = (PollForTaskInput <<< customize) { "workerGroup": _workerGroup, "hostname": (NullOrUndefined Nothing), "instanceIdentity": (NullOrUndefined Nothing) }



-- | <p>Contains the output of PollForTask.</p>
newtype PollForTaskOutput = PollForTaskOutput 
  { "taskObject" :: NullOrUndefined.NullOrUndefined (TaskObject)
  }
derive instance newtypePollForTaskOutput :: Newtype PollForTaskOutput _
derive instance repGenericPollForTaskOutput :: Generic PollForTaskOutput _
instance showPollForTaskOutput :: Show PollForTaskOutput where
  show = genericShow
instance decodePollForTaskOutput :: Decode PollForTaskOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePollForTaskOutput :: Encode PollForTaskOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PollForTaskOutput from required parameters
newPollForTaskOutput :: PollForTaskOutput
newPollForTaskOutput  = PollForTaskOutput { "taskObject": (NullOrUndefined Nothing) }

-- | Constructs PollForTaskOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPollForTaskOutput' :: ( { "taskObject" :: NullOrUndefined.NullOrUndefined (TaskObject) } -> {"taskObject" :: NullOrUndefined.NullOrUndefined (TaskObject) } ) -> PollForTaskOutput
newPollForTaskOutput'  customize = (PollForTaskOutput <<< customize) { "taskObject": (NullOrUndefined Nothing) }



-- | <p>Contains the parameters for PutPipelineDefinition.</p>
newtype PutPipelineDefinitionInput = PutPipelineDefinitionInput 
  { "pipelineId" :: (Id')
  , "pipelineObjects" :: (PipelineObjectList)
  , "parameterObjects" :: NullOrUndefined.NullOrUndefined (ParameterObjectList)
  , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList)
  }
derive instance newtypePutPipelineDefinitionInput :: Newtype PutPipelineDefinitionInput _
derive instance repGenericPutPipelineDefinitionInput :: Generic PutPipelineDefinitionInput _
instance showPutPipelineDefinitionInput :: Show PutPipelineDefinitionInput where
  show = genericShow
instance decodePutPipelineDefinitionInput :: Decode PutPipelineDefinitionInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutPipelineDefinitionInput :: Encode PutPipelineDefinitionInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutPipelineDefinitionInput from required parameters
newPutPipelineDefinitionInput :: Id' -> PipelineObjectList -> PutPipelineDefinitionInput
newPutPipelineDefinitionInput _pipelineId _pipelineObjects = PutPipelineDefinitionInput { "pipelineId": _pipelineId, "pipelineObjects": _pipelineObjects, "parameterObjects": (NullOrUndefined Nothing), "parameterValues": (NullOrUndefined Nothing) }

-- | Constructs PutPipelineDefinitionInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutPipelineDefinitionInput' :: Id' -> PipelineObjectList -> ( { "pipelineId" :: (Id') , "pipelineObjects" :: (PipelineObjectList) , "parameterObjects" :: NullOrUndefined.NullOrUndefined (ParameterObjectList) , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList) } -> {"pipelineId" :: (Id') , "pipelineObjects" :: (PipelineObjectList) , "parameterObjects" :: NullOrUndefined.NullOrUndefined (ParameterObjectList) , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList) } ) -> PutPipelineDefinitionInput
newPutPipelineDefinitionInput' _pipelineId _pipelineObjects customize = (PutPipelineDefinitionInput <<< customize) { "pipelineId": _pipelineId, "pipelineObjects": _pipelineObjects, "parameterObjects": (NullOrUndefined Nothing), "parameterValues": (NullOrUndefined Nothing) }



-- | <p>Contains the output of PutPipelineDefinition.</p>
newtype PutPipelineDefinitionOutput = PutPipelineDefinitionOutput 
  { "validationErrors" :: NullOrUndefined.NullOrUndefined (ValidationErrors)
  , "validationWarnings" :: NullOrUndefined.NullOrUndefined (ValidationWarnings)
  , "errored" :: (Boolean)
  }
derive instance newtypePutPipelineDefinitionOutput :: Newtype PutPipelineDefinitionOutput _
derive instance repGenericPutPipelineDefinitionOutput :: Generic PutPipelineDefinitionOutput _
instance showPutPipelineDefinitionOutput :: Show PutPipelineDefinitionOutput where
  show = genericShow
instance decodePutPipelineDefinitionOutput :: Decode PutPipelineDefinitionOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutPipelineDefinitionOutput :: Encode PutPipelineDefinitionOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutPipelineDefinitionOutput from required parameters
newPutPipelineDefinitionOutput :: Boolean -> PutPipelineDefinitionOutput
newPutPipelineDefinitionOutput _errored = PutPipelineDefinitionOutput { "errored": _errored, "validationErrors": (NullOrUndefined Nothing), "validationWarnings": (NullOrUndefined Nothing) }

-- | Constructs PutPipelineDefinitionOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutPipelineDefinitionOutput' :: Boolean -> ( { "validationErrors" :: NullOrUndefined.NullOrUndefined (ValidationErrors) , "validationWarnings" :: NullOrUndefined.NullOrUndefined (ValidationWarnings) , "errored" :: (Boolean) } -> {"validationErrors" :: NullOrUndefined.NullOrUndefined (ValidationErrors) , "validationWarnings" :: NullOrUndefined.NullOrUndefined (ValidationWarnings) , "errored" :: (Boolean) } ) -> PutPipelineDefinitionOutput
newPutPipelineDefinitionOutput' _errored customize = (PutPipelineDefinitionOutput <<< customize) { "errored": _errored, "validationErrors": (NullOrUndefined Nothing), "validationWarnings": (NullOrUndefined Nothing) }



-- | <p>Defines the query to run against an object.</p>
newtype Query = Query 
  { "selectors" :: NullOrUndefined.NullOrUndefined (SelectorList)
  }
derive instance newtypeQuery :: Newtype Query _
derive instance repGenericQuery :: Generic Query _
instance showQuery :: Show Query where
  show = genericShow
instance decodeQuery :: Decode Query where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeQuery :: Encode Query where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Query from required parameters
newQuery :: Query
newQuery  = Query { "selectors": (NullOrUndefined Nothing) }

-- | Constructs Query's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newQuery' :: ( { "selectors" :: NullOrUndefined.NullOrUndefined (SelectorList) } -> {"selectors" :: NullOrUndefined.NullOrUndefined (SelectorList) } ) -> Query
newQuery'  customize = (Query <<< customize) { "selectors": (NullOrUndefined Nothing) }



-- | <p>Contains the parameters for QueryObjects.</p>
newtype QueryObjectsInput = QueryObjectsInput 
  { "pipelineId" :: (Id')
  , "query" :: NullOrUndefined.NullOrUndefined (Query)
  , "sphere" :: (String)
  , "marker" :: NullOrUndefined.NullOrUndefined (String)
  , "limit" :: NullOrUndefined.NullOrUndefined (Int)
  }
derive instance newtypeQueryObjectsInput :: Newtype QueryObjectsInput _
derive instance repGenericQueryObjectsInput :: Generic QueryObjectsInput _
instance showQueryObjectsInput :: Show QueryObjectsInput where
  show = genericShow
instance decodeQueryObjectsInput :: Decode QueryObjectsInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeQueryObjectsInput :: Encode QueryObjectsInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs QueryObjectsInput from required parameters
newQueryObjectsInput :: Id' -> String -> QueryObjectsInput
newQueryObjectsInput _pipelineId _sphere = QueryObjectsInput { "pipelineId": _pipelineId, "sphere": _sphere, "limit": (NullOrUndefined Nothing), "marker": (NullOrUndefined Nothing), "query": (NullOrUndefined Nothing) }

-- | Constructs QueryObjectsInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newQueryObjectsInput' :: Id' -> String -> ( { "pipelineId" :: (Id') , "query" :: NullOrUndefined.NullOrUndefined (Query) , "sphere" :: (String) , "marker" :: NullOrUndefined.NullOrUndefined (String) , "limit" :: NullOrUndefined.NullOrUndefined (Int) } -> {"pipelineId" :: (Id') , "query" :: NullOrUndefined.NullOrUndefined (Query) , "sphere" :: (String) , "marker" :: NullOrUndefined.NullOrUndefined (String) , "limit" :: NullOrUndefined.NullOrUndefined (Int) } ) -> QueryObjectsInput
newQueryObjectsInput' _pipelineId _sphere customize = (QueryObjectsInput <<< customize) { "pipelineId": _pipelineId, "sphere": _sphere, "limit": (NullOrUndefined Nothing), "marker": (NullOrUndefined Nothing), "query": (NullOrUndefined Nothing) }



-- | <p>Contains the output of QueryObjects.</p>
newtype QueryObjectsOutput = QueryObjectsOutput 
  { "ids" :: NullOrUndefined.NullOrUndefined (IdList')
  , "marker" :: NullOrUndefined.NullOrUndefined (String)
  , "hasMoreResults" :: NullOrUndefined.NullOrUndefined (Boolean)
  }
derive instance newtypeQueryObjectsOutput :: Newtype QueryObjectsOutput _
derive instance repGenericQueryObjectsOutput :: Generic QueryObjectsOutput _
instance showQueryObjectsOutput :: Show QueryObjectsOutput where
  show = genericShow
instance decodeQueryObjectsOutput :: Decode QueryObjectsOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeQueryObjectsOutput :: Encode QueryObjectsOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs QueryObjectsOutput from required parameters
newQueryObjectsOutput :: QueryObjectsOutput
newQueryObjectsOutput  = QueryObjectsOutput { "hasMoreResults": (NullOrUndefined Nothing), "ids": (NullOrUndefined Nothing), "marker": (NullOrUndefined Nothing) }

-- | Constructs QueryObjectsOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newQueryObjectsOutput' :: ( { "ids" :: NullOrUndefined.NullOrUndefined (IdList') , "marker" :: NullOrUndefined.NullOrUndefined (String) , "hasMoreResults" :: NullOrUndefined.NullOrUndefined (Boolean) } -> {"ids" :: NullOrUndefined.NullOrUndefined (IdList') , "marker" :: NullOrUndefined.NullOrUndefined (String) , "hasMoreResults" :: NullOrUndefined.NullOrUndefined (Boolean) } ) -> QueryObjectsOutput
newQueryObjectsOutput'  customize = (QueryObjectsOutput <<< customize) { "hasMoreResults": (NullOrUndefined Nothing), "ids": (NullOrUndefined Nothing), "marker": (NullOrUndefined Nothing) }



-- | <p>Contains the parameters for RemoveTags.</p>
newtype RemoveTagsInput = RemoveTagsInput 
  { "pipelineId" :: (Id')
  , "tagKeys" :: (StringList')
  }
derive instance newtypeRemoveTagsInput :: Newtype RemoveTagsInput _
derive instance repGenericRemoveTagsInput :: Generic RemoveTagsInput _
instance showRemoveTagsInput :: Show RemoveTagsInput where
  show = genericShow
instance decodeRemoveTagsInput :: Decode RemoveTagsInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRemoveTagsInput :: Encode RemoveTagsInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RemoveTagsInput from required parameters
newRemoveTagsInput :: Id' -> StringList' -> RemoveTagsInput
newRemoveTagsInput _pipelineId _tagKeys = RemoveTagsInput { "pipelineId": _pipelineId, "tagKeys": _tagKeys }

-- | Constructs RemoveTagsInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRemoveTagsInput' :: Id' -> StringList' -> ( { "pipelineId" :: (Id') , "tagKeys" :: (StringList') } -> {"pipelineId" :: (Id') , "tagKeys" :: (StringList') } ) -> RemoveTagsInput
newRemoveTagsInput' _pipelineId _tagKeys customize = (RemoveTagsInput <<< customize) { "pipelineId": _pipelineId, "tagKeys": _tagKeys }



-- | <p>Contains the output of RemoveTags.</p>
newtype RemoveTagsOutput = RemoveTagsOutput Types.NoArguments
derive instance newtypeRemoveTagsOutput :: Newtype RemoveTagsOutput _
derive instance repGenericRemoveTagsOutput :: Generic RemoveTagsOutput _
instance showRemoveTagsOutput :: Show RemoveTagsOutput where
  show = genericShow
instance decodeRemoveTagsOutput :: Decode RemoveTagsOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRemoveTagsOutput :: Encode RemoveTagsOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Contains the parameters for ReportTaskProgress.</p>
newtype ReportTaskProgressInput = ReportTaskProgressInput 
  { "taskId" :: (TaskId')
  , "fields" :: NullOrUndefined.NullOrUndefined (FieldList')
  }
derive instance newtypeReportTaskProgressInput :: Newtype ReportTaskProgressInput _
derive instance repGenericReportTaskProgressInput :: Generic ReportTaskProgressInput _
instance showReportTaskProgressInput :: Show ReportTaskProgressInput where
  show = genericShow
instance decodeReportTaskProgressInput :: Decode ReportTaskProgressInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeReportTaskProgressInput :: Encode ReportTaskProgressInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ReportTaskProgressInput from required parameters
newReportTaskProgressInput :: TaskId' -> ReportTaskProgressInput
newReportTaskProgressInput _taskId = ReportTaskProgressInput { "taskId": _taskId, "fields": (NullOrUndefined Nothing) }

-- | Constructs ReportTaskProgressInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newReportTaskProgressInput' :: TaskId' -> ( { "taskId" :: (TaskId') , "fields" :: NullOrUndefined.NullOrUndefined (FieldList') } -> {"taskId" :: (TaskId') , "fields" :: NullOrUndefined.NullOrUndefined (FieldList') } ) -> ReportTaskProgressInput
newReportTaskProgressInput' _taskId customize = (ReportTaskProgressInput <<< customize) { "taskId": _taskId, "fields": (NullOrUndefined Nothing) }



-- | <p>Contains the output of ReportTaskProgress.</p>
newtype ReportTaskProgressOutput = ReportTaskProgressOutput 
  { "canceled" :: (Boolean)
  }
derive instance newtypeReportTaskProgressOutput :: Newtype ReportTaskProgressOutput _
derive instance repGenericReportTaskProgressOutput :: Generic ReportTaskProgressOutput _
instance showReportTaskProgressOutput :: Show ReportTaskProgressOutput where
  show = genericShow
instance decodeReportTaskProgressOutput :: Decode ReportTaskProgressOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeReportTaskProgressOutput :: Encode ReportTaskProgressOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ReportTaskProgressOutput from required parameters
newReportTaskProgressOutput :: Boolean -> ReportTaskProgressOutput
newReportTaskProgressOutput _canceled = ReportTaskProgressOutput { "canceled": _canceled }

-- | Constructs ReportTaskProgressOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newReportTaskProgressOutput' :: Boolean -> ( { "canceled" :: (Boolean) } -> {"canceled" :: (Boolean) } ) -> ReportTaskProgressOutput
newReportTaskProgressOutput' _canceled customize = (ReportTaskProgressOutput <<< customize) { "canceled": _canceled }



-- | <p>Contains the parameters for ReportTaskRunnerHeartbeat.</p>
newtype ReportTaskRunnerHeartbeatInput = ReportTaskRunnerHeartbeatInput 
  { "taskrunnerId" :: (Id')
  , "workerGroup" :: NullOrUndefined.NullOrUndefined (String)
  , "hostname" :: NullOrUndefined.NullOrUndefined (Id')
  }
derive instance newtypeReportTaskRunnerHeartbeatInput :: Newtype ReportTaskRunnerHeartbeatInput _
derive instance repGenericReportTaskRunnerHeartbeatInput :: Generic ReportTaskRunnerHeartbeatInput _
instance showReportTaskRunnerHeartbeatInput :: Show ReportTaskRunnerHeartbeatInput where
  show = genericShow
instance decodeReportTaskRunnerHeartbeatInput :: Decode ReportTaskRunnerHeartbeatInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeReportTaskRunnerHeartbeatInput :: Encode ReportTaskRunnerHeartbeatInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ReportTaskRunnerHeartbeatInput from required parameters
newReportTaskRunnerHeartbeatInput :: Id' -> ReportTaskRunnerHeartbeatInput
newReportTaskRunnerHeartbeatInput _taskrunnerId = ReportTaskRunnerHeartbeatInput { "taskrunnerId": _taskrunnerId, "hostname": (NullOrUndefined Nothing), "workerGroup": (NullOrUndefined Nothing) }

-- | Constructs ReportTaskRunnerHeartbeatInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newReportTaskRunnerHeartbeatInput' :: Id' -> ( { "taskrunnerId" :: (Id') , "workerGroup" :: NullOrUndefined.NullOrUndefined (String) , "hostname" :: NullOrUndefined.NullOrUndefined (Id') } -> {"taskrunnerId" :: (Id') , "workerGroup" :: NullOrUndefined.NullOrUndefined (String) , "hostname" :: NullOrUndefined.NullOrUndefined (Id') } ) -> ReportTaskRunnerHeartbeatInput
newReportTaskRunnerHeartbeatInput' _taskrunnerId customize = (ReportTaskRunnerHeartbeatInput <<< customize) { "taskrunnerId": _taskrunnerId, "hostname": (NullOrUndefined Nothing), "workerGroup": (NullOrUndefined Nothing) }



-- | <p>Contains the output of ReportTaskRunnerHeartbeat.</p>
newtype ReportTaskRunnerHeartbeatOutput = ReportTaskRunnerHeartbeatOutput 
  { "terminate" :: (Boolean)
  }
derive instance newtypeReportTaskRunnerHeartbeatOutput :: Newtype ReportTaskRunnerHeartbeatOutput _
derive instance repGenericReportTaskRunnerHeartbeatOutput :: Generic ReportTaskRunnerHeartbeatOutput _
instance showReportTaskRunnerHeartbeatOutput :: Show ReportTaskRunnerHeartbeatOutput where
  show = genericShow
instance decodeReportTaskRunnerHeartbeatOutput :: Decode ReportTaskRunnerHeartbeatOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeReportTaskRunnerHeartbeatOutput :: Encode ReportTaskRunnerHeartbeatOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ReportTaskRunnerHeartbeatOutput from required parameters
newReportTaskRunnerHeartbeatOutput :: Boolean -> ReportTaskRunnerHeartbeatOutput
newReportTaskRunnerHeartbeatOutput _terminate = ReportTaskRunnerHeartbeatOutput { "terminate": _terminate }

-- | Constructs ReportTaskRunnerHeartbeatOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newReportTaskRunnerHeartbeatOutput' :: Boolean -> ( { "terminate" :: (Boolean) } -> {"terminate" :: (Boolean) } ) -> ReportTaskRunnerHeartbeatOutput
newReportTaskRunnerHeartbeatOutput' _terminate customize = (ReportTaskRunnerHeartbeatOutput <<< customize) { "terminate": _terminate }



-- | <p>A comparision that is used to determine whether a query should return this object.</p>
newtype Selector = Selector 
  { "fieldName" :: NullOrUndefined.NullOrUndefined (String)
  , "operator" :: NullOrUndefined.NullOrUndefined (Operator)
  }
derive instance newtypeSelector :: Newtype Selector _
derive instance repGenericSelector :: Generic Selector _
instance showSelector :: Show Selector where
  show = genericShow
instance decodeSelector :: Decode Selector where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSelector :: Encode Selector where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Selector from required parameters
newSelector :: Selector
newSelector  = Selector { "fieldName": (NullOrUndefined Nothing), "operator": (NullOrUndefined Nothing) }

-- | Constructs Selector's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSelector' :: ( { "fieldName" :: NullOrUndefined.NullOrUndefined (String) , "operator" :: NullOrUndefined.NullOrUndefined (Operator) } -> {"fieldName" :: NullOrUndefined.NullOrUndefined (String) , "operator" :: NullOrUndefined.NullOrUndefined (Operator) } ) -> Selector
newSelector'  customize = (Selector <<< customize) { "fieldName": (NullOrUndefined Nothing), "operator": (NullOrUndefined Nothing) }



-- | <p>The list of Selectors that define queries on individual fields.</p>
newtype SelectorList = SelectorList (Array Selector)
derive instance newtypeSelectorList :: Newtype SelectorList _
derive instance repGenericSelectorList :: Generic SelectorList _
instance showSelectorList :: Show SelectorList where
  show = genericShow
instance decodeSelectorList :: Decode SelectorList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSelectorList :: Encode SelectorList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Contains the parameters for SetStatus.</p>
newtype SetStatusInput = SetStatusInput 
  { "pipelineId" :: (Id')
  , "objectIds" :: (IdList')
  , "status" :: (String)
  }
derive instance newtypeSetStatusInput :: Newtype SetStatusInput _
derive instance repGenericSetStatusInput :: Generic SetStatusInput _
instance showSetStatusInput :: Show SetStatusInput where
  show = genericShow
instance decodeSetStatusInput :: Decode SetStatusInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSetStatusInput :: Encode SetStatusInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs SetStatusInput from required parameters
newSetStatusInput :: IdList' -> Id' -> String -> SetStatusInput
newSetStatusInput _objectIds _pipelineId _status = SetStatusInput { "objectIds": _objectIds, "pipelineId": _pipelineId, "status": _status }

-- | Constructs SetStatusInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSetStatusInput' :: IdList' -> Id' -> String -> ( { "pipelineId" :: (Id') , "objectIds" :: (IdList') , "status" :: (String) } -> {"pipelineId" :: (Id') , "objectIds" :: (IdList') , "status" :: (String) } ) -> SetStatusInput
newSetStatusInput' _objectIds _pipelineId _status customize = (SetStatusInput <<< customize) { "objectIds": _objectIds, "pipelineId": _pipelineId, "status": _status }



-- | <p>Contains the parameters for SetTaskStatus.</p>
newtype SetTaskStatusInput = SetTaskStatusInput 
  { "taskId" :: (TaskId')
  , "taskStatus" :: (TaskStatus)
  , "errorId" :: NullOrUndefined.NullOrUndefined (String)
  , "errorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage')
  , "errorStackTrace" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeSetTaskStatusInput :: Newtype SetTaskStatusInput _
derive instance repGenericSetTaskStatusInput :: Generic SetTaskStatusInput _
instance showSetTaskStatusInput :: Show SetTaskStatusInput where
  show = genericShow
instance decodeSetTaskStatusInput :: Decode SetTaskStatusInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSetTaskStatusInput :: Encode SetTaskStatusInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs SetTaskStatusInput from required parameters
newSetTaskStatusInput :: TaskId' -> TaskStatus -> SetTaskStatusInput
newSetTaskStatusInput _taskId _taskStatus = SetTaskStatusInput { "taskId": _taskId, "taskStatus": _taskStatus, "errorId": (NullOrUndefined Nothing), "errorMessage": (NullOrUndefined Nothing), "errorStackTrace": (NullOrUndefined Nothing) }

-- | Constructs SetTaskStatusInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSetTaskStatusInput' :: TaskId' -> TaskStatus -> ( { "taskId" :: (TaskId') , "taskStatus" :: (TaskStatus) , "errorId" :: NullOrUndefined.NullOrUndefined (String) , "errorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage') , "errorStackTrace" :: NullOrUndefined.NullOrUndefined (String) } -> {"taskId" :: (TaskId') , "taskStatus" :: (TaskStatus) , "errorId" :: NullOrUndefined.NullOrUndefined (String) , "errorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage') , "errorStackTrace" :: NullOrUndefined.NullOrUndefined (String) } ) -> SetTaskStatusInput
newSetTaskStatusInput' _taskId _taskStatus customize = (SetTaskStatusInput <<< customize) { "taskId": _taskId, "taskStatus": _taskStatus, "errorId": (NullOrUndefined Nothing), "errorMessage": (NullOrUndefined Nothing), "errorStackTrace": (NullOrUndefined Nothing) }



-- | <p>Contains the output of SetTaskStatus.</p>
newtype SetTaskStatusOutput = SetTaskStatusOutput Types.NoArguments
derive instance newtypeSetTaskStatusOutput :: Newtype SetTaskStatusOutput _
derive instance repGenericSetTaskStatusOutput :: Generic SetTaskStatusOutput _
instance showSetTaskStatusOutput :: Show SetTaskStatusOutput where
  show = genericShow
instance decodeSetTaskStatusOutput :: Decode SetTaskStatusOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSetTaskStatusOutput :: Encode SetTaskStatusOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Tags are key/value pairs defined by a user and associated with a pipeline to control access. AWS Data Pipeline allows you to associate ten tags per pipeline. For more information, see <a href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer Guide</i>.</p>
newtype Tag = Tag 
  { "key" :: (TagKey')
  , "value" :: (TagValue')
  }
derive instance newtypeTag :: Newtype Tag _
derive instance repGenericTag :: Generic Tag _
instance showTag :: Show Tag where
  show = genericShow
instance decodeTag :: Decode Tag where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTag :: Encode Tag where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Tag from required parameters
newTag :: TagKey' -> TagValue' -> Tag
newTag _key _value = Tag { "key": _key, "value": _value }

-- | Constructs Tag's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTag' :: TagKey' -> TagValue' -> ( { "key" :: (TagKey') , "value" :: (TagValue') } -> {"key" :: (TagKey') , "value" :: (TagValue') } ) -> Tag
newTag' _key _value customize = (Tag <<< customize) { "key": _key, "value": _value }



-- | <p>The specified task was not found. </p>
newtype TaskNotFoundException = TaskNotFoundException 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage')
  }
derive instance newtypeTaskNotFoundException :: Newtype TaskNotFoundException _
derive instance repGenericTaskNotFoundException :: Generic TaskNotFoundException _
instance showTaskNotFoundException :: Show TaskNotFoundException where
  show = genericShow
instance decodeTaskNotFoundException :: Decode TaskNotFoundException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTaskNotFoundException :: Encode TaskNotFoundException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TaskNotFoundException from required parameters
newTaskNotFoundException :: TaskNotFoundException
newTaskNotFoundException  = TaskNotFoundException { "message": (NullOrUndefined Nothing) }

-- | Constructs TaskNotFoundException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTaskNotFoundException' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage') } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage') } ) -> TaskNotFoundException
newTaskNotFoundException'  customize = (TaskNotFoundException <<< customize) { "message": (NullOrUndefined Nothing) }



-- | <p>Contains information about a pipeline task that is assigned to a task runner.</p>
newtype TaskObject = TaskObject 
  { "taskId" :: NullOrUndefined.NullOrUndefined (TaskId')
  , "pipelineId" :: NullOrUndefined.NullOrUndefined (Id')
  , "attemptId" :: NullOrUndefined.NullOrUndefined (Id')
  , "objects" :: NullOrUndefined.NullOrUndefined (PipelineObjectMap)
  }
derive instance newtypeTaskObject :: Newtype TaskObject _
derive instance repGenericTaskObject :: Generic TaskObject _
instance showTaskObject :: Show TaskObject where
  show = genericShow
instance decodeTaskObject :: Decode TaskObject where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTaskObject :: Encode TaskObject where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TaskObject from required parameters
newTaskObject :: TaskObject
newTaskObject  = TaskObject { "attemptId": (NullOrUndefined Nothing), "objects": (NullOrUndefined Nothing), "pipelineId": (NullOrUndefined Nothing), "taskId": (NullOrUndefined Nothing) }

-- | Constructs TaskObject's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTaskObject' :: ( { "taskId" :: NullOrUndefined.NullOrUndefined (TaskId') , "pipelineId" :: NullOrUndefined.NullOrUndefined (Id') , "attemptId" :: NullOrUndefined.NullOrUndefined (Id') , "objects" :: NullOrUndefined.NullOrUndefined (PipelineObjectMap) } -> {"taskId" :: NullOrUndefined.NullOrUndefined (TaskId') , "pipelineId" :: NullOrUndefined.NullOrUndefined (Id') , "attemptId" :: NullOrUndefined.NullOrUndefined (Id') , "objects" :: NullOrUndefined.NullOrUndefined (PipelineObjectMap) } ) -> TaskObject
newTaskObject'  customize = (TaskObject <<< customize) { "attemptId": (NullOrUndefined Nothing), "objects": (NullOrUndefined Nothing), "pipelineId": (NullOrUndefined Nothing), "taskId": (NullOrUndefined Nothing) }



newtype TaskStatus = TaskStatus String
derive instance newtypeTaskStatus :: Newtype TaskStatus _
derive instance repGenericTaskStatus :: Generic TaskStatus _
instance showTaskStatus :: Show TaskStatus where
  show = genericShow
instance decodeTaskStatus :: Decode TaskStatus where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTaskStatus :: Encode TaskStatus where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Contains the parameters for ValidatePipelineDefinition.</p>
newtype ValidatePipelineDefinitionInput = ValidatePipelineDefinitionInput 
  { "pipelineId" :: (Id')
  , "pipelineObjects" :: (PipelineObjectList)
  , "parameterObjects" :: NullOrUndefined.NullOrUndefined (ParameterObjectList)
  , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList)
  }
derive instance newtypeValidatePipelineDefinitionInput :: Newtype ValidatePipelineDefinitionInput _
derive instance repGenericValidatePipelineDefinitionInput :: Generic ValidatePipelineDefinitionInput _
instance showValidatePipelineDefinitionInput :: Show ValidatePipelineDefinitionInput where
  show = genericShow
instance decodeValidatePipelineDefinitionInput :: Decode ValidatePipelineDefinitionInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeValidatePipelineDefinitionInput :: Encode ValidatePipelineDefinitionInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ValidatePipelineDefinitionInput from required parameters
newValidatePipelineDefinitionInput :: Id' -> PipelineObjectList -> ValidatePipelineDefinitionInput
newValidatePipelineDefinitionInput _pipelineId _pipelineObjects = ValidatePipelineDefinitionInput { "pipelineId": _pipelineId, "pipelineObjects": _pipelineObjects, "parameterObjects": (NullOrUndefined Nothing), "parameterValues": (NullOrUndefined Nothing) }

-- | Constructs ValidatePipelineDefinitionInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newValidatePipelineDefinitionInput' :: Id' -> PipelineObjectList -> ( { "pipelineId" :: (Id') , "pipelineObjects" :: (PipelineObjectList) , "parameterObjects" :: NullOrUndefined.NullOrUndefined (ParameterObjectList) , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList) } -> {"pipelineId" :: (Id') , "pipelineObjects" :: (PipelineObjectList) , "parameterObjects" :: NullOrUndefined.NullOrUndefined (ParameterObjectList) , "parameterValues" :: NullOrUndefined.NullOrUndefined (ParameterValueList) } ) -> ValidatePipelineDefinitionInput
newValidatePipelineDefinitionInput' _pipelineId _pipelineObjects customize = (ValidatePipelineDefinitionInput <<< customize) { "pipelineId": _pipelineId, "pipelineObjects": _pipelineObjects, "parameterObjects": (NullOrUndefined Nothing), "parameterValues": (NullOrUndefined Nothing) }



-- | <p>Contains the output of ValidatePipelineDefinition.</p>
newtype ValidatePipelineDefinitionOutput = ValidatePipelineDefinitionOutput 
  { "validationErrors" :: NullOrUndefined.NullOrUndefined (ValidationErrors)
  , "validationWarnings" :: NullOrUndefined.NullOrUndefined (ValidationWarnings)
  , "errored" :: (Boolean)
  }
derive instance newtypeValidatePipelineDefinitionOutput :: Newtype ValidatePipelineDefinitionOutput _
derive instance repGenericValidatePipelineDefinitionOutput :: Generic ValidatePipelineDefinitionOutput _
instance showValidatePipelineDefinitionOutput :: Show ValidatePipelineDefinitionOutput where
  show = genericShow
instance decodeValidatePipelineDefinitionOutput :: Decode ValidatePipelineDefinitionOutput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeValidatePipelineDefinitionOutput :: Encode ValidatePipelineDefinitionOutput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ValidatePipelineDefinitionOutput from required parameters
newValidatePipelineDefinitionOutput :: Boolean -> ValidatePipelineDefinitionOutput
newValidatePipelineDefinitionOutput _errored = ValidatePipelineDefinitionOutput { "errored": _errored, "validationErrors": (NullOrUndefined Nothing), "validationWarnings": (NullOrUndefined Nothing) }

-- | Constructs ValidatePipelineDefinitionOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newValidatePipelineDefinitionOutput' :: Boolean -> ( { "validationErrors" :: NullOrUndefined.NullOrUndefined (ValidationErrors) , "validationWarnings" :: NullOrUndefined.NullOrUndefined (ValidationWarnings) , "errored" :: (Boolean) } -> {"validationErrors" :: NullOrUndefined.NullOrUndefined (ValidationErrors) , "validationWarnings" :: NullOrUndefined.NullOrUndefined (ValidationWarnings) , "errored" :: (Boolean) } ) -> ValidatePipelineDefinitionOutput
newValidatePipelineDefinitionOutput' _errored customize = (ValidatePipelineDefinitionOutput <<< customize) { "errored": _errored, "validationErrors": (NullOrUndefined Nothing), "validationWarnings": (NullOrUndefined Nothing) }



-- | <p>Defines a validation error. Validation errors prevent pipeline activation. The set of validation errors that can be returned are defined by AWS Data Pipeline.</p>
newtype ValidationError = ValidationError 
  { "id" :: NullOrUndefined.NullOrUndefined (Id')
  , "errors" :: NullOrUndefined.NullOrUndefined (ValidationMessages')
  }
derive instance newtypeValidationError :: Newtype ValidationError _
derive instance repGenericValidationError :: Generic ValidationError _
instance showValidationError :: Show ValidationError where
  show = genericShow
instance decodeValidationError :: Decode ValidationError where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeValidationError :: Encode ValidationError where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ValidationError from required parameters
newValidationError :: ValidationError
newValidationError  = ValidationError { "errors": (NullOrUndefined Nothing), "id": (NullOrUndefined Nothing) }

-- | Constructs ValidationError's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newValidationError' :: ( { "id" :: NullOrUndefined.NullOrUndefined (Id') , "errors" :: NullOrUndefined.NullOrUndefined (ValidationMessages') } -> {"id" :: NullOrUndefined.NullOrUndefined (Id') , "errors" :: NullOrUndefined.NullOrUndefined (ValidationMessages') } ) -> ValidationError
newValidationError'  customize = (ValidationError <<< customize) { "errors": (NullOrUndefined Nothing), "id": (NullOrUndefined Nothing) }



newtype ValidationErrors = ValidationErrors (Array ValidationError)
derive instance newtypeValidationErrors :: Newtype ValidationErrors _
derive instance repGenericValidationErrors :: Generic ValidationErrors _
instance showValidationErrors :: Show ValidationErrors where
  show = genericShow
instance decodeValidationErrors :: Decode ValidationErrors where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeValidationErrors :: Encode ValidationErrors where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Defines a validation warning. Validation warnings do not prevent pipeline activation. The set of validation warnings that can be returned are defined by AWS Data Pipeline.</p>
newtype ValidationWarning = ValidationWarning 
  { "id" :: NullOrUndefined.NullOrUndefined (Id')
  , "warnings" :: NullOrUndefined.NullOrUndefined (ValidationMessages')
  }
derive instance newtypeValidationWarning :: Newtype ValidationWarning _
derive instance repGenericValidationWarning :: Generic ValidationWarning _
instance showValidationWarning :: Show ValidationWarning where
  show = genericShow
instance decodeValidationWarning :: Decode ValidationWarning where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeValidationWarning :: Encode ValidationWarning where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ValidationWarning from required parameters
newValidationWarning :: ValidationWarning
newValidationWarning  = ValidationWarning { "id": (NullOrUndefined Nothing), "warnings": (NullOrUndefined Nothing) }

-- | Constructs ValidationWarning's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newValidationWarning' :: ( { "id" :: NullOrUndefined.NullOrUndefined (Id') , "warnings" :: NullOrUndefined.NullOrUndefined (ValidationMessages') } -> {"id" :: NullOrUndefined.NullOrUndefined (Id') , "warnings" :: NullOrUndefined.NullOrUndefined (ValidationMessages') } ) -> ValidationWarning
newValidationWarning'  customize = (ValidationWarning <<< customize) { "id": (NullOrUndefined Nothing), "warnings": (NullOrUndefined Nothing) }



newtype ValidationWarnings = ValidationWarnings (Array ValidationWarning)
derive instance newtypeValidationWarnings :: Newtype ValidationWarnings _
derive instance repGenericValidationWarnings :: Generic ValidationWarnings _
instance showValidationWarnings :: Show ValidationWarnings where
  show = genericShow
instance decodeValidationWarnings :: Decode ValidationWarnings where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeValidationWarnings :: Encode ValidationWarnings where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype AttributeNameString' = AttributeNameString' String
derive instance newtypeAttributeNameString' :: Newtype AttributeNameString' _
derive instance repGenericAttributeNameString' :: Generic AttributeNameString' _
instance showAttributeNameString' :: Show AttributeNameString' where
  show = genericShow
instance decodeAttributeNameString' :: Decode AttributeNameString' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttributeNameString' :: Encode AttributeNameString' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype AttributeValueString' = AttributeValueString' String
derive instance newtypeAttributeValueString' :: Newtype AttributeValueString' _
derive instance repGenericAttributeValueString' :: Generic AttributeValueString' _
instance showAttributeValueString' :: Show AttributeValueString' where
  show = genericShow
instance decodeAttributeValueString' :: Decode AttributeValueString' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttributeValueString' :: Encode AttributeValueString' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype CancelActive' = CancelActive' Boolean
derive instance newtypeCancelActive' :: Newtype CancelActive' _
derive instance repGenericCancelActive' :: Generic CancelActive' _
instance showCancelActive' :: Show CancelActive' where
  show = genericShow
instance decodeCancelActive' :: Decode CancelActive' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCancelActive' :: Encode CancelActive' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ErrorMessage' = ErrorMessage' String
derive instance newtypeErrorMessage' :: Newtype ErrorMessage' _
derive instance repGenericErrorMessage' :: Generic ErrorMessage' _
instance showErrorMessage' :: Show ErrorMessage' where
  show = genericShow
instance decodeErrorMessage' :: Decode ErrorMessage' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeErrorMessage' :: Encode ErrorMessage' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype FieldList' = FieldList' (Array Field)
derive instance newtypeFieldList' :: Newtype FieldList' _
derive instance repGenericFieldList' :: Generic FieldList' _
instance showFieldList' :: Show FieldList' where
  show = genericShow
instance decodeFieldList' :: Decode FieldList' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeFieldList' :: Encode FieldList' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype FieldNameString' = FieldNameString' String
derive instance newtypeFieldNameString' :: Newtype FieldNameString' _
derive instance repGenericFieldNameString' :: Generic FieldNameString' _
instance showFieldNameString' :: Show FieldNameString' where
  show = genericShow
instance decodeFieldNameString' :: Decode FieldNameString' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeFieldNameString' :: Encode FieldNameString' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype FieldStringValue' = FieldStringValue' String
derive instance newtypeFieldStringValue' :: Newtype FieldStringValue' _
derive instance repGenericFieldStringValue' :: Generic FieldStringValue' _
instance showFieldStringValue' :: Show FieldStringValue' where
  show = genericShow
instance decodeFieldStringValue' :: Decode FieldStringValue' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeFieldStringValue' :: Encode FieldStringValue' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype Id' = Id' String
derive instance newtypeId' :: Newtype Id' _
derive instance repGenericId' :: Generic Id' _
instance showId' :: Show Id' where
  show = genericShow
instance decodeId' :: Decode Id' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeId' :: Encode Id' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype IdList' = IdList' (Array Id')
derive instance newtypeIdList' :: Newtype IdList' _
derive instance repGenericIdList' :: Generic IdList' _
instance showIdList' :: Show IdList' where
  show = genericShow
instance decodeIdList' :: Decode IdList' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeIdList' :: Encode IdList' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype LongString' = LongString' String
derive instance newtypeLongString' :: Newtype LongString' _
derive instance repGenericLongString' :: Generic LongString' _
instance showLongString' :: Show LongString' where
  show = genericShow
instance decodeLongString' :: Decode LongString' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeLongString' :: Encode LongString' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype PipelineList' = PipelineList' (Array PipelineIdName)
derive instance newtypePipelineList' :: Newtype PipelineList' _
derive instance repGenericPipelineList' :: Generic PipelineList' _
instance showPipelineList' :: Show PipelineList' where
  show = genericShow
instance decodePipelineList' :: Decode PipelineList' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePipelineList' :: Encode PipelineList' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype StringList' = StringList' (Array String)
derive instance newtypeStringList' :: Newtype StringList' _
derive instance repGenericStringList' :: Generic StringList' _
instance showStringList' :: Show StringList' where
  show = genericShow
instance decodeStringList' :: Decode StringList' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeStringList' :: Encode StringList' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TagKey' = TagKey' String
derive instance newtypeTagKey' :: Newtype TagKey' _
derive instance repGenericTagKey' :: Generic TagKey' _
instance showTagKey' :: Show TagKey' where
  show = genericShow
instance decodeTagKey' :: Decode TagKey' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTagKey' :: Encode TagKey' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TagList' = TagList' (Array Tag)
derive instance newtypeTagList' :: Newtype TagList' _
derive instance repGenericTagList' :: Generic TagList' _
instance showTagList' :: Show TagList' where
  show = genericShow
instance decodeTagList' :: Decode TagList' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTagList' :: Encode TagList' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TagValue' = TagValue' String
derive instance newtypeTagValue' :: Newtype TagValue' _
derive instance repGenericTagValue' :: Generic TagValue' _
instance showTagValue' :: Show TagValue' where
  show = genericShow
instance decodeTagValue' :: Decode TagValue' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTagValue' :: Encode TagValue' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TaskId' = TaskId' String
derive instance newtypeTaskId' :: Newtype TaskId' _
derive instance repGenericTaskId' :: Generic TaskId' _
instance showTaskId' :: Show TaskId' where
  show = genericShow
instance decodeTaskId' :: Decode TaskId' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTaskId' :: Encode TaskId' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ValidationMessage' = ValidationMessage' String
derive instance newtypeValidationMessage' :: Newtype ValidationMessage' _
derive instance repGenericValidationMessage' :: Generic ValidationMessage' _
instance showValidationMessage' :: Show ValidationMessage' where
  show = genericShow
instance decodeValidationMessage' :: Decode ValidationMessage' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeValidationMessage' :: Encode ValidationMessage' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ValidationMessages' = ValidationMessages' (Array ValidationMessage')
derive instance newtypeValidationMessages' :: Newtype ValidationMessages' _
derive instance repGenericValidationMessages' :: Generic ValidationMessages' _
instance showValidationMessages' :: Show ValidationMessages' where
  show = genericShow
instance decodeValidationMessages' :: Decode ValidationMessages' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeValidationMessages' :: Encode ValidationMessages' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

