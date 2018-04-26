
module AWS.DataPipeline.Types where

import Prelude
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic.Types (Options)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap) as StrMap

import AWS.Request.Types as Types

options :: Options
options = defaultOptions { unwrapSingleConstructors = true }


-- | <p>Contains the parameters for ActivatePipeline.</p>
newtype ActivatePipelineInput = ActivatePipelineInput 
  { "pipelineId" :: (Id')
  , "parameterValues" :: Maybe (ParameterValueList)
  , "startTimestamp" :: Maybe (Types.Timestamp)
  }
derive instance newtypeActivatePipelineInput :: Newtype ActivatePipelineInput _
derive instance repGenericActivatePipelineInput :: Generic ActivatePipelineInput _
instance showActivatePipelineInput :: Show ActivatePipelineInput where show = genericShow
instance decodeActivatePipelineInput :: Decode ActivatePipelineInput where decode = genericDecode options
instance encodeActivatePipelineInput :: Encode ActivatePipelineInput where encode = genericEncode options

-- | Constructs ActivatePipelineInput from required parameters
newActivatePipelineInput :: Id' -> ActivatePipelineInput
newActivatePipelineInput _pipelineId = ActivatePipelineInput { "pipelineId": _pipelineId, "parameterValues": Nothing, "startTimestamp": Nothing }

-- | Constructs ActivatePipelineInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newActivatePipelineInput' :: Id' -> ( { "pipelineId" :: (Id') , "parameterValues" :: Maybe (ParameterValueList) , "startTimestamp" :: Maybe (Types.Timestamp) } -> {"pipelineId" :: (Id') , "parameterValues" :: Maybe (ParameterValueList) , "startTimestamp" :: Maybe (Types.Timestamp) } ) -> ActivatePipelineInput
newActivatePipelineInput' _pipelineId customize = (ActivatePipelineInput <<< customize) { "pipelineId": _pipelineId, "parameterValues": Nothing, "startTimestamp": Nothing }



-- | <p>Contains the output of ActivatePipeline.</p>
newtype ActivatePipelineOutput = ActivatePipelineOutput Types.NoArguments
derive instance newtypeActivatePipelineOutput :: Newtype ActivatePipelineOutput _
derive instance repGenericActivatePipelineOutput :: Generic ActivatePipelineOutput _
instance showActivatePipelineOutput :: Show ActivatePipelineOutput where show = genericShow
instance decodeActivatePipelineOutput :: Decode ActivatePipelineOutput where decode = genericDecode options
instance encodeActivatePipelineOutput :: Encode ActivatePipelineOutput where encode = genericEncode options



-- | <p>Contains the parameters for AddTags.</p>
newtype AddTagsInput = AddTagsInput 
  { "pipelineId" :: (Id')
  , "tags" :: (TagList')
  }
derive instance newtypeAddTagsInput :: Newtype AddTagsInput _
derive instance repGenericAddTagsInput :: Generic AddTagsInput _
instance showAddTagsInput :: Show AddTagsInput where show = genericShow
instance decodeAddTagsInput :: Decode AddTagsInput where decode = genericDecode options
instance encodeAddTagsInput :: Encode AddTagsInput where encode = genericEncode options

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
instance showAddTagsOutput :: Show AddTagsOutput where show = genericShow
instance decodeAddTagsOutput :: Decode AddTagsOutput where decode = genericDecode options
instance encodeAddTagsOutput :: Encode AddTagsOutput where encode = genericEncode options



-- | <p>Contains the parameters for CreatePipeline.</p>
newtype CreatePipelineInput = CreatePipelineInput 
  { "name" :: (Id')
  , "uniqueId" :: (Id')
  , "description" :: Maybe (String)
  , "tags" :: Maybe (TagList')
  }
derive instance newtypeCreatePipelineInput :: Newtype CreatePipelineInput _
derive instance repGenericCreatePipelineInput :: Generic CreatePipelineInput _
instance showCreatePipelineInput :: Show CreatePipelineInput where show = genericShow
instance decodeCreatePipelineInput :: Decode CreatePipelineInput where decode = genericDecode options
instance encodeCreatePipelineInput :: Encode CreatePipelineInput where encode = genericEncode options

-- | Constructs CreatePipelineInput from required parameters
newCreatePipelineInput :: Id' -> Id' -> CreatePipelineInput
newCreatePipelineInput _name _uniqueId = CreatePipelineInput { "name": _name, "uniqueId": _uniqueId, "description": Nothing, "tags": Nothing }

-- | Constructs CreatePipelineInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCreatePipelineInput' :: Id' -> Id' -> ( { "name" :: (Id') , "uniqueId" :: (Id') , "description" :: Maybe (String) , "tags" :: Maybe (TagList') } -> {"name" :: (Id') , "uniqueId" :: (Id') , "description" :: Maybe (String) , "tags" :: Maybe (TagList') } ) -> CreatePipelineInput
newCreatePipelineInput' _name _uniqueId customize = (CreatePipelineInput <<< customize) { "name": _name, "uniqueId": _uniqueId, "description": Nothing, "tags": Nothing }



-- | <p>Contains the output of CreatePipeline.</p>
newtype CreatePipelineOutput = CreatePipelineOutput 
  { "pipelineId" :: (Id')
  }
derive instance newtypeCreatePipelineOutput :: Newtype CreatePipelineOutput _
derive instance repGenericCreatePipelineOutput :: Generic CreatePipelineOutput _
instance showCreatePipelineOutput :: Show CreatePipelineOutput where show = genericShow
instance decodeCreatePipelineOutput :: Decode CreatePipelineOutput where decode = genericDecode options
instance encodeCreatePipelineOutput :: Encode CreatePipelineOutput where encode = genericEncode options

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
  , "cancelActive" :: Maybe (CancelActive')
  }
derive instance newtypeDeactivatePipelineInput :: Newtype DeactivatePipelineInput _
derive instance repGenericDeactivatePipelineInput :: Generic DeactivatePipelineInput _
instance showDeactivatePipelineInput :: Show DeactivatePipelineInput where show = genericShow
instance decodeDeactivatePipelineInput :: Decode DeactivatePipelineInput where decode = genericDecode options
instance encodeDeactivatePipelineInput :: Encode DeactivatePipelineInput where encode = genericEncode options

-- | Constructs DeactivatePipelineInput from required parameters
newDeactivatePipelineInput :: Id' -> DeactivatePipelineInput
newDeactivatePipelineInput _pipelineId = DeactivatePipelineInput { "pipelineId": _pipelineId, "cancelActive": Nothing }

-- | Constructs DeactivatePipelineInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeactivatePipelineInput' :: Id' -> ( { "pipelineId" :: (Id') , "cancelActive" :: Maybe (CancelActive') } -> {"pipelineId" :: (Id') , "cancelActive" :: Maybe (CancelActive') } ) -> DeactivatePipelineInput
newDeactivatePipelineInput' _pipelineId customize = (DeactivatePipelineInput <<< customize) { "pipelineId": _pipelineId, "cancelActive": Nothing }



-- | <p>Contains the output of DeactivatePipeline.</p>
newtype DeactivatePipelineOutput = DeactivatePipelineOutput Types.NoArguments
derive instance newtypeDeactivatePipelineOutput :: Newtype DeactivatePipelineOutput _
derive instance repGenericDeactivatePipelineOutput :: Generic DeactivatePipelineOutput _
instance showDeactivatePipelineOutput :: Show DeactivatePipelineOutput where show = genericShow
instance decodeDeactivatePipelineOutput :: Decode DeactivatePipelineOutput where decode = genericDecode options
instance encodeDeactivatePipelineOutput :: Encode DeactivatePipelineOutput where encode = genericEncode options



-- | <p>Contains the parameters for DeletePipeline.</p>
newtype DeletePipelineInput = DeletePipelineInput 
  { "pipelineId" :: (Id')
  }
derive instance newtypeDeletePipelineInput :: Newtype DeletePipelineInput _
derive instance repGenericDeletePipelineInput :: Generic DeletePipelineInput _
instance showDeletePipelineInput :: Show DeletePipelineInput where show = genericShow
instance decodeDeletePipelineInput :: Decode DeletePipelineInput where decode = genericDecode options
instance encodeDeletePipelineInput :: Encode DeletePipelineInput where encode = genericEncode options

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
  , "evaluateExpressions" :: Maybe (Boolean)
  , "marker" :: Maybe (String)
  }
derive instance newtypeDescribeObjectsInput :: Newtype DescribeObjectsInput _
derive instance repGenericDescribeObjectsInput :: Generic DescribeObjectsInput _
instance showDescribeObjectsInput :: Show DescribeObjectsInput where show = genericShow
instance decodeDescribeObjectsInput :: Decode DescribeObjectsInput where decode = genericDecode options
instance encodeDescribeObjectsInput :: Encode DescribeObjectsInput where encode = genericEncode options

-- | Constructs DescribeObjectsInput from required parameters
newDescribeObjectsInput :: IdList' -> Id' -> DescribeObjectsInput
newDescribeObjectsInput _objectIds _pipelineId = DescribeObjectsInput { "objectIds": _objectIds, "pipelineId": _pipelineId, "evaluateExpressions": Nothing, "marker": Nothing }

-- | Constructs DescribeObjectsInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeObjectsInput' :: IdList' -> Id' -> ( { "pipelineId" :: (Id') , "objectIds" :: (IdList') , "evaluateExpressions" :: Maybe (Boolean) , "marker" :: Maybe (String) } -> {"pipelineId" :: (Id') , "objectIds" :: (IdList') , "evaluateExpressions" :: Maybe (Boolean) , "marker" :: Maybe (String) } ) -> DescribeObjectsInput
newDescribeObjectsInput' _objectIds _pipelineId customize = (DescribeObjectsInput <<< customize) { "objectIds": _objectIds, "pipelineId": _pipelineId, "evaluateExpressions": Nothing, "marker": Nothing }



-- | <p>Contains the output of DescribeObjects.</p>
newtype DescribeObjectsOutput = DescribeObjectsOutput 
  { "pipelineObjects" :: (PipelineObjectList)
  , "marker" :: Maybe (String)
  , "hasMoreResults" :: Maybe (Boolean)
  }
derive instance newtypeDescribeObjectsOutput :: Newtype DescribeObjectsOutput _
derive instance repGenericDescribeObjectsOutput :: Generic DescribeObjectsOutput _
instance showDescribeObjectsOutput :: Show DescribeObjectsOutput where show = genericShow
instance decodeDescribeObjectsOutput :: Decode DescribeObjectsOutput where decode = genericDecode options
instance encodeDescribeObjectsOutput :: Encode DescribeObjectsOutput where encode = genericEncode options

-- | Constructs DescribeObjectsOutput from required parameters
newDescribeObjectsOutput :: PipelineObjectList -> DescribeObjectsOutput
newDescribeObjectsOutput _pipelineObjects = DescribeObjectsOutput { "pipelineObjects": _pipelineObjects, "hasMoreResults": Nothing, "marker": Nothing }

-- | Constructs DescribeObjectsOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeObjectsOutput' :: PipelineObjectList -> ( { "pipelineObjects" :: (PipelineObjectList) , "marker" :: Maybe (String) , "hasMoreResults" :: Maybe (Boolean) } -> {"pipelineObjects" :: (PipelineObjectList) , "marker" :: Maybe (String) , "hasMoreResults" :: Maybe (Boolean) } ) -> DescribeObjectsOutput
newDescribeObjectsOutput' _pipelineObjects customize = (DescribeObjectsOutput <<< customize) { "pipelineObjects": _pipelineObjects, "hasMoreResults": Nothing, "marker": Nothing }



-- | <p>Contains the parameters for DescribePipelines.</p>
newtype DescribePipelinesInput = DescribePipelinesInput 
  { "pipelineIds" :: (IdList')
  }
derive instance newtypeDescribePipelinesInput :: Newtype DescribePipelinesInput _
derive instance repGenericDescribePipelinesInput :: Generic DescribePipelinesInput _
instance showDescribePipelinesInput :: Show DescribePipelinesInput where show = genericShow
instance decodeDescribePipelinesInput :: Decode DescribePipelinesInput where decode = genericDecode options
instance encodeDescribePipelinesInput :: Encode DescribePipelinesInput where encode = genericEncode options

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
instance showDescribePipelinesOutput :: Show DescribePipelinesOutput where show = genericShow
instance decodeDescribePipelinesOutput :: Decode DescribePipelinesOutput where decode = genericDecode options
instance encodeDescribePipelinesOutput :: Encode DescribePipelinesOutput where encode = genericEncode options

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
instance showEvaluateExpressionInput :: Show EvaluateExpressionInput where show = genericShow
instance decodeEvaluateExpressionInput :: Decode EvaluateExpressionInput where decode = genericDecode options
instance encodeEvaluateExpressionInput :: Encode EvaluateExpressionInput where encode = genericEncode options

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
instance showEvaluateExpressionOutput :: Show EvaluateExpressionOutput where show = genericShow
instance decodeEvaluateExpressionOutput :: Decode EvaluateExpressionOutput where decode = genericDecode options
instance encodeEvaluateExpressionOutput :: Encode EvaluateExpressionOutput where encode = genericEncode options

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
  , "stringValue" :: Maybe (FieldStringValue')
  , "refValue" :: Maybe (FieldNameString')
  }
derive instance newtypeField :: Newtype Field _
derive instance repGenericField :: Generic Field _
instance showField :: Show Field where show = genericShow
instance decodeField :: Decode Field where decode = genericDecode options
instance encodeField :: Encode Field where encode = genericEncode options

-- | Constructs Field from required parameters
newField :: FieldNameString' -> Field
newField _key = Field { "key": _key, "refValue": Nothing, "stringValue": Nothing }

-- | Constructs Field's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newField' :: FieldNameString' -> ( { "key" :: (FieldNameString') , "stringValue" :: Maybe (FieldStringValue') , "refValue" :: Maybe (FieldNameString') } -> {"key" :: (FieldNameString') , "stringValue" :: Maybe (FieldStringValue') , "refValue" :: Maybe (FieldNameString') } ) -> Field
newField' _key customize = (Field <<< customize) { "key": _key, "refValue": Nothing, "stringValue": Nothing }



-- | <p>Contains the parameters for GetPipelineDefinition.</p>
newtype GetPipelineDefinitionInput = GetPipelineDefinitionInput 
  { "pipelineId" :: (Id')
  , "version" :: Maybe (String)
  }
derive instance newtypeGetPipelineDefinitionInput :: Newtype GetPipelineDefinitionInput _
derive instance repGenericGetPipelineDefinitionInput :: Generic GetPipelineDefinitionInput _
instance showGetPipelineDefinitionInput :: Show GetPipelineDefinitionInput where show = genericShow
instance decodeGetPipelineDefinitionInput :: Decode GetPipelineDefinitionInput where decode = genericDecode options
instance encodeGetPipelineDefinitionInput :: Encode GetPipelineDefinitionInput where encode = genericEncode options

-- | Constructs GetPipelineDefinitionInput from required parameters
newGetPipelineDefinitionInput :: Id' -> GetPipelineDefinitionInput
newGetPipelineDefinitionInput _pipelineId = GetPipelineDefinitionInput { "pipelineId": _pipelineId, "version": Nothing }

-- | Constructs GetPipelineDefinitionInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newGetPipelineDefinitionInput' :: Id' -> ( { "pipelineId" :: (Id') , "version" :: Maybe (String) } -> {"pipelineId" :: (Id') , "version" :: Maybe (String) } ) -> GetPipelineDefinitionInput
newGetPipelineDefinitionInput' _pipelineId customize = (GetPipelineDefinitionInput <<< customize) { "pipelineId": _pipelineId, "version": Nothing }



-- | <p>Contains the output of GetPipelineDefinition.</p>
newtype GetPipelineDefinitionOutput = GetPipelineDefinitionOutput 
  { "pipelineObjects" :: Maybe (PipelineObjectList)
  , "parameterObjects" :: Maybe (ParameterObjectList)
  , "parameterValues" :: Maybe (ParameterValueList)
  }
derive instance newtypeGetPipelineDefinitionOutput :: Newtype GetPipelineDefinitionOutput _
derive instance repGenericGetPipelineDefinitionOutput :: Generic GetPipelineDefinitionOutput _
instance showGetPipelineDefinitionOutput :: Show GetPipelineDefinitionOutput where show = genericShow
instance decodeGetPipelineDefinitionOutput :: Decode GetPipelineDefinitionOutput where decode = genericDecode options
instance encodeGetPipelineDefinitionOutput :: Encode GetPipelineDefinitionOutput where encode = genericEncode options

-- | Constructs GetPipelineDefinitionOutput from required parameters
newGetPipelineDefinitionOutput :: GetPipelineDefinitionOutput
newGetPipelineDefinitionOutput  = GetPipelineDefinitionOutput { "parameterObjects": Nothing, "parameterValues": Nothing, "pipelineObjects": Nothing }

-- | Constructs GetPipelineDefinitionOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newGetPipelineDefinitionOutput' :: ( { "pipelineObjects" :: Maybe (PipelineObjectList) , "parameterObjects" :: Maybe (ParameterObjectList) , "parameterValues" :: Maybe (ParameterValueList) } -> {"pipelineObjects" :: Maybe (PipelineObjectList) , "parameterObjects" :: Maybe (ParameterObjectList) , "parameterValues" :: Maybe (ParameterValueList) } ) -> GetPipelineDefinitionOutput
newGetPipelineDefinitionOutput'  customize = (GetPipelineDefinitionOutput <<< customize) { "parameterObjects": Nothing, "parameterValues": Nothing, "pipelineObjects": Nothing }



-- | <p><p>Identity information for the EC2 instance that is hosting the task runner. You can get this value by calling a metadata URI from the EC2 instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html">Instance Metadata</a> in the <i>Amazon Elastic Compute Cloud User Guide.</i> Passing in this value proves that your task runner is running on an EC2 instance, and ensures the proper AWS Data Pipeline service charges are applied to your pipeline.</p></p>
newtype InstanceIdentity = InstanceIdentity 
  { "document" :: Maybe (String)
  , "signature" :: Maybe (String)
  }
derive instance newtypeInstanceIdentity :: Newtype InstanceIdentity _
derive instance repGenericInstanceIdentity :: Generic InstanceIdentity _
instance showInstanceIdentity :: Show InstanceIdentity where show = genericShow
instance decodeInstanceIdentity :: Decode InstanceIdentity where decode = genericDecode options
instance encodeInstanceIdentity :: Encode InstanceIdentity where encode = genericEncode options

-- | Constructs InstanceIdentity from required parameters
newInstanceIdentity :: InstanceIdentity
newInstanceIdentity  = InstanceIdentity { "document": Nothing, "signature": Nothing }

-- | Constructs InstanceIdentity's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInstanceIdentity' :: ( { "document" :: Maybe (String) , "signature" :: Maybe (String) } -> {"document" :: Maybe (String) , "signature" :: Maybe (String) } ) -> InstanceIdentity
newInstanceIdentity'  customize = (InstanceIdentity <<< customize) { "document": Nothing, "signature": Nothing }



-- | <p>An internal service error occurred.</p>
newtype InternalServiceError = InternalServiceError 
  { "message" :: Maybe (ErrorMessage')
  }
derive instance newtypeInternalServiceError :: Newtype InternalServiceError _
derive instance repGenericInternalServiceError :: Generic InternalServiceError _
instance showInternalServiceError :: Show InternalServiceError where show = genericShow
instance decodeInternalServiceError :: Decode InternalServiceError where decode = genericDecode options
instance encodeInternalServiceError :: Encode InternalServiceError where encode = genericEncode options

-- | Constructs InternalServiceError from required parameters
newInternalServiceError :: InternalServiceError
newInternalServiceError  = InternalServiceError { "message": Nothing }

-- | Constructs InternalServiceError's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInternalServiceError' :: ( { "message" :: Maybe (ErrorMessage') } -> {"message" :: Maybe (ErrorMessage') } ) -> InternalServiceError
newInternalServiceError'  customize = (InternalServiceError <<< customize) { "message": Nothing }



-- | <p>The request was not valid. Verify that your request was properly formatted, that the signature was generated with the correct credentials, and that you haven't exceeded any of the service limits for your account.</p>
newtype InvalidRequestException = InvalidRequestException 
  { "message" :: Maybe (ErrorMessage')
  }
derive instance newtypeInvalidRequestException :: Newtype InvalidRequestException _
derive instance repGenericInvalidRequestException :: Generic InvalidRequestException _
instance showInvalidRequestException :: Show InvalidRequestException where show = genericShow
instance decodeInvalidRequestException :: Decode InvalidRequestException where decode = genericDecode options
instance encodeInvalidRequestException :: Encode InvalidRequestException where encode = genericEncode options

-- | Constructs InvalidRequestException from required parameters
newInvalidRequestException :: InvalidRequestException
newInvalidRequestException  = InvalidRequestException { "message": Nothing }

-- | Constructs InvalidRequestException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInvalidRequestException' :: ( { "message" :: Maybe (ErrorMessage') } -> {"message" :: Maybe (ErrorMessage') } ) -> InvalidRequestException
newInvalidRequestException'  customize = (InvalidRequestException <<< customize) { "message": Nothing }



-- | <p>Contains the parameters for ListPipelines.</p>
newtype ListPipelinesInput = ListPipelinesInput 
  { "marker" :: Maybe (String)
  }
derive instance newtypeListPipelinesInput :: Newtype ListPipelinesInput _
derive instance repGenericListPipelinesInput :: Generic ListPipelinesInput _
instance showListPipelinesInput :: Show ListPipelinesInput where show = genericShow
instance decodeListPipelinesInput :: Decode ListPipelinesInput where decode = genericDecode options
instance encodeListPipelinesInput :: Encode ListPipelinesInput where encode = genericEncode options

-- | Constructs ListPipelinesInput from required parameters
newListPipelinesInput :: ListPipelinesInput
newListPipelinesInput  = ListPipelinesInput { "marker": Nothing }

-- | Constructs ListPipelinesInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListPipelinesInput' :: ( { "marker" :: Maybe (String) } -> {"marker" :: Maybe (String) } ) -> ListPipelinesInput
newListPipelinesInput'  customize = (ListPipelinesInput <<< customize) { "marker": Nothing }



-- | <p>Contains the output of ListPipelines.</p>
newtype ListPipelinesOutput = ListPipelinesOutput 
  { "pipelineIdList" :: (PipelineList')
  , "marker" :: Maybe (String)
  , "hasMoreResults" :: Maybe (Boolean)
  }
derive instance newtypeListPipelinesOutput :: Newtype ListPipelinesOutput _
derive instance repGenericListPipelinesOutput :: Generic ListPipelinesOutput _
instance showListPipelinesOutput :: Show ListPipelinesOutput where show = genericShow
instance decodeListPipelinesOutput :: Decode ListPipelinesOutput where decode = genericDecode options
instance encodeListPipelinesOutput :: Encode ListPipelinesOutput where encode = genericEncode options

-- | Constructs ListPipelinesOutput from required parameters
newListPipelinesOutput :: PipelineList' -> ListPipelinesOutput
newListPipelinesOutput _pipelineIdList = ListPipelinesOutput { "pipelineIdList": _pipelineIdList, "hasMoreResults": Nothing, "marker": Nothing }

-- | Constructs ListPipelinesOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListPipelinesOutput' :: PipelineList' -> ( { "pipelineIdList" :: (PipelineList') , "marker" :: Maybe (String) , "hasMoreResults" :: Maybe (Boolean) } -> {"pipelineIdList" :: (PipelineList') , "marker" :: Maybe (String) , "hasMoreResults" :: Maybe (Boolean) } ) -> ListPipelinesOutput
newListPipelinesOutput' _pipelineIdList customize = (ListPipelinesOutput <<< customize) { "pipelineIdList": _pipelineIdList, "hasMoreResults": Nothing, "marker": Nothing }



-- | <p>Contains a logical operation for comparing the value of a field with a specified value.</p>
newtype Operator = Operator 
  { "type" :: Maybe (OperatorType)
  , "values" :: Maybe (StringList')
  }
derive instance newtypeOperator :: Newtype Operator _
derive instance repGenericOperator :: Generic Operator _
instance showOperator :: Show Operator where show = genericShow
instance decodeOperator :: Decode Operator where decode = genericDecode options
instance encodeOperator :: Encode Operator where encode = genericEncode options

-- | Constructs Operator from required parameters
newOperator :: Operator
newOperator  = Operator { "type": Nothing, "values": Nothing }

-- | Constructs Operator's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newOperator' :: ( { "type" :: Maybe (OperatorType) , "values" :: Maybe (StringList') } -> {"type" :: Maybe (OperatorType) , "values" :: Maybe (StringList') } ) -> Operator
newOperator'  customize = (Operator <<< customize) { "type": Nothing, "values": Nothing }



newtype OperatorType = OperatorType String
derive instance newtypeOperatorType :: Newtype OperatorType _
derive instance repGenericOperatorType :: Generic OperatorType _
instance showOperatorType :: Show OperatorType where show = genericShow
instance decodeOperatorType :: Decode OperatorType where decode = genericDecode options
instance encodeOperatorType :: Encode OperatorType where encode = genericEncode options



-- | <p>The attributes allowed or specified with a parameter object.</p>
newtype ParameterAttribute = ParameterAttribute 
  { "key" :: (AttributeNameString')
  , "stringValue" :: (AttributeValueString')
  }
derive instance newtypeParameterAttribute :: Newtype ParameterAttribute _
derive instance repGenericParameterAttribute :: Generic ParameterAttribute _
instance showParameterAttribute :: Show ParameterAttribute where show = genericShow
instance decodeParameterAttribute :: Decode ParameterAttribute where decode = genericDecode options
instance encodeParameterAttribute :: Encode ParameterAttribute where encode = genericEncode options

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
instance showParameterAttributeList :: Show ParameterAttributeList where show = genericShow
instance decodeParameterAttributeList :: Decode ParameterAttributeList where decode = genericDecode options
instance encodeParameterAttributeList :: Encode ParameterAttributeList where encode = genericEncode options



-- | <p>Contains information about a parameter object.</p>
newtype ParameterObject = ParameterObject 
  { "id" :: (FieldNameString')
  , "attributes" :: (ParameterAttributeList)
  }
derive instance newtypeParameterObject :: Newtype ParameterObject _
derive instance repGenericParameterObject :: Generic ParameterObject _
instance showParameterObject :: Show ParameterObject where show = genericShow
instance decodeParameterObject :: Decode ParameterObject where decode = genericDecode options
instance encodeParameterObject :: Encode ParameterObject where encode = genericEncode options

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
instance showParameterObjectList :: Show ParameterObjectList where show = genericShow
instance decodeParameterObjectList :: Decode ParameterObjectList where decode = genericDecode options
instance encodeParameterObjectList :: Encode ParameterObjectList where encode = genericEncode options



-- | <p>A value or list of parameter values. </p>
newtype ParameterValue = ParameterValue 
  { "id" :: (FieldNameString')
  , "stringValue" :: (FieldStringValue')
  }
derive instance newtypeParameterValue :: Newtype ParameterValue _
derive instance repGenericParameterValue :: Generic ParameterValue _
instance showParameterValue :: Show ParameterValue where show = genericShow
instance decodeParameterValue :: Decode ParameterValue where decode = genericDecode options
instance encodeParameterValue :: Encode ParameterValue where encode = genericEncode options

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
instance showParameterValueList :: Show ParameterValueList where show = genericShow
instance decodeParameterValueList :: Decode ParameterValueList where decode = genericDecode options
instance encodeParameterValueList :: Encode ParameterValueList where encode = genericEncode options



-- | <p>The specified pipeline has been deleted.</p>
newtype PipelineDeletedException = PipelineDeletedException 
  { "message" :: Maybe (ErrorMessage')
  }
derive instance newtypePipelineDeletedException :: Newtype PipelineDeletedException _
derive instance repGenericPipelineDeletedException :: Generic PipelineDeletedException _
instance showPipelineDeletedException :: Show PipelineDeletedException where show = genericShow
instance decodePipelineDeletedException :: Decode PipelineDeletedException where decode = genericDecode options
instance encodePipelineDeletedException :: Encode PipelineDeletedException where encode = genericEncode options

-- | Constructs PipelineDeletedException from required parameters
newPipelineDeletedException :: PipelineDeletedException
newPipelineDeletedException  = PipelineDeletedException { "message": Nothing }

-- | Constructs PipelineDeletedException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPipelineDeletedException' :: ( { "message" :: Maybe (ErrorMessage') } -> {"message" :: Maybe (ErrorMessage') } ) -> PipelineDeletedException
newPipelineDeletedException'  customize = (PipelineDeletedException <<< customize) { "message": Nothing }



-- | <p>Contains pipeline metadata.</p>
newtype PipelineDescription = PipelineDescription 
  { "pipelineId" :: (Id')
  , "name" :: (Id')
  , "fields" :: (FieldList')
  , "description" :: Maybe (String)
  , "tags" :: Maybe (TagList')
  }
derive instance newtypePipelineDescription :: Newtype PipelineDescription _
derive instance repGenericPipelineDescription :: Generic PipelineDescription _
instance showPipelineDescription :: Show PipelineDescription where show = genericShow
instance decodePipelineDescription :: Decode PipelineDescription where decode = genericDecode options
instance encodePipelineDescription :: Encode PipelineDescription where encode = genericEncode options

-- | Constructs PipelineDescription from required parameters
newPipelineDescription :: FieldList' -> Id' -> Id' -> PipelineDescription
newPipelineDescription _fields _name _pipelineId = PipelineDescription { "fields": _fields, "name": _name, "pipelineId": _pipelineId, "description": Nothing, "tags": Nothing }

-- | Constructs PipelineDescription's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPipelineDescription' :: FieldList' -> Id' -> Id' -> ( { "pipelineId" :: (Id') , "name" :: (Id') , "fields" :: (FieldList') , "description" :: Maybe (String) , "tags" :: Maybe (TagList') } -> {"pipelineId" :: (Id') , "name" :: (Id') , "fields" :: (FieldList') , "description" :: Maybe (String) , "tags" :: Maybe (TagList') } ) -> PipelineDescription
newPipelineDescription' _fields _name _pipelineId customize = (PipelineDescription <<< customize) { "fields": _fields, "name": _name, "pipelineId": _pipelineId, "description": Nothing, "tags": Nothing }



newtype PipelineDescriptionList = PipelineDescriptionList (Array PipelineDescription)
derive instance newtypePipelineDescriptionList :: Newtype PipelineDescriptionList _
derive instance repGenericPipelineDescriptionList :: Generic PipelineDescriptionList _
instance showPipelineDescriptionList :: Show PipelineDescriptionList where show = genericShow
instance decodePipelineDescriptionList :: Decode PipelineDescriptionList where decode = genericDecode options
instance encodePipelineDescriptionList :: Encode PipelineDescriptionList where encode = genericEncode options



-- | <p>Contains the name and identifier of a pipeline.</p>
newtype PipelineIdName = PipelineIdName 
  { "id" :: Maybe (Id')
  , "name" :: Maybe (Id')
  }
derive instance newtypePipelineIdName :: Newtype PipelineIdName _
derive instance repGenericPipelineIdName :: Generic PipelineIdName _
instance showPipelineIdName :: Show PipelineIdName where show = genericShow
instance decodePipelineIdName :: Decode PipelineIdName where decode = genericDecode options
instance encodePipelineIdName :: Encode PipelineIdName where encode = genericEncode options

-- | Constructs PipelineIdName from required parameters
newPipelineIdName :: PipelineIdName
newPipelineIdName  = PipelineIdName { "id": Nothing, "name": Nothing }

-- | Constructs PipelineIdName's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPipelineIdName' :: ( { "id" :: Maybe (Id') , "name" :: Maybe (Id') } -> {"id" :: Maybe (Id') , "name" :: Maybe (Id') } ) -> PipelineIdName
newPipelineIdName'  customize = (PipelineIdName <<< customize) { "id": Nothing, "name": Nothing }



-- | <p>The specified pipeline was not found. Verify that you used the correct user and account identifiers.</p>
newtype PipelineNotFoundException = PipelineNotFoundException 
  { "message" :: Maybe (ErrorMessage')
  }
derive instance newtypePipelineNotFoundException :: Newtype PipelineNotFoundException _
derive instance repGenericPipelineNotFoundException :: Generic PipelineNotFoundException _
instance showPipelineNotFoundException :: Show PipelineNotFoundException where show = genericShow
instance decodePipelineNotFoundException :: Decode PipelineNotFoundException where decode = genericDecode options
instance encodePipelineNotFoundException :: Encode PipelineNotFoundException where encode = genericEncode options

-- | Constructs PipelineNotFoundException from required parameters
newPipelineNotFoundException :: PipelineNotFoundException
newPipelineNotFoundException  = PipelineNotFoundException { "message": Nothing }

-- | Constructs PipelineNotFoundException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPipelineNotFoundException' :: ( { "message" :: Maybe (ErrorMessage') } -> {"message" :: Maybe (ErrorMessage') } ) -> PipelineNotFoundException
newPipelineNotFoundException'  customize = (PipelineNotFoundException <<< customize) { "message": Nothing }



-- | <p>Contains information about a pipeline object. This can be a logical, physical, or physical attempt pipeline object. The complete set of components of a pipeline defines the pipeline.</p>
newtype PipelineObject = PipelineObject 
  { "id" :: (Id')
  , "name" :: (Id')
  , "fields" :: (FieldList')
  }
derive instance newtypePipelineObject :: Newtype PipelineObject _
derive instance repGenericPipelineObject :: Generic PipelineObject _
instance showPipelineObject :: Show PipelineObject where show = genericShow
instance decodePipelineObject :: Decode PipelineObject where decode = genericDecode options
instance encodePipelineObject :: Encode PipelineObject where encode = genericEncode options

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
instance showPipelineObjectList :: Show PipelineObjectList where show = genericShow
instance decodePipelineObjectList :: Decode PipelineObjectList where decode = genericDecode options
instance encodePipelineObjectList :: Encode PipelineObjectList where encode = genericEncode options



newtype PipelineObjectMap = PipelineObjectMap (StrMap.StrMap PipelineObject)
derive instance newtypePipelineObjectMap :: Newtype PipelineObjectMap _
derive instance repGenericPipelineObjectMap :: Generic PipelineObjectMap _
instance showPipelineObjectMap :: Show PipelineObjectMap where show = genericShow
instance decodePipelineObjectMap :: Decode PipelineObjectMap where decode = genericDecode options
instance encodePipelineObjectMap :: Encode PipelineObjectMap where encode = genericEncode options



-- | <p>Contains the parameters for PollForTask.</p>
newtype PollForTaskInput = PollForTaskInput 
  { "workerGroup" :: (String)
  , "hostname" :: Maybe (Id')
  , "instanceIdentity" :: Maybe (InstanceIdentity)
  }
derive instance newtypePollForTaskInput :: Newtype PollForTaskInput _
derive instance repGenericPollForTaskInput :: Generic PollForTaskInput _
instance showPollForTaskInput :: Show PollForTaskInput where show = genericShow
instance decodePollForTaskInput :: Decode PollForTaskInput where decode = genericDecode options
instance encodePollForTaskInput :: Encode PollForTaskInput where encode = genericEncode options

-- | Constructs PollForTaskInput from required parameters
newPollForTaskInput :: String -> PollForTaskInput
newPollForTaskInput _workerGroup = PollForTaskInput { "workerGroup": _workerGroup, "hostname": Nothing, "instanceIdentity": Nothing }

-- | Constructs PollForTaskInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPollForTaskInput' :: String -> ( { "workerGroup" :: (String) , "hostname" :: Maybe (Id') , "instanceIdentity" :: Maybe (InstanceIdentity) } -> {"workerGroup" :: (String) , "hostname" :: Maybe (Id') , "instanceIdentity" :: Maybe (InstanceIdentity) } ) -> PollForTaskInput
newPollForTaskInput' _workerGroup customize = (PollForTaskInput <<< customize) { "workerGroup": _workerGroup, "hostname": Nothing, "instanceIdentity": Nothing }



-- | <p>Contains the output of PollForTask.</p>
newtype PollForTaskOutput = PollForTaskOutput 
  { "taskObject" :: Maybe (TaskObject)
  }
derive instance newtypePollForTaskOutput :: Newtype PollForTaskOutput _
derive instance repGenericPollForTaskOutput :: Generic PollForTaskOutput _
instance showPollForTaskOutput :: Show PollForTaskOutput where show = genericShow
instance decodePollForTaskOutput :: Decode PollForTaskOutput where decode = genericDecode options
instance encodePollForTaskOutput :: Encode PollForTaskOutput where encode = genericEncode options

-- | Constructs PollForTaskOutput from required parameters
newPollForTaskOutput :: PollForTaskOutput
newPollForTaskOutput  = PollForTaskOutput { "taskObject": Nothing }

-- | Constructs PollForTaskOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPollForTaskOutput' :: ( { "taskObject" :: Maybe (TaskObject) } -> {"taskObject" :: Maybe (TaskObject) } ) -> PollForTaskOutput
newPollForTaskOutput'  customize = (PollForTaskOutput <<< customize) { "taskObject": Nothing }



-- | <p>Contains the parameters for PutPipelineDefinition.</p>
newtype PutPipelineDefinitionInput = PutPipelineDefinitionInput 
  { "pipelineId" :: (Id')
  , "pipelineObjects" :: (PipelineObjectList)
  , "parameterObjects" :: Maybe (ParameterObjectList)
  , "parameterValues" :: Maybe (ParameterValueList)
  }
derive instance newtypePutPipelineDefinitionInput :: Newtype PutPipelineDefinitionInput _
derive instance repGenericPutPipelineDefinitionInput :: Generic PutPipelineDefinitionInput _
instance showPutPipelineDefinitionInput :: Show PutPipelineDefinitionInput where show = genericShow
instance decodePutPipelineDefinitionInput :: Decode PutPipelineDefinitionInput where decode = genericDecode options
instance encodePutPipelineDefinitionInput :: Encode PutPipelineDefinitionInput where encode = genericEncode options

-- | Constructs PutPipelineDefinitionInput from required parameters
newPutPipelineDefinitionInput :: Id' -> PipelineObjectList -> PutPipelineDefinitionInput
newPutPipelineDefinitionInput _pipelineId _pipelineObjects = PutPipelineDefinitionInput { "pipelineId": _pipelineId, "pipelineObjects": _pipelineObjects, "parameterObjects": Nothing, "parameterValues": Nothing }

-- | Constructs PutPipelineDefinitionInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutPipelineDefinitionInput' :: Id' -> PipelineObjectList -> ( { "pipelineId" :: (Id') , "pipelineObjects" :: (PipelineObjectList) , "parameterObjects" :: Maybe (ParameterObjectList) , "parameterValues" :: Maybe (ParameterValueList) } -> {"pipelineId" :: (Id') , "pipelineObjects" :: (PipelineObjectList) , "parameterObjects" :: Maybe (ParameterObjectList) , "parameterValues" :: Maybe (ParameterValueList) } ) -> PutPipelineDefinitionInput
newPutPipelineDefinitionInput' _pipelineId _pipelineObjects customize = (PutPipelineDefinitionInput <<< customize) { "pipelineId": _pipelineId, "pipelineObjects": _pipelineObjects, "parameterObjects": Nothing, "parameterValues": Nothing }



-- | <p>Contains the output of PutPipelineDefinition.</p>
newtype PutPipelineDefinitionOutput = PutPipelineDefinitionOutput 
  { "validationErrors" :: Maybe (ValidationErrors)
  , "validationWarnings" :: Maybe (ValidationWarnings)
  , "errored" :: (Boolean)
  }
derive instance newtypePutPipelineDefinitionOutput :: Newtype PutPipelineDefinitionOutput _
derive instance repGenericPutPipelineDefinitionOutput :: Generic PutPipelineDefinitionOutput _
instance showPutPipelineDefinitionOutput :: Show PutPipelineDefinitionOutput where show = genericShow
instance decodePutPipelineDefinitionOutput :: Decode PutPipelineDefinitionOutput where decode = genericDecode options
instance encodePutPipelineDefinitionOutput :: Encode PutPipelineDefinitionOutput where encode = genericEncode options

-- | Constructs PutPipelineDefinitionOutput from required parameters
newPutPipelineDefinitionOutput :: Boolean -> PutPipelineDefinitionOutput
newPutPipelineDefinitionOutput _errored = PutPipelineDefinitionOutput { "errored": _errored, "validationErrors": Nothing, "validationWarnings": Nothing }

-- | Constructs PutPipelineDefinitionOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutPipelineDefinitionOutput' :: Boolean -> ( { "validationErrors" :: Maybe (ValidationErrors) , "validationWarnings" :: Maybe (ValidationWarnings) , "errored" :: (Boolean) } -> {"validationErrors" :: Maybe (ValidationErrors) , "validationWarnings" :: Maybe (ValidationWarnings) , "errored" :: (Boolean) } ) -> PutPipelineDefinitionOutput
newPutPipelineDefinitionOutput' _errored customize = (PutPipelineDefinitionOutput <<< customize) { "errored": _errored, "validationErrors": Nothing, "validationWarnings": Nothing }



-- | <p>Defines the query to run against an object.</p>
newtype Query = Query 
  { "selectors" :: Maybe (SelectorList)
  }
derive instance newtypeQuery :: Newtype Query _
derive instance repGenericQuery :: Generic Query _
instance showQuery :: Show Query where show = genericShow
instance decodeQuery :: Decode Query where decode = genericDecode options
instance encodeQuery :: Encode Query where encode = genericEncode options

-- | Constructs Query from required parameters
newQuery :: Query
newQuery  = Query { "selectors": Nothing }

-- | Constructs Query's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newQuery' :: ( { "selectors" :: Maybe (SelectorList) } -> {"selectors" :: Maybe (SelectorList) } ) -> Query
newQuery'  customize = (Query <<< customize) { "selectors": Nothing }



-- | <p>Contains the parameters for QueryObjects.</p>
newtype QueryObjectsInput = QueryObjectsInput 
  { "pipelineId" :: (Id')
  , "query" :: Maybe (Query)
  , "sphere" :: (String)
  , "marker" :: Maybe (String)
  , "limit" :: Maybe (Int)
  }
derive instance newtypeQueryObjectsInput :: Newtype QueryObjectsInput _
derive instance repGenericQueryObjectsInput :: Generic QueryObjectsInput _
instance showQueryObjectsInput :: Show QueryObjectsInput where show = genericShow
instance decodeQueryObjectsInput :: Decode QueryObjectsInput where decode = genericDecode options
instance encodeQueryObjectsInput :: Encode QueryObjectsInput where encode = genericEncode options

-- | Constructs QueryObjectsInput from required parameters
newQueryObjectsInput :: Id' -> String -> QueryObjectsInput
newQueryObjectsInput _pipelineId _sphere = QueryObjectsInput { "pipelineId": _pipelineId, "sphere": _sphere, "limit": Nothing, "marker": Nothing, "query": Nothing }

-- | Constructs QueryObjectsInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newQueryObjectsInput' :: Id' -> String -> ( { "pipelineId" :: (Id') , "query" :: Maybe (Query) , "sphere" :: (String) , "marker" :: Maybe (String) , "limit" :: Maybe (Int) } -> {"pipelineId" :: (Id') , "query" :: Maybe (Query) , "sphere" :: (String) , "marker" :: Maybe (String) , "limit" :: Maybe (Int) } ) -> QueryObjectsInput
newQueryObjectsInput' _pipelineId _sphere customize = (QueryObjectsInput <<< customize) { "pipelineId": _pipelineId, "sphere": _sphere, "limit": Nothing, "marker": Nothing, "query": Nothing }



-- | <p>Contains the output of QueryObjects.</p>
newtype QueryObjectsOutput = QueryObjectsOutput 
  { "ids" :: Maybe (IdList')
  , "marker" :: Maybe (String)
  , "hasMoreResults" :: Maybe (Boolean)
  }
derive instance newtypeQueryObjectsOutput :: Newtype QueryObjectsOutput _
derive instance repGenericQueryObjectsOutput :: Generic QueryObjectsOutput _
instance showQueryObjectsOutput :: Show QueryObjectsOutput where show = genericShow
instance decodeQueryObjectsOutput :: Decode QueryObjectsOutput where decode = genericDecode options
instance encodeQueryObjectsOutput :: Encode QueryObjectsOutput where encode = genericEncode options

-- | Constructs QueryObjectsOutput from required parameters
newQueryObjectsOutput :: QueryObjectsOutput
newQueryObjectsOutput  = QueryObjectsOutput { "hasMoreResults": Nothing, "ids": Nothing, "marker": Nothing }

-- | Constructs QueryObjectsOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newQueryObjectsOutput' :: ( { "ids" :: Maybe (IdList') , "marker" :: Maybe (String) , "hasMoreResults" :: Maybe (Boolean) } -> {"ids" :: Maybe (IdList') , "marker" :: Maybe (String) , "hasMoreResults" :: Maybe (Boolean) } ) -> QueryObjectsOutput
newQueryObjectsOutput'  customize = (QueryObjectsOutput <<< customize) { "hasMoreResults": Nothing, "ids": Nothing, "marker": Nothing }



-- | <p>Contains the parameters for RemoveTags.</p>
newtype RemoveTagsInput = RemoveTagsInput 
  { "pipelineId" :: (Id')
  , "tagKeys" :: (StringList')
  }
derive instance newtypeRemoveTagsInput :: Newtype RemoveTagsInput _
derive instance repGenericRemoveTagsInput :: Generic RemoveTagsInput _
instance showRemoveTagsInput :: Show RemoveTagsInput where show = genericShow
instance decodeRemoveTagsInput :: Decode RemoveTagsInput where decode = genericDecode options
instance encodeRemoveTagsInput :: Encode RemoveTagsInput where encode = genericEncode options

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
instance showRemoveTagsOutput :: Show RemoveTagsOutput where show = genericShow
instance decodeRemoveTagsOutput :: Decode RemoveTagsOutput where decode = genericDecode options
instance encodeRemoveTagsOutput :: Encode RemoveTagsOutput where encode = genericEncode options



-- | <p>Contains the parameters for ReportTaskProgress.</p>
newtype ReportTaskProgressInput = ReportTaskProgressInput 
  { "taskId" :: (TaskId')
  , "fields" :: Maybe (FieldList')
  }
derive instance newtypeReportTaskProgressInput :: Newtype ReportTaskProgressInput _
derive instance repGenericReportTaskProgressInput :: Generic ReportTaskProgressInput _
instance showReportTaskProgressInput :: Show ReportTaskProgressInput where show = genericShow
instance decodeReportTaskProgressInput :: Decode ReportTaskProgressInput where decode = genericDecode options
instance encodeReportTaskProgressInput :: Encode ReportTaskProgressInput where encode = genericEncode options

-- | Constructs ReportTaskProgressInput from required parameters
newReportTaskProgressInput :: TaskId' -> ReportTaskProgressInput
newReportTaskProgressInput _taskId = ReportTaskProgressInput { "taskId": _taskId, "fields": Nothing }

-- | Constructs ReportTaskProgressInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newReportTaskProgressInput' :: TaskId' -> ( { "taskId" :: (TaskId') , "fields" :: Maybe (FieldList') } -> {"taskId" :: (TaskId') , "fields" :: Maybe (FieldList') } ) -> ReportTaskProgressInput
newReportTaskProgressInput' _taskId customize = (ReportTaskProgressInput <<< customize) { "taskId": _taskId, "fields": Nothing }



-- | <p>Contains the output of ReportTaskProgress.</p>
newtype ReportTaskProgressOutput = ReportTaskProgressOutput 
  { "canceled" :: (Boolean)
  }
derive instance newtypeReportTaskProgressOutput :: Newtype ReportTaskProgressOutput _
derive instance repGenericReportTaskProgressOutput :: Generic ReportTaskProgressOutput _
instance showReportTaskProgressOutput :: Show ReportTaskProgressOutput where show = genericShow
instance decodeReportTaskProgressOutput :: Decode ReportTaskProgressOutput where decode = genericDecode options
instance encodeReportTaskProgressOutput :: Encode ReportTaskProgressOutput where encode = genericEncode options

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
  , "workerGroup" :: Maybe (String)
  , "hostname" :: Maybe (Id')
  }
derive instance newtypeReportTaskRunnerHeartbeatInput :: Newtype ReportTaskRunnerHeartbeatInput _
derive instance repGenericReportTaskRunnerHeartbeatInput :: Generic ReportTaskRunnerHeartbeatInput _
instance showReportTaskRunnerHeartbeatInput :: Show ReportTaskRunnerHeartbeatInput where show = genericShow
instance decodeReportTaskRunnerHeartbeatInput :: Decode ReportTaskRunnerHeartbeatInput where decode = genericDecode options
instance encodeReportTaskRunnerHeartbeatInput :: Encode ReportTaskRunnerHeartbeatInput where encode = genericEncode options

-- | Constructs ReportTaskRunnerHeartbeatInput from required parameters
newReportTaskRunnerHeartbeatInput :: Id' -> ReportTaskRunnerHeartbeatInput
newReportTaskRunnerHeartbeatInput _taskrunnerId = ReportTaskRunnerHeartbeatInput { "taskrunnerId": _taskrunnerId, "hostname": Nothing, "workerGroup": Nothing }

-- | Constructs ReportTaskRunnerHeartbeatInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newReportTaskRunnerHeartbeatInput' :: Id' -> ( { "taskrunnerId" :: (Id') , "workerGroup" :: Maybe (String) , "hostname" :: Maybe (Id') } -> {"taskrunnerId" :: (Id') , "workerGroup" :: Maybe (String) , "hostname" :: Maybe (Id') } ) -> ReportTaskRunnerHeartbeatInput
newReportTaskRunnerHeartbeatInput' _taskrunnerId customize = (ReportTaskRunnerHeartbeatInput <<< customize) { "taskrunnerId": _taskrunnerId, "hostname": Nothing, "workerGroup": Nothing }



-- | <p>Contains the output of ReportTaskRunnerHeartbeat.</p>
newtype ReportTaskRunnerHeartbeatOutput = ReportTaskRunnerHeartbeatOutput 
  { "terminate" :: (Boolean)
  }
derive instance newtypeReportTaskRunnerHeartbeatOutput :: Newtype ReportTaskRunnerHeartbeatOutput _
derive instance repGenericReportTaskRunnerHeartbeatOutput :: Generic ReportTaskRunnerHeartbeatOutput _
instance showReportTaskRunnerHeartbeatOutput :: Show ReportTaskRunnerHeartbeatOutput where show = genericShow
instance decodeReportTaskRunnerHeartbeatOutput :: Decode ReportTaskRunnerHeartbeatOutput where decode = genericDecode options
instance encodeReportTaskRunnerHeartbeatOutput :: Encode ReportTaskRunnerHeartbeatOutput where encode = genericEncode options

-- | Constructs ReportTaskRunnerHeartbeatOutput from required parameters
newReportTaskRunnerHeartbeatOutput :: Boolean -> ReportTaskRunnerHeartbeatOutput
newReportTaskRunnerHeartbeatOutput _terminate = ReportTaskRunnerHeartbeatOutput { "terminate": _terminate }

-- | Constructs ReportTaskRunnerHeartbeatOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newReportTaskRunnerHeartbeatOutput' :: Boolean -> ( { "terminate" :: (Boolean) } -> {"terminate" :: (Boolean) } ) -> ReportTaskRunnerHeartbeatOutput
newReportTaskRunnerHeartbeatOutput' _terminate customize = (ReportTaskRunnerHeartbeatOutput <<< customize) { "terminate": _terminate }



-- | <p>A comparision that is used to determine whether a query should return this object.</p>
newtype Selector = Selector 
  { "fieldName" :: Maybe (String)
  , "operator" :: Maybe (Operator)
  }
derive instance newtypeSelector :: Newtype Selector _
derive instance repGenericSelector :: Generic Selector _
instance showSelector :: Show Selector where show = genericShow
instance decodeSelector :: Decode Selector where decode = genericDecode options
instance encodeSelector :: Encode Selector where encode = genericEncode options

-- | Constructs Selector from required parameters
newSelector :: Selector
newSelector  = Selector { "fieldName": Nothing, "operator": Nothing }

-- | Constructs Selector's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSelector' :: ( { "fieldName" :: Maybe (String) , "operator" :: Maybe (Operator) } -> {"fieldName" :: Maybe (String) , "operator" :: Maybe (Operator) } ) -> Selector
newSelector'  customize = (Selector <<< customize) { "fieldName": Nothing, "operator": Nothing }



-- | <p>The list of Selectors that define queries on individual fields.</p>
newtype SelectorList = SelectorList (Array Selector)
derive instance newtypeSelectorList :: Newtype SelectorList _
derive instance repGenericSelectorList :: Generic SelectorList _
instance showSelectorList :: Show SelectorList where show = genericShow
instance decodeSelectorList :: Decode SelectorList where decode = genericDecode options
instance encodeSelectorList :: Encode SelectorList where encode = genericEncode options



-- | <p>Contains the parameters for SetStatus.</p>
newtype SetStatusInput = SetStatusInput 
  { "pipelineId" :: (Id')
  , "objectIds" :: (IdList')
  , "status" :: (String)
  }
derive instance newtypeSetStatusInput :: Newtype SetStatusInput _
derive instance repGenericSetStatusInput :: Generic SetStatusInput _
instance showSetStatusInput :: Show SetStatusInput where show = genericShow
instance decodeSetStatusInput :: Decode SetStatusInput where decode = genericDecode options
instance encodeSetStatusInput :: Encode SetStatusInput where encode = genericEncode options

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
  , "errorId" :: Maybe (String)
  , "errorMessage" :: Maybe (ErrorMessage')
  , "errorStackTrace" :: Maybe (String)
  }
derive instance newtypeSetTaskStatusInput :: Newtype SetTaskStatusInput _
derive instance repGenericSetTaskStatusInput :: Generic SetTaskStatusInput _
instance showSetTaskStatusInput :: Show SetTaskStatusInput where show = genericShow
instance decodeSetTaskStatusInput :: Decode SetTaskStatusInput where decode = genericDecode options
instance encodeSetTaskStatusInput :: Encode SetTaskStatusInput where encode = genericEncode options

-- | Constructs SetTaskStatusInput from required parameters
newSetTaskStatusInput :: TaskId' -> TaskStatus -> SetTaskStatusInput
newSetTaskStatusInput _taskId _taskStatus = SetTaskStatusInput { "taskId": _taskId, "taskStatus": _taskStatus, "errorId": Nothing, "errorMessage": Nothing, "errorStackTrace": Nothing }

-- | Constructs SetTaskStatusInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSetTaskStatusInput' :: TaskId' -> TaskStatus -> ( { "taskId" :: (TaskId') , "taskStatus" :: (TaskStatus) , "errorId" :: Maybe (String) , "errorMessage" :: Maybe (ErrorMessage') , "errorStackTrace" :: Maybe (String) } -> {"taskId" :: (TaskId') , "taskStatus" :: (TaskStatus) , "errorId" :: Maybe (String) , "errorMessage" :: Maybe (ErrorMessage') , "errorStackTrace" :: Maybe (String) } ) -> SetTaskStatusInput
newSetTaskStatusInput' _taskId _taskStatus customize = (SetTaskStatusInput <<< customize) { "taskId": _taskId, "taskStatus": _taskStatus, "errorId": Nothing, "errorMessage": Nothing, "errorStackTrace": Nothing }



-- | <p>Contains the output of SetTaskStatus.</p>
newtype SetTaskStatusOutput = SetTaskStatusOutput Types.NoArguments
derive instance newtypeSetTaskStatusOutput :: Newtype SetTaskStatusOutput _
derive instance repGenericSetTaskStatusOutput :: Generic SetTaskStatusOutput _
instance showSetTaskStatusOutput :: Show SetTaskStatusOutput where show = genericShow
instance decodeSetTaskStatusOutput :: Decode SetTaskStatusOutput where decode = genericDecode options
instance encodeSetTaskStatusOutput :: Encode SetTaskStatusOutput where encode = genericEncode options



-- | <p>Tags are key/value pairs defined by a user and associated with a pipeline to control access. AWS Data Pipeline allows you to associate ten tags per pipeline. For more information, see <a href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer Guide</i>.</p>
newtype Tag = Tag 
  { "key" :: (TagKey')
  , "value" :: (TagValue')
  }
derive instance newtypeTag :: Newtype Tag _
derive instance repGenericTag :: Generic Tag _
instance showTag :: Show Tag where show = genericShow
instance decodeTag :: Decode Tag where decode = genericDecode options
instance encodeTag :: Encode Tag where encode = genericEncode options

-- | Constructs Tag from required parameters
newTag :: TagKey' -> TagValue' -> Tag
newTag _key _value = Tag { "key": _key, "value": _value }

-- | Constructs Tag's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTag' :: TagKey' -> TagValue' -> ( { "key" :: (TagKey') , "value" :: (TagValue') } -> {"key" :: (TagKey') , "value" :: (TagValue') } ) -> Tag
newTag' _key _value customize = (Tag <<< customize) { "key": _key, "value": _value }



-- | <p>The specified task was not found. </p>
newtype TaskNotFoundException = TaskNotFoundException 
  { "message" :: Maybe (ErrorMessage')
  }
derive instance newtypeTaskNotFoundException :: Newtype TaskNotFoundException _
derive instance repGenericTaskNotFoundException :: Generic TaskNotFoundException _
instance showTaskNotFoundException :: Show TaskNotFoundException where show = genericShow
instance decodeTaskNotFoundException :: Decode TaskNotFoundException where decode = genericDecode options
instance encodeTaskNotFoundException :: Encode TaskNotFoundException where encode = genericEncode options

-- | Constructs TaskNotFoundException from required parameters
newTaskNotFoundException :: TaskNotFoundException
newTaskNotFoundException  = TaskNotFoundException { "message": Nothing }

-- | Constructs TaskNotFoundException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTaskNotFoundException' :: ( { "message" :: Maybe (ErrorMessage') } -> {"message" :: Maybe (ErrorMessage') } ) -> TaskNotFoundException
newTaskNotFoundException'  customize = (TaskNotFoundException <<< customize) { "message": Nothing }



-- | <p>Contains information about a pipeline task that is assigned to a task runner.</p>
newtype TaskObject = TaskObject 
  { "taskId" :: Maybe (TaskId')
  , "pipelineId" :: Maybe (Id')
  , "attemptId" :: Maybe (Id')
  , "objects" :: Maybe (PipelineObjectMap)
  }
derive instance newtypeTaskObject :: Newtype TaskObject _
derive instance repGenericTaskObject :: Generic TaskObject _
instance showTaskObject :: Show TaskObject where show = genericShow
instance decodeTaskObject :: Decode TaskObject where decode = genericDecode options
instance encodeTaskObject :: Encode TaskObject where encode = genericEncode options

-- | Constructs TaskObject from required parameters
newTaskObject :: TaskObject
newTaskObject  = TaskObject { "attemptId": Nothing, "objects": Nothing, "pipelineId": Nothing, "taskId": Nothing }

-- | Constructs TaskObject's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTaskObject' :: ( { "taskId" :: Maybe (TaskId') , "pipelineId" :: Maybe (Id') , "attemptId" :: Maybe (Id') , "objects" :: Maybe (PipelineObjectMap) } -> {"taskId" :: Maybe (TaskId') , "pipelineId" :: Maybe (Id') , "attemptId" :: Maybe (Id') , "objects" :: Maybe (PipelineObjectMap) } ) -> TaskObject
newTaskObject'  customize = (TaskObject <<< customize) { "attemptId": Nothing, "objects": Nothing, "pipelineId": Nothing, "taskId": Nothing }



newtype TaskStatus = TaskStatus String
derive instance newtypeTaskStatus :: Newtype TaskStatus _
derive instance repGenericTaskStatus :: Generic TaskStatus _
instance showTaskStatus :: Show TaskStatus where show = genericShow
instance decodeTaskStatus :: Decode TaskStatus where decode = genericDecode options
instance encodeTaskStatus :: Encode TaskStatus where encode = genericEncode options



-- | <p>Contains the parameters for ValidatePipelineDefinition.</p>
newtype ValidatePipelineDefinitionInput = ValidatePipelineDefinitionInput 
  { "pipelineId" :: (Id')
  , "pipelineObjects" :: (PipelineObjectList)
  , "parameterObjects" :: Maybe (ParameterObjectList)
  , "parameterValues" :: Maybe (ParameterValueList)
  }
derive instance newtypeValidatePipelineDefinitionInput :: Newtype ValidatePipelineDefinitionInput _
derive instance repGenericValidatePipelineDefinitionInput :: Generic ValidatePipelineDefinitionInput _
instance showValidatePipelineDefinitionInput :: Show ValidatePipelineDefinitionInput where show = genericShow
instance decodeValidatePipelineDefinitionInput :: Decode ValidatePipelineDefinitionInput where decode = genericDecode options
instance encodeValidatePipelineDefinitionInput :: Encode ValidatePipelineDefinitionInput where encode = genericEncode options

-- | Constructs ValidatePipelineDefinitionInput from required parameters
newValidatePipelineDefinitionInput :: Id' -> PipelineObjectList -> ValidatePipelineDefinitionInput
newValidatePipelineDefinitionInput _pipelineId _pipelineObjects = ValidatePipelineDefinitionInput { "pipelineId": _pipelineId, "pipelineObjects": _pipelineObjects, "parameterObjects": Nothing, "parameterValues": Nothing }

-- | Constructs ValidatePipelineDefinitionInput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newValidatePipelineDefinitionInput' :: Id' -> PipelineObjectList -> ( { "pipelineId" :: (Id') , "pipelineObjects" :: (PipelineObjectList) , "parameterObjects" :: Maybe (ParameterObjectList) , "parameterValues" :: Maybe (ParameterValueList) } -> {"pipelineId" :: (Id') , "pipelineObjects" :: (PipelineObjectList) , "parameterObjects" :: Maybe (ParameterObjectList) , "parameterValues" :: Maybe (ParameterValueList) } ) -> ValidatePipelineDefinitionInput
newValidatePipelineDefinitionInput' _pipelineId _pipelineObjects customize = (ValidatePipelineDefinitionInput <<< customize) { "pipelineId": _pipelineId, "pipelineObjects": _pipelineObjects, "parameterObjects": Nothing, "parameterValues": Nothing }



-- | <p>Contains the output of ValidatePipelineDefinition.</p>
newtype ValidatePipelineDefinitionOutput = ValidatePipelineDefinitionOutput 
  { "validationErrors" :: Maybe (ValidationErrors)
  , "validationWarnings" :: Maybe (ValidationWarnings)
  , "errored" :: (Boolean)
  }
derive instance newtypeValidatePipelineDefinitionOutput :: Newtype ValidatePipelineDefinitionOutput _
derive instance repGenericValidatePipelineDefinitionOutput :: Generic ValidatePipelineDefinitionOutput _
instance showValidatePipelineDefinitionOutput :: Show ValidatePipelineDefinitionOutput where show = genericShow
instance decodeValidatePipelineDefinitionOutput :: Decode ValidatePipelineDefinitionOutput where decode = genericDecode options
instance encodeValidatePipelineDefinitionOutput :: Encode ValidatePipelineDefinitionOutput where encode = genericEncode options

-- | Constructs ValidatePipelineDefinitionOutput from required parameters
newValidatePipelineDefinitionOutput :: Boolean -> ValidatePipelineDefinitionOutput
newValidatePipelineDefinitionOutput _errored = ValidatePipelineDefinitionOutput { "errored": _errored, "validationErrors": Nothing, "validationWarnings": Nothing }

-- | Constructs ValidatePipelineDefinitionOutput's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newValidatePipelineDefinitionOutput' :: Boolean -> ( { "validationErrors" :: Maybe (ValidationErrors) , "validationWarnings" :: Maybe (ValidationWarnings) , "errored" :: (Boolean) } -> {"validationErrors" :: Maybe (ValidationErrors) , "validationWarnings" :: Maybe (ValidationWarnings) , "errored" :: (Boolean) } ) -> ValidatePipelineDefinitionOutput
newValidatePipelineDefinitionOutput' _errored customize = (ValidatePipelineDefinitionOutput <<< customize) { "errored": _errored, "validationErrors": Nothing, "validationWarnings": Nothing }



-- | <p>Defines a validation error. Validation errors prevent pipeline activation. The set of validation errors that can be returned are defined by AWS Data Pipeline.</p>
newtype ValidationError = ValidationError 
  { "id" :: Maybe (Id')
  , "errors" :: Maybe (ValidationMessages')
  }
derive instance newtypeValidationError :: Newtype ValidationError _
derive instance repGenericValidationError :: Generic ValidationError _
instance showValidationError :: Show ValidationError where show = genericShow
instance decodeValidationError :: Decode ValidationError where decode = genericDecode options
instance encodeValidationError :: Encode ValidationError where encode = genericEncode options

-- | Constructs ValidationError from required parameters
newValidationError :: ValidationError
newValidationError  = ValidationError { "errors": Nothing, "id": Nothing }

-- | Constructs ValidationError's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newValidationError' :: ( { "id" :: Maybe (Id') , "errors" :: Maybe (ValidationMessages') } -> {"id" :: Maybe (Id') , "errors" :: Maybe (ValidationMessages') } ) -> ValidationError
newValidationError'  customize = (ValidationError <<< customize) { "errors": Nothing, "id": Nothing }



newtype ValidationErrors = ValidationErrors (Array ValidationError)
derive instance newtypeValidationErrors :: Newtype ValidationErrors _
derive instance repGenericValidationErrors :: Generic ValidationErrors _
instance showValidationErrors :: Show ValidationErrors where show = genericShow
instance decodeValidationErrors :: Decode ValidationErrors where decode = genericDecode options
instance encodeValidationErrors :: Encode ValidationErrors where encode = genericEncode options



-- | <p>Defines a validation warning. Validation warnings do not prevent pipeline activation. The set of validation warnings that can be returned are defined by AWS Data Pipeline.</p>
newtype ValidationWarning = ValidationWarning 
  { "id" :: Maybe (Id')
  , "warnings" :: Maybe (ValidationMessages')
  }
derive instance newtypeValidationWarning :: Newtype ValidationWarning _
derive instance repGenericValidationWarning :: Generic ValidationWarning _
instance showValidationWarning :: Show ValidationWarning where show = genericShow
instance decodeValidationWarning :: Decode ValidationWarning where decode = genericDecode options
instance encodeValidationWarning :: Encode ValidationWarning where encode = genericEncode options

-- | Constructs ValidationWarning from required parameters
newValidationWarning :: ValidationWarning
newValidationWarning  = ValidationWarning { "id": Nothing, "warnings": Nothing }

-- | Constructs ValidationWarning's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newValidationWarning' :: ( { "id" :: Maybe (Id') , "warnings" :: Maybe (ValidationMessages') } -> {"id" :: Maybe (Id') , "warnings" :: Maybe (ValidationMessages') } ) -> ValidationWarning
newValidationWarning'  customize = (ValidationWarning <<< customize) { "id": Nothing, "warnings": Nothing }



newtype ValidationWarnings = ValidationWarnings (Array ValidationWarning)
derive instance newtypeValidationWarnings :: Newtype ValidationWarnings _
derive instance repGenericValidationWarnings :: Generic ValidationWarnings _
instance showValidationWarnings :: Show ValidationWarnings where show = genericShow
instance decodeValidationWarnings :: Decode ValidationWarnings where decode = genericDecode options
instance encodeValidationWarnings :: Encode ValidationWarnings where encode = genericEncode options



newtype AttributeNameString' = AttributeNameString' String
derive instance newtypeAttributeNameString' :: Newtype AttributeNameString' _
derive instance repGenericAttributeNameString' :: Generic AttributeNameString' _
instance showAttributeNameString' :: Show AttributeNameString' where show = genericShow
instance decodeAttributeNameString' :: Decode AttributeNameString' where decode = genericDecode options
instance encodeAttributeNameString' :: Encode AttributeNameString' where encode = genericEncode options



newtype AttributeValueString' = AttributeValueString' String
derive instance newtypeAttributeValueString' :: Newtype AttributeValueString' _
derive instance repGenericAttributeValueString' :: Generic AttributeValueString' _
instance showAttributeValueString' :: Show AttributeValueString' where show = genericShow
instance decodeAttributeValueString' :: Decode AttributeValueString' where decode = genericDecode options
instance encodeAttributeValueString' :: Encode AttributeValueString' where encode = genericEncode options



newtype CancelActive' = CancelActive' Boolean
derive instance newtypeCancelActive' :: Newtype CancelActive' _
derive instance repGenericCancelActive' :: Generic CancelActive' _
instance showCancelActive' :: Show CancelActive' where show = genericShow
instance decodeCancelActive' :: Decode CancelActive' where decode = genericDecode options
instance encodeCancelActive' :: Encode CancelActive' where encode = genericEncode options



newtype ErrorMessage' = ErrorMessage' String
derive instance newtypeErrorMessage' :: Newtype ErrorMessage' _
derive instance repGenericErrorMessage' :: Generic ErrorMessage' _
instance showErrorMessage' :: Show ErrorMessage' where show = genericShow
instance decodeErrorMessage' :: Decode ErrorMessage' where decode = genericDecode options
instance encodeErrorMessage' :: Encode ErrorMessage' where encode = genericEncode options



newtype FieldList' = FieldList' (Array Field)
derive instance newtypeFieldList' :: Newtype FieldList' _
derive instance repGenericFieldList' :: Generic FieldList' _
instance showFieldList' :: Show FieldList' where show = genericShow
instance decodeFieldList' :: Decode FieldList' where decode = genericDecode options
instance encodeFieldList' :: Encode FieldList' where encode = genericEncode options



newtype FieldNameString' = FieldNameString' String
derive instance newtypeFieldNameString' :: Newtype FieldNameString' _
derive instance repGenericFieldNameString' :: Generic FieldNameString' _
instance showFieldNameString' :: Show FieldNameString' where show = genericShow
instance decodeFieldNameString' :: Decode FieldNameString' where decode = genericDecode options
instance encodeFieldNameString' :: Encode FieldNameString' where encode = genericEncode options



newtype FieldStringValue' = FieldStringValue' String
derive instance newtypeFieldStringValue' :: Newtype FieldStringValue' _
derive instance repGenericFieldStringValue' :: Generic FieldStringValue' _
instance showFieldStringValue' :: Show FieldStringValue' where show = genericShow
instance decodeFieldStringValue' :: Decode FieldStringValue' where decode = genericDecode options
instance encodeFieldStringValue' :: Encode FieldStringValue' where encode = genericEncode options



newtype Id' = Id' String
derive instance newtypeId' :: Newtype Id' _
derive instance repGenericId' :: Generic Id' _
instance showId' :: Show Id' where show = genericShow
instance decodeId' :: Decode Id' where decode = genericDecode options
instance encodeId' :: Encode Id' where encode = genericEncode options



newtype IdList' = IdList' (Array Id')
derive instance newtypeIdList' :: Newtype IdList' _
derive instance repGenericIdList' :: Generic IdList' _
instance showIdList' :: Show IdList' where show = genericShow
instance decodeIdList' :: Decode IdList' where decode = genericDecode options
instance encodeIdList' :: Encode IdList' where encode = genericEncode options



newtype LongString' = LongString' String
derive instance newtypeLongString' :: Newtype LongString' _
derive instance repGenericLongString' :: Generic LongString' _
instance showLongString' :: Show LongString' where show = genericShow
instance decodeLongString' :: Decode LongString' where decode = genericDecode options
instance encodeLongString' :: Encode LongString' where encode = genericEncode options



newtype PipelineList' = PipelineList' (Array PipelineIdName)
derive instance newtypePipelineList' :: Newtype PipelineList' _
derive instance repGenericPipelineList' :: Generic PipelineList' _
instance showPipelineList' :: Show PipelineList' where show = genericShow
instance decodePipelineList' :: Decode PipelineList' where decode = genericDecode options
instance encodePipelineList' :: Encode PipelineList' where encode = genericEncode options



newtype StringList' = StringList' (Array String)
derive instance newtypeStringList' :: Newtype StringList' _
derive instance repGenericStringList' :: Generic StringList' _
instance showStringList' :: Show StringList' where show = genericShow
instance decodeStringList' :: Decode StringList' where decode = genericDecode options
instance encodeStringList' :: Encode StringList' where encode = genericEncode options



newtype TagKey' = TagKey' String
derive instance newtypeTagKey' :: Newtype TagKey' _
derive instance repGenericTagKey' :: Generic TagKey' _
instance showTagKey' :: Show TagKey' where show = genericShow
instance decodeTagKey' :: Decode TagKey' where decode = genericDecode options
instance encodeTagKey' :: Encode TagKey' where encode = genericEncode options



newtype TagList' = TagList' (Array Tag)
derive instance newtypeTagList' :: Newtype TagList' _
derive instance repGenericTagList' :: Generic TagList' _
instance showTagList' :: Show TagList' where show = genericShow
instance decodeTagList' :: Decode TagList' where decode = genericDecode options
instance encodeTagList' :: Encode TagList' where encode = genericEncode options



newtype TagValue' = TagValue' String
derive instance newtypeTagValue' :: Newtype TagValue' _
derive instance repGenericTagValue' :: Generic TagValue' _
instance showTagValue' :: Show TagValue' where show = genericShow
instance decodeTagValue' :: Decode TagValue' where decode = genericDecode options
instance encodeTagValue' :: Encode TagValue' where encode = genericEncode options



newtype TaskId' = TaskId' String
derive instance newtypeTaskId' :: Newtype TaskId' _
derive instance repGenericTaskId' :: Generic TaskId' _
instance showTaskId' :: Show TaskId' where show = genericShow
instance decodeTaskId' :: Decode TaskId' where decode = genericDecode options
instance encodeTaskId' :: Encode TaskId' where encode = genericEncode options



newtype ValidationMessage' = ValidationMessage' String
derive instance newtypeValidationMessage' :: Newtype ValidationMessage' _
derive instance repGenericValidationMessage' :: Generic ValidationMessage' _
instance showValidationMessage' :: Show ValidationMessage' where show = genericShow
instance decodeValidationMessage' :: Decode ValidationMessage' where decode = genericDecode options
instance encodeValidationMessage' :: Encode ValidationMessage' where encode = genericEncode options



newtype ValidationMessages' = ValidationMessages' (Array ValidationMessage')
derive instance newtypeValidationMessages' :: Newtype ValidationMessages' _
derive instance repGenericValidationMessages' :: Generic ValidationMessages' _
instance showValidationMessages' :: Show ValidationMessages' where show = genericShow
instance decodeValidationMessages' :: Decode ValidationMessages' where decode = genericDecode options
instance encodeValidationMessages' :: Encode ValidationMessages' where encode = genericEncode options

