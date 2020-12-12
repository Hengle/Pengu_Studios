// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Objects/Prop Standard Lit"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledBanner(Prop Standard Lit)]_Banner("Banner", Float) = 0
		[StyledCategory(Render Settings)]_RenderingCat("[ Rendering Cat ]", Float) = 0
		[Enum(Opaque,0,Transparent,1)]_RenderMode("Render Mode", Float) = 0
		[Enum(Both,0,Back,1,Front,2)]_RenderCull("Render Faces", Float) = 0
		[Enum(Flip,0,Mirror,1,None,2)]_RenderNormals("Render Normals", Float) = 0
		[Enum(Alpha,0,Premultiply,1)]_RenderBlend("Render Blend", Float) = 0
		[Enum(Off,0,On,1)]_RenderZWrite("Render ZWrite", Float) = 1
		[IntRange]_RenderPriority("Render Priority", Range( -100 , 100)) = 0
		[Enum(Off,0,On,1)][Space(10)]_RenderClip("Alpha Clipping", Float) = 1
		_Cutoff("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledCategory(Global Settings)]_GlobalCat("[ Global Cat ]", Float) = 0
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		[StyledSpace(10)]_GlobalSpace("# Global Space", Float) = 0
		_OverlayContrastValue("Overlay Contrast", Range( 0 , 10)) = 4
		[StyledCategory(Main Settings)]_MainCat("[ Main Cat ]", Float) = 0
		[NoScaleOffset]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset]_MainNormalTex("Main Normal", 2D) = "gray" {}
		[NoScaleOffset]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[HDR]_MainColor("Main Color", Color) = (1,1,1,1)
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainMetallicValue("Main Metallic", Range( 0 , 1)) = 0
		_MainOcclusionValue("Main Occlusion", Range( 0 , 1)) = 1
		_MainSmoothnessValue("Main Smoothness", Range( 0 , 1)) = 1
		[StyledCategory(Detail Settings)]_DetailCat("[ Detail Cat ]", Float) = 0
		[Enum(Off,0,Overlay,1,Replace,2)]_DetailMode("Detail Mode", Float) = 0
		[Enum(Vertex Paint,0,Projection,1)]_DetailTypeMode("Detail Type", Float) = 0
		[Enum(UV 0,0,UV 2,1)]_DetailCoordMode("Detail Coord", Float) = 0
		[Enum(Top,0,Bottom,1)]_DetailProjectionMode("Detail Projection", Float) = 0
		[Enum(Standard,0,Packed,1)]_DetailMapsMode("Detail Maps", Float) = 0
		[Enum(Main Mask,0,Detail Mask,1)]_DetailMaskMode("Detail Mask", Float) = 0
		[StyledSpace(10)]_DetailSpace("# Detail Space", Float) = 0
		[NoScaleOffset]_SecondPackedTex("Detail Packed", 2D) = "white" {}
		[NoScaleOffset]_SecondAlbedoTex("Detail Albedo", 2D) = "white" {}
		[NoScaleOffset]_SecondNormalTex("Detail Normal", 2D) = "gray" {}
		[NoScaleOffset]_SecondMaskTex("Detail Mask", 2D) = "white" {}
		[Space(10)]_SecondUVs("Detail UVs", Vector) = (1,1,0,0)
		[HDR]_SecondColor("Detail Color", Color) = (1,1,1,1)
		_SecondNormalValue("Detail Normal", Range( -8 , 8)) = 1
		_SecondMetallicValue("Detail Metallic", Range( 0 , 1)) = 0
		_SecondOcclusionValue("Detail Occlusion", Range( 0 , 1)) = 1
		_SecondSmoothnessValue("Detail Smoothness", Range( 0 , 1)) = 1
		[Space(10)]_DetailNormalValue("Detail Use Main Normal", Range( 0 , 1)) = 0.5
		[Space(10)]_DetailMeshValue("Detail Mask Offset", Range( -1 , 1)) = 0
		_DetailMaskValue("Detail Mask Power", Range( -1 , 1)) = 0
		_DetailMaskContrast("Detail Mask Contrast", Range( 0 , 1)) = 0.25
		[HideInInspector][ASEDiffusionProfile(_SubsurfaceDiffusion)]_SubsurfaceDiffusion_asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledMessage(Info, The Object motion feature allows for high quality bending motion and interaction. The motion and global elements are calculated per instance., _VertexMotionMode, 0 , 2, 0)]_ObjectDataMessage("# Object Data Message", Float) = 0
		[StyledMessage(Info, The World motion feature allows for simpler and cheaper translation motion and interaction. The motion is calculated in world space but the global elements are calculated per instance., _VertexMotionMode, 1 , 2, 0)]_WorldDataMessage("# World Data Message", Float) = 0
		[StyledMessage(Info, The Baked pivots feature allows for using per mesh element interaction and elements influence. This feature requires pre baked pivots on prefab conversion. Useful for latge grass meshes., _VertexPivotMode, 1 , 0, 0)]_PivotsMessage("# Pivots Message", Float) = 0
		[HideInInspector]_MotionAmplitude_10("Primary Bending", Float) = 2
		[HideInInspector]_MotionSpeed_10("Primary Speed", Float) = 6
		[HideInInspector]_MotionScale_10("Primary Elasticity", Float) = 1
		[HideInInspector]_MotionVariation_10("Primary Variation", Float) = 3
		[HideInInspector]_MotionAmplitude_20("Secundary Rolling", Float) = 0
		[HideInInspector]_MotionSpeed_20("Secundary Speed", Float) = 5
		[HideInInspector]_MotionScale_20("Secundary Elasticity", Float) = 0
		[HideInInspector]_MotionVariation_20("Secundary Variation", Range( 0 , 5)) = 0
		[HideInInspector]_MotionAmplitude_30("Leaves Amplitude", Float) = 0
		[HideInInspector]_MotionSpeed_30("Leaves Speed", Float) = 15
		[HideInInspector]_MotionScale_30("Leaves Scale", Float) = 30
		[HideInInspector]_MotionVariation_30("Leaves Variation", Float) = 30
		[HideInInspector]_MotionAmplitude_32("Flutter Amplitude", Float) = 1
		[HideInInspector]_MotionSpeed_32("Flutter Speed", Float) = 30
		[HideInInspector]_MotionScale_32("Flutter Elasticity", Float) = 30
		[HideInInspector]_MotionVariation_32("Flutter Variation", Float) = 30
		[HideInInspector]_InteractionAmplitude("Interaction Bending", Float) = 0
		[HideInInspector]_InteractionVariation("Interaction Variation", Float) = 0
		[StyledCategory(Advanced)]_AdvancedCat("[ Advanced Cat]", Float) = 0
		[ASEEnd][StyledMessage(Info, Use the Batching Support option when the object is statically batched. All vertex calculations are done in world space and features like Baked Pivots and Size options are not supported because the object pivot data is missing with static batching., _VertexDataMode, 1 , 2,10)]_BatchingMessage("# Batching Message", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsVersion("_IsVersion", Float) = 200
		[HideInInspector]_Color("_Color", Color) = (0,0,0,0)
		[HideInInspector]_MainTex("_MainTex", 2D) = "white" {}
		[HideInInspector]_MaxBoundsInfo("_MaxBoundsInfo", Vector) = (1,1,1,1)
		[HideInInspector]_VertexVariationMode("_VertexVariationMode", Float) = 0
		[HideInInspector]_vertex_pivot_mode("_vertex_pivot_mode", Float) = 0
		[HideInInspector]_render_normals_options("_render_normals_options", Vector) = (1,1,1,0)
		[HideInInspector]_material_batching("_material_batching", Float) = 0
		[HideInInspector][Enum(Main Mask,0,Detail Mask,1)]_MaskMode("_MaskMode", Float) = 0
		[HideInInspector]_OverlayContrast("_OverlayContrast", Float) = 0
		[HideInInspector]_ObjectOcclusionValue("_ObjectOcclusionValue", Float) = 0
		[HideInInspector]_ObjectSmoothnessValue("_ObjectSmoothnessValue", Float) = 0
		[HideInInspector]_ObjectMetallicValue("_ObjectMetallicValue", Float) = 0
		[HideInInspector]_OverlayVariation("_OverlayVariation", Float) = 0
		[HideInInspector]_GrassPerspectiveAngleValue("_GrassPerspectiveAngleValue", Float) = 0
		[HideInInspector]_GrassPerspectiveNoiseValue("_GrassPerspectiveNoiseValue", Float) = 0
		[HideInInspector]_GrassPerspectivePushValue("_GrassPerspectivePushValue", Float) = 0
		[HideInInspector]_SubsurfaceMinValue("_SubsurfaceMinValue", Float) = 0
		[HideInInspector]_SubsurfaceMaxValue("_SubsurfaceMaxValue", Float) = 0
		[HideInInspector]_render_mode("_render_mode", Float) = 0
		[HideInInspector]_render_normals("_render_normals", Float) = 0
		[HideInInspector]_render_blend("_render_blend", Float) = 0
		[HideInInspector]_render_priority("_render_priority", Float) = 0
		[HideInInspector]_render_premul("_render_premul", Float) = 0
		[HideInInspector]_IsPropShader("_IsPropShader", Float) = 1
		[HideInInspector]_IsAnyPathShader("_IsAnyPathShader", Float) = 1
		[HideInInspector]_IsLitShader("_IsLitShader", Float) = 1
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_render_cutoff("_render_cutoff", Float) = 0.5
		[HideInInspector]_render_cull("_render_cull", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 1
		[HideInInspector]_render_dst("_render_dst", Float) = 0
		[HideInInspector]_render_zw("_render_zw", Float) = 1

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" }
		Cull [_render_cull]
		AlphaToMask Off
		HLSLINCLUDE
		#pragma target 3.0

		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }
			
			Blend [_render_src] [_render_dst], One Zero
			ZWrite [_render_zw]
			ZTest LEqual
			Offset 0,0
			ColorMask RGBA
			

			HLSLPROGRAM
		    #pragma multi_compile_instancing
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define TVE_DISABLE_ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70201

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_DETAIL_MODE_OFF TVE_DETAIL_MODE_OVERLAY TVE_DETAIL_MODE_REPLACE
			#pragma shader_feature_local TVE_DETAIL_MAPS_STANDARD TVE_DETAIL_MAPS_PACKED
			#pragma shader_feature_local TVE_DETAIL_TYPE_VERTEX_BLUE TVE_DETAIL_TYPE_PROJECTION
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#define TVE_VERTEX_DATA_BATCHED
			#define TVE_IS_OBJECT_SHADER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MaxBoundsInfo;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			float4 _SubsurfaceDiffusion_asset;
			half4 _SecondUVs;
			float4 _Color;
			half3 _render_normals_options;
			half _render_zw;
			half _render_dst;
			half _render_cutoff;
			half _render_src;
			half _BatchingMessage;
			float _MotionVariation_32;
			half _DetailMapsMode;
			half _DetailTypeMode;
			half _GlobalCat;
			half _ObjectDataMessage;
			half _DetailCat;
			half _AdvancedCat;
			float _MotionScale_20;
			half _MainCat;
			float _MotionVariation_30;
			half _RenderMode;
			half _MotionAmplitude_20;
			half _render_cull;
			half _IsLitShader;
			half _IsPropShader;
			half _Banner;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			half _render_premul;
			half _vertex_pivot_mode;
			half _GlobalOverlay;
			half _OverlayContrastValue;
			half _DetailNormalValue;
			half _SecondNormalValue;
			half _DetailMaskContrast;
			half _DetailMaskValue;
			half _DetailMaskMode;
			half _DetailProjectionMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _IsAnyPathShader;
			half _MotionVariation_10;
			half _IsStandardShader;
			half _WorldDataMessage;
			half _DetailMode;
			half _MainOcclusionValue;
			half _MotionAmplitude_30;
			float _material_batching;
			half _MaskMode;
			float _ObjectMetallicValue;
			float _render_normals;
			float _GrassPerspectiveNoiseValue;
			float _ObjectSmoothnessValue;
			float _render_blend;
			float _render_mode;
			float _render_priority;
			float _OverlayVariation;
			float _OverlayContrast;
			float _GrassPerspectivePushValue;
			float _ObjectOcclusionValue;
			float _SubsurfaceMinValue;
			float _GrassPerspectiveAngleValue;
			float _SubsurfaceMaxValue;
			half _GlobalSpace;
			half _DetailSpace;
			half _InteractionVariation;
			float _MotionScale_32;
			half _IsTVEShader;
			half _Cutoff;
			half _RenderPriority;
			half _RenderBlend;
			half _RenderZWrite;
			half _MotionAmplitude_32;
			half _RenderCull;
			float _MotionSpeed_30;
			half _PivotsMessage;
			half _MotionAmplitude_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			float _MotionSpeed_20;
			half _InteractionAmplitude;
			float _MotionSpeed_32;
			float _MotionScale_30;
			half _RenderNormals;
			half _MainNormalValue;
			half _IsVersion;
			half _RenderingCat;
			half _VertexVariationMode;
			half _MotionVariation_20;
			half _RenderClip;
			half _SecondOcclusionValue;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			TEXTURE2D(_SecondMaskTex);
			SAMPLER(sampler_SecondMaskTex);
			TEXTURE2D(_SecondPackedTex);
			SAMPLER(sampler_SecondPackedTex);
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_MainMaskTex);
			half4 TVE_OverlayColor;
			TEXTURE2D(_MainNormalTex);
			SAMPLER(sampler_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			SAMPLER(sampler_SecondNormalTex);
			half TVE_OverlayIntensity;
			TEXTURE2D(TVE_ExtrasTex);
			half4 TVE_VolumeCoord;
			SAMPLER(samplerTVE_ExtrasTex);
			TEXTURE2D(TVE_ExtrasTex_Vegetation);
			SAMPLER(samplerTVE_ExtrasTex_Vegetation);
			TEXTURE2D(TVE_ExtrasTex_Grass);
			SAMPLER(samplerTVE_ExtrasTex_Grass);
			TEXTURE2D(TVE_ExtrasTex_Objects);
			SAMPLER(samplerTVE_ExtrasTex_Objects);
			TEXTURE2D(TVE_ExtrasTex_User);
			SAMPLER(samplerTVE_ExtrasTex_User);
			half TVE_OverlaySmoothness;
			float TVE_Wetness;


			half4 USE_BUFFERS( half4 Legacy, half4 Vegetation, half4 Grass, half4 Objects, half4 Custom )
			{
				#if defined (TVE_IS_VEGETATION_SHADER)
				return Vegetation;
				#elif defined (TVE_IS_GRASS_SHADER)
				return Grass;
				#elif defined (TVE_IS_OBJECT_SHADER)
				return Objects;
				#elif defined (TVE_IS_CUSTOM_SHADER)
				return Custom;
				#else
				return Legacy;
				#endif
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7 = v.texcoord;
				o.ase_texcoord8.xy = v.texcoord1.xyzw.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord9 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN , half ase_vface : VFACE ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				half2 Main_UVs15_g32108 = ( ( IN.ase_texcoord7.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g32108 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g32108 );
				float4 temp_output_51_0_g32108 = ( _MainColor * tex2DNode29_g32108 );
				half3 Main_AlbedoRaw99_g32108 = (temp_output_51_0_g32108).rgb;
				half3 Main_AlbedoTinted2808_g32108 = ( float3(1,1,1) * float3(1,1,1) * Main_AlbedoRaw99_g32108 * float3(1,1,1) );
				half3 Main_AlbedoColored863_g32108 = Main_AlbedoTinted2808_g32108;
				float2 lerpResult1545_g32108 = lerp( IN.ase_texcoord7.xy , IN.ase_texcoord8.xy , _DetailCoordMode);
				#if defined(TVE_DETAIL_TYPE_VERTEX_BLUE)
				float2 staticSwitch3466_g32108 = lerpResult1545_g32108;
				#elif defined(TVE_DETAIL_TYPE_PROJECTION)
				float2 staticSwitch3466_g32108 = (WorldPosition).xz;
				#else
				float2 staticSwitch3466_g32108 = lerpResult1545_g32108;
				#endif
				half2 Second_UVs17_g32108 = ( ( staticSwitch3466_g32108 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				float4 tex2DNode3380_g32108 = SAMPLE_TEXTURE2D( _SecondPackedTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				half Packed_Albedo3385_g32108 = tex2DNode3380_g32108.r;
				float4 temp_cast_0 = (Packed_Albedo3385_g32108).xxxx;
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float4 staticSwitch3449_g32108 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float4 staticSwitch3449_g32108 = temp_cast_0;
				#else
				float4 staticSwitch3449_g32108 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				#endif
				half3 Second_Albedo153_g32108 = (( _SecondColor * staticSwitch3449_g32108 )).rgb;
				half3 Second_AlbedoColored1963_g32108 = Second_Albedo153_g32108;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g32319 = 2.0;
				#else
				float staticSwitch1_g32319 = 4.594794;
				#endif
				half Mesh_DetailMask90_g32108 = IN.ase_color.b;
				float temp_output_989_0_g32108 = ( ( Mesh_DetailMask90_g32108 - 0.5 ) + _DetailMeshValue );
				float3 lerpResult1537_g32108 = lerp( float3(0,1,0) , float3(0,-1,0) , _DetailProjectionMode);
				float dotResult1532_g32108 = dot( WorldNormal , lerpResult1537_g32108 );
				#if defined(TVE_DETAIL_TYPE_VERTEX_BLUE)
				float staticSwitch3467_g32108 = temp_output_989_0_g32108;
				#elif defined(TVE_DETAIL_TYPE_PROJECTION)
				float staticSwitch3467_g32108 = ( ( dotResult1532_g32108 * 0.5 ) + _DetailMeshValue );
				#else
				float staticSwitch3467_g32108 = temp_output_989_0_g32108;
				#endif
				half Blend_Source1540_g32108 = staticSwitch3467_g32108;
				float4 tex2DNode35_g32108 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g32108 );
				half Main_Mask_Raw57_g32108 = tex2DNode35_g32108.b;
				float4 tex2DNode33_g32108 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				half Second_Mask81_g32108 = tex2DNode33_g32108.b;
				float lerpResult1327_g32108 = lerp( Main_Mask_Raw57_g32108 , Second_Mask81_g32108 , _DetailMaskMode);
				float temp_output_7_0_g32425 = _DetailMaskContrast;
				float temp_output_973_0_g32108 = saturate( ( ( saturate( ( Blend_Source1540_g32108 + ( Blend_Source1540_g32108 * ( ( ( 1.0 - lerpResult1327_g32108 ) - 0.5 ) + _DetailMaskValue ) ) ) ) - temp_output_7_0_g32425 ) / ( ( 1.0 - _DetailMaskContrast ) - temp_output_7_0_g32425 ) ) );
				half Mask_Detail147_g32108 = temp_output_973_0_g32108;
				float3 lerpResult235_g32108 = lerp( Main_AlbedoColored863_g32108 , ( Main_AlbedoColored863_g32108 * Second_AlbedoColored1963_g32108 * staticSwitch1_g32319 ) , Mask_Detail147_g32108);
				float3 lerpResult208_g32108 = lerp( Main_AlbedoColored863_g32108 , Second_AlbedoColored1963_g32108 , Mask_Detail147_g32108);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch255_g32108 = Main_AlbedoColored863_g32108;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch255_g32108 = lerpResult235_g32108;
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch255_g32108 = lerpResult208_g32108;
				#else
				float3 staticSwitch255_g32108 = Main_AlbedoColored863_g32108;
				#endif
				half3 Blend_Albedo265_g32108 = staticSwitch255_g32108;
				half3 Blend_AlbedoAndSubsurface149_g32108 = Blend_Albedo265_g32108;
				half3 Global_OverlayColor1758_g32108 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g32108 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g32108 );
				float2 appendResult88_g32418 = (float2(tex2DNode117_g32108.a , tex2DNode117_g32108.g));
				float2 temp_output_90_0_g32418 = ( (appendResult88_g32418*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g32418 = (float3(temp_output_90_0_g32418 , 1.0));
				half3 Main_Normal137_g32108 = appendResult91_g32418;
				float4 tex2DNode145_g32108 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				float2 appendResult88_g32315 = (float2(tex2DNode145_g32108.a , tex2DNode145_g32108.g));
				float2 temp_output_90_0_g32315 = ( (appendResult88_g32315*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32315 = (float3(temp_output_90_0_g32315 , 1.0));
				half Packed_NormalX3387_g32108 = tex2DNode3380_g32108.a;
				half Packed_NormalY3386_g32108 = tex2DNode3380_g32108.g;
				float2 appendResult88_g32430 = (float2(Packed_NormalX3387_g32108 , Packed_NormalY3386_g32108));
				float2 temp_output_90_0_g32430 = ( (appendResult88_g32430*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32430 = (float3(temp_output_90_0_g32430 , 1.0));
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float3 staticSwitch3450_g32108 = appendResult91_g32315;
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float3 staticSwitch3450_g32108 = appendResult91_g32430;
				#else
				float3 staticSwitch3450_g32108 = appendResult91_g32315;
				#endif
				half3 Second_Normal179_g32108 = staticSwitch3450_g32108;
				float3 lerpResult230_g32108 = lerp( float3( 0,0,1 ) , Second_Normal179_g32108 , Mask_Detail147_g32108);
				float3 lerpResult3372_g32108 = lerp( float3( 0,0,1 ) , Main_Normal137_g32108 , _DetailNormalValue);
				float3 lerpResult3376_g32108 = lerp( Main_Normal137_g32108 , BlendNormal( lerpResult3372_g32108 , Second_Normal179_g32108 ) , Mask_Detail147_g32108);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch267_g32108 = Main_Normal137_g32108;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch267_g32108 = BlendNormal( Main_Normal137_g32108 , lerpResult230_g32108 );
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch267_g32108 = lerpResult3376_g32108;
				#else
				float3 staticSwitch267_g32108 = Main_Normal137_g32108;
				#endif
				half3 Blend_NormalRaw1051_g32108 = staticSwitch267_g32108;
				float3 switchResult1063_g32108 = (((ase_vface>0)?(Blend_NormalRaw1051_g32108):(( Blend_NormalRaw1051_g32108 * float3(-1,-1,-1) ))));
				half Overlay_Contrast1405_g32108 = _OverlayContrastValue;
				float3 appendResult1439_g32108 = (float3(Overlay_Contrast1405_g32108 , Overlay_Contrast1405_g32108 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal178_g32108 = ( switchResult1063_g32108 * appendResult1439_g32108 );
				float3 worldNormal178_g32108 = float3(dot(tanToWorld0,tanNormal178_g32108), dot(tanToWorld1,tanNormal178_g32108), dot(tanToWorld2,tanNormal178_g32108));
				half Global_OverlayIntensity154_g32108 = TVE_OverlayIntensity;
				float4x4 break19_g32355 = GetObjectToWorldMatrix();
				float3 appendResult20_g32355 = (float3(break19_g32355[ 0 ][ 3 ] , break19_g32355[ 1 ][ 3 ] , break19_g32355[ 2 ][ 3 ]));
				half3 Off19_g32356 = appendResult20_g32355;
				float4 transform68_g32355 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord9);
				float3 appendResult95_g32355 = (float3(IN.ase_texcoord7.z , 0.0 , IN.ase_texcoord7.w));
				float4 transform62_g32355 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord9.xyz - ( appendResult95_g32355 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32355 = ( (transform68_g32355).xyz - (transform62_g32355).xyz );
				half3 On20_g32356 = ObjectPositionWithPivots28_g32355;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32356 = On20_g32356;
				#else
				float3 staticSwitch14_g32356 = Off19_g32356;
				#endif
				half3 ObjectData20_g32357 = staticSwitch14_g32356;
				half3 WorldData19_g32357 = Off19_g32356;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32357 = WorldData19_g32357;
				#else
				float3 staticSwitch14_g32357 = ObjectData20_g32357;
				#endif
				float3 temp_output_42_0_g32355 = staticSwitch14_g32357;
				half3 ObjectData20_g32354 = temp_output_42_0_g32355;
				half3 WorldData19_g32354 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32354 = WorldData19_g32354;
				#else
				float3 staticSwitch14_g32354 = ObjectData20_g32354;
				#endif
				float2 temp_output_43_38_g32352 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32354).xz ) );
				half4 Legacy33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g32352 );
				half4 Vegetation33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g32352 );
				half4 Grass33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g32352 );
				half4 Objects33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g32352 );
				half4 Custom33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g32352 );
				half4 localUSE_BUFFERS33_g32353 = USE_BUFFERS( Legacy33_g32353 , Vegetation33_g32353 , Grass33_g32353 , Objects33_g32353 , Custom33_g32353 );
				float4 break49_g32352 = localUSE_BUFFERS33_g32353;
				half Global_ExtrasTex_B156_g32108 = break49_g32352.z;
				float temp_output_1025_0_g32108 = ( Global_OverlayIntensity154_g32108 * _GlobalOverlay * Global_ExtrasTex_B156_g32108 );
				half Overlay_Commons1365_g32108 = temp_output_1025_0_g32108;
				half Overlay_Mask269_g32108 = saturate( ( saturate( worldNormal178_g32108.y ) - ( 1.0 - Overlay_Commons1365_g32108 ) ) );
				float3 lerpResult336_g32108 = lerp( Blend_AlbedoAndSubsurface149_g32108 , Global_OverlayColor1758_g32108 , Overlay_Mask269_g32108);
				half3 Final_Albedo359_g32108 = lerpResult336_g32108;
				half Main_Alpha316_g32108 = (temp_output_51_0_g32108).a;
				float lerpResult354_g32108 = lerp( 1.0 , Main_Alpha316_g32108 , _render_premul);
				half Final_Premultiply355_g32108 = lerpResult354_g32108;
				float3 temp_output_410_0_g32108 = ( Final_Albedo359_g32108 * Final_Premultiply355_g32108 );
				
				float3 temp_output_13_0_g32320 = staticSwitch267_g32108;
				float3 switchResult12_g32320 = (((ase_vface>0)?(temp_output_13_0_g32320):(( temp_output_13_0_g32320 * _render_normals_options ))));
				half3 Blend_Normal312_g32108 = switchResult12_g32320;
				half3 Final_Normal366_g32108 = Blend_Normal312_g32108;
				
				half Main_Metallic237_g32108 = ( tex2DNode35_g32108.r * _MainMetallicValue );
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float staticSwitch3451_g32108 = ( tex2DNode33_g32108.r * _SecondMetallicValue );
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float staticSwitch3451_g32108 = 0.0;
				#else
				float staticSwitch3451_g32108 = ( tex2DNode33_g32108.r * _SecondMetallicValue );
				#endif
				half Second_Metallic226_g32108 = staticSwitch3451_g32108;
				float lerpResult278_g32108 = lerp( Main_Metallic237_g32108 , Second_Metallic226_g32108 , Mask_Detail147_g32108);
				#if defined(TVE_DETAIL_MODE_OFF)
				float staticSwitch299_g32108 = Main_Metallic237_g32108;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float staticSwitch299_g32108 = Main_Metallic237_g32108;
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float staticSwitch299_g32108 = lerpResult278_g32108;
				#else
				float staticSwitch299_g32108 = Main_Metallic237_g32108;
				#endif
				half Blend_Metallic306_g32108 = staticSwitch299_g32108;
				float lerpResult342_g32108 = lerp( Blend_Metallic306_g32108 , 0.0 , Overlay_Mask269_g32108);
				half Final_Metallic367_g32108 = lerpResult342_g32108;
				
				half Main_Smoothness227_g32108 = ( tex2DNode35_g32108.a * _MainSmoothnessValue );
				half Packed_Smoothness3388_g32108 = tex2DNode3380_g32108.b;
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float staticSwitch3456_g32108 = tex2DNode33_g32108.a;
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float staticSwitch3456_g32108 = Packed_Smoothness3388_g32108;
				#else
				float staticSwitch3456_g32108 = tex2DNode33_g32108.a;
				#endif
				half Second_Smoothness236_g32108 = ( staticSwitch3456_g32108 * _SecondSmoothnessValue );
				float lerpResult266_g32108 = lerp( Main_Smoothness227_g32108 , Second_Smoothness236_g32108 , Mask_Detail147_g32108);
				#if defined(TVE_DETAIL_MODE_OFF)
				float staticSwitch297_g32108 = Main_Smoothness227_g32108;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float staticSwitch297_g32108 = Main_Smoothness227_g32108;
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float staticSwitch297_g32108 = lerpResult266_g32108;
				#else
				float staticSwitch297_g32108 = Main_Smoothness227_g32108;
				#endif
				half Blend_Smoothness314_g32108 = staticSwitch297_g32108;
				half Global_OverlaySmoothness311_g32108 = TVE_OverlaySmoothness;
				float lerpResult343_g32108 = lerp( Blend_Smoothness314_g32108 , Global_OverlaySmoothness311_g32108 , Overlay_Mask269_g32108);
				half Final_Smoothness371_g32108 = lerpResult343_g32108;
				half Global_Wetness1016_g32108 = ( TVE_Wetness * _GlobalWetness );
				half Global_ExtrasTex_A1033_g32108 = break49_g32352.w;
				float lerpResult1037_g32108 = lerp( Final_Smoothness371_g32108 , saturate( ( Final_Smoothness371_g32108 + Global_Wetness1016_g32108 ) ) , Global_ExtrasTex_A1033_g32108);
				
				float lerpResult240_g32108 = lerp( 1.0 , tex2DNode35_g32108.g , _MainOcclusionValue);
				half Main_Occlusion247_g32108 = lerpResult240_g32108;
				float lerpResult239_g32108 = lerp( 1.0 , tex2DNode33_g32108.g , _SecondOcclusionValue);
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float staticSwitch3455_g32108 = lerpResult239_g32108;
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float staticSwitch3455_g32108 = 1.0;
				#else
				float staticSwitch3455_g32108 = lerpResult239_g32108;
				#endif
				half Second_Occlusion251_g32108 = staticSwitch3455_g32108;
				float lerpResult294_g32108 = lerp( Main_Occlusion247_g32108 , Second_Occlusion251_g32108 , Mask_Detail147_g32108);
				#if defined(TVE_DETAIL_MODE_OFF)
				float staticSwitch310_g32108 = Main_Occlusion247_g32108;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float staticSwitch310_g32108 = ( Main_Occlusion247_g32108 * Second_Occlusion251_g32108 );
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float staticSwitch310_g32108 = lerpResult294_g32108;
				#else
				float staticSwitch310_g32108 = Main_Occlusion247_g32108;
				#endif
				half Blend_Occlusion323_g32108 = staticSwitch310_g32108;
				
				float localCustomAlphaClip9_g32414 = ( 0.0 );
				half Main_AlphaRaw1203_g32108 = tex2DNode29_g32108.a;
				half Alpha5_g32414 = Main_AlphaRaw1203_g32108;
				float Alpha9_g32414 = Alpha5_g32414;
				#if _ALPHATEST_ON
				clip(Alpha9_g32414 - _Cutoff);
				#endif
				half Final_Clip914_g32108 = localCustomAlphaClip9_g32414;
				
				float3 Albedo = temp_output_410_0_g32108;
				float3 Normal = Final_Normal366_g32108;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = Final_Metallic367_g32108;
				float Smoothness = lerpResult1037_g32108;
				float Occlusion = Blend_Occlusion323_g32108;
				float Alpha = Main_Alpha316_g32108;
				float AlphaClipThreshold = Final_Clip914_g32108;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				//#ifdef _ALPHATEST_ON
				//	clip(Alpha - AlphaClipThreshold);
				//#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				half4 color = UniversalFragmentPBR(
					inputData, 
					Albedo, 
					Metallic, 
					Specular, 
					Smoothness, 
					Occlusion, 
					Emission, 
					Alpha);

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			HLSLPROGRAM
		    #pragma multi_compile_instancing
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define TVE_DISABLE_ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70201

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#pragma shader_feature_local _ALPHATEST_ON
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#define TVE_VERTEX_DATA_BATCHED
			#define TVE_IS_OBJECT_SHADER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MaxBoundsInfo;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			float4 _SubsurfaceDiffusion_asset;
			half4 _SecondUVs;
			float4 _Color;
			half3 _render_normals_options;
			half _render_zw;
			half _render_dst;
			half _render_cutoff;
			half _render_src;
			half _BatchingMessage;
			float _MotionVariation_32;
			half _DetailMapsMode;
			half _DetailTypeMode;
			half _GlobalCat;
			half _ObjectDataMessage;
			half _DetailCat;
			half _AdvancedCat;
			float _MotionScale_20;
			half _MainCat;
			float _MotionVariation_30;
			half _RenderMode;
			half _MotionAmplitude_20;
			half _render_cull;
			half _IsLitShader;
			half _IsPropShader;
			half _Banner;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			half _render_premul;
			half _vertex_pivot_mode;
			half _GlobalOverlay;
			half _OverlayContrastValue;
			half _DetailNormalValue;
			half _SecondNormalValue;
			half _DetailMaskContrast;
			half _DetailMaskValue;
			half _DetailMaskMode;
			half _DetailProjectionMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _IsAnyPathShader;
			half _MotionVariation_10;
			half _IsStandardShader;
			half _WorldDataMessage;
			half _DetailMode;
			half _MainOcclusionValue;
			half _MotionAmplitude_30;
			float _material_batching;
			half _MaskMode;
			float _ObjectMetallicValue;
			float _render_normals;
			float _GrassPerspectiveNoiseValue;
			float _ObjectSmoothnessValue;
			float _render_blend;
			float _render_mode;
			float _render_priority;
			float _OverlayVariation;
			float _OverlayContrast;
			float _GrassPerspectivePushValue;
			float _ObjectOcclusionValue;
			float _SubsurfaceMinValue;
			float _GrassPerspectiveAngleValue;
			float _SubsurfaceMaxValue;
			half _GlobalSpace;
			half _DetailSpace;
			half _InteractionVariation;
			float _MotionScale_32;
			half _IsTVEShader;
			half _Cutoff;
			half _RenderPriority;
			half _RenderBlend;
			half _RenderZWrite;
			half _MotionAmplitude_32;
			half _RenderCull;
			float _MotionSpeed_30;
			half _PivotsMessage;
			half _MotionAmplitude_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			float _MotionSpeed_20;
			half _InteractionAmplitude;
			float _MotionSpeed_32;
			float _MotionScale_30;
			half _RenderNormals;
			half _MainNormalValue;
			half _IsVersion;
			half _RenderingCat;
			half _VertexVariationMode;
			half _MotionVariation_20;
			half _RenderClip;
			half _SecondOcclusionValue;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);


			
			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				o.ase_texcoord2 = v.ase_texcoord;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				float4 clipPos = TransformWorldToHClip( ApplyShadowBias( positionWS, normalWS, _LightDirection ) );

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = clipPos;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
				
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g32108 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g32108 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g32108 );
				float4 temp_output_51_0_g32108 = ( _MainColor * tex2DNode29_g32108 );
				half Main_Alpha316_g32108 = (temp_output_51_0_g32108).a;
				
				float localCustomAlphaClip9_g32414 = ( 0.0 );
				half Main_AlphaRaw1203_g32108 = tex2DNode29_g32108.a;
				half Alpha5_g32414 = Main_AlphaRaw1203_g32108;
				float Alpha9_g32414 = Alpha5_g32414;
				#if _ALPHATEST_ON
				clip(Alpha9_g32414 - _Cutoff);
				#endif
				half Final_Clip914_g32108 = localCustomAlphaClip9_g32414;
				
				float Alpha = Main_Alpha316_g32108;
				float AlphaClipThreshold = Final_Clip914_g32108;
				float AlphaClipThresholdShadow = 0.5;

				//#ifdef _ALPHATEST_ON
				//	#ifdef _ALPHATEST_SHADOW_ON
				//		clip(Alpha - AlphaClipThresholdShadow);
				//	#else
				//		clip(Alpha - AlphaClipThreshold);
				//	#endif
				//#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
		    #pragma multi_compile_instancing
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define TVE_DISABLE_ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70201

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#pragma shader_feature_local _ALPHATEST_ON
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#define TVE_VERTEX_DATA_BATCHED
			#define TVE_IS_OBJECT_SHADER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MaxBoundsInfo;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			float4 _SubsurfaceDiffusion_asset;
			half4 _SecondUVs;
			float4 _Color;
			half3 _render_normals_options;
			half _render_zw;
			half _render_dst;
			half _render_cutoff;
			half _render_src;
			half _BatchingMessage;
			float _MotionVariation_32;
			half _DetailMapsMode;
			half _DetailTypeMode;
			half _GlobalCat;
			half _ObjectDataMessage;
			half _DetailCat;
			half _AdvancedCat;
			float _MotionScale_20;
			half _MainCat;
			float _MotionVariation_30;
			half _RenderMode;
			half _MotionAmplitude_20;
			half _render_cull;
			half _IsLitShader;
			half _IsPropShader;
			half _Banner;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			half _render_premul;
			half _vertex_pivot_mode;
			half _GlobalOverlay;
			half _OverlayContrastValue;
			half _DetailNormalValue;
			half _SecondNormalValue;
			half _DetailMaskContrast;
			half _DetailMaskValue;
			half _DetailMaskMode;
			half _DetailProjectionMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _IsAnyPathShader;
			half _MotionVariation_10;
			half _IsStandardShader;
			half _WorldDataMessage;
			half _DetailMode;
			half _MainOcclusionValue;
			half _MotionAmplitude_30;
			float _material_batching;
			half _MaskMode;
			float _ObjectMetallicValue;
			float _render_normals;
			float _GrassPerspectiveNoiseValue;
			float _ObjectSmoothnessValue;
			float _render_blend;
			float _render_mode;
			float _render_priority;
			float _OverlayVariation;
			float _OverlayContrast;
			float _GrassPerspectivePushValue;
			float _ObjectOcclusionValue;
			float _SubsurfaceMinValue;
			float _GrassPerspectiveAngleValue;
			float _SubsurfaceMaxValue;
			half _GlobalSpace;
			half _DetailSpace;
			half _InteractionVariation;
			float _MotionScale_32;
			half _IsTVEShader;
			half _Cutoff;
			half _RenderPriority;
			half _RenderBlend;
			half _RenderZWrite;
			half _MotionAmplitude_32;
			half _RenderCull;
			float _MotionSpeed_30;
			half _PivotsMessage;
			half _MotionAmplitude_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			float _MotionSpeed_20;
			half _InteractionAmplitude;
			float _MotionSpeed_32;
			float _MotionScale_30;
			half _RenderNormals;
			half _MainNormalValue;
			half _IsVersion;
			half _RenderingCat;
			half _VertexVariationMode;
			half _MotionVariation_20;
			half _RenderClip;
			half _SecondOcclusionValue;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord2 = v.ase_texcoord;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g32108 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g32108 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g32108 );
				float4 temp_output_51_0_g32108 = ( _MainColor * tex2DNode29_g32108 );
				half Main_Alpha316_g32108 = (temp_output_51_0_g32108).a;
				
				float localCustomAlphaClip9_g32414 = ( 0.0 );
				half Main_AlphaRaw1203_g32108 = tex2DNode29_g32108.a;
				half Alpha5_g32414 = Main_AlphaRaw1203_g32108;
				float Alpha9_g32414 = Alpha5_g32414;
				#if _ALPHATEST_ON
				clip(Alpha9_g32414 - _Cutoff);
				#endif
				half Final_Clip914_g32108 = localCustomAlphaClip9_g32414;
				
				float Alpha = Main_Alpha316_g32108;
				float AlphaClipThreshold = Final_Clip914_g32108;

				//#ifdef _ALPHATEST_ON
				//	clip(Alpha - AlphaClipThreshold);
				//#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
		    #pragma multi_compile_instancing
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define TVE_DISABLE_ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70201

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_DETAIL_MODE_OFF TVE_DETAIL_MODE_OVERLAY TVE_DETAIL_MODE_REPLACE
			#pragma shader_feature_local TVE_DETAIL_MAPS_STANDARD TVE_DETAIL_MAPS_PACKED
			#pragma shader_feature_local TVE_DETAIL_TYPE_VERTEX_BLUE TVE_DETAIL_TYPE_PROJECTION
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#define TVE_VERTEX_DATA_BATCHED
			#define TVE_IS_OBJECT_SHADER


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MaxBoundsInfo;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			float4 _SubsurfaceDiffusion_asset;
			half4 _SecondUVs;
			float4 _Color;
			half3 _render_normals_options;
			half _render_zw;
			half _render_dst;
			half _render_cutoff;
			half _render_src;
			half _BatchingMessage;
			float _MotionVariation_32;
			half _DetailMapsMode;
			half _DetailTypeMode;
			half _GlobalCat;
			half _ObjectDataMessage;
			half _DetailCat;
			half _AdvancedCat;
			float _MotionScale_20;
			half _MainCat;
			float _MotionVariation_30;
			half _RenderMode;
			half _MotionAmplitude_20;
			half _render_cull;
			half _IsLitShader;
			half _IsPropShader;
			half _Banner;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			half _render_premul;
			half _vertex_pivot_mode;
			half _GlobalOverlay;
			half _OverlayContrastValue;
			half _DetailNormalValue;
			half _SecondNormalValue;
			half _DetailMaskContrast;
			half _DetailMaskValue;
			half _DetailMaskMode;
			half _DetailProjectionMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _IsAnyPathShader;
			half _MotionVariation_10;
			half _IsStandardShader;
			half _WorldDataMessage;
			half _DetailMode;
			half _MainOcclusionValue;
			half _MotionAmplitude_30;
			float _material_batching;
			half _MaskMode;
			float _ObjectMetallicValue;
			float _render_normals;
			float _GrassPerspectiveNoiseValue;
			float _ObjectSmoothnessValue;
			float _render_blend;
			float _render_mode;
			float _render_priority;
			float _OverlayVariation;
			float _OverlayContrast;
			float _GrassPerspectivePushValue;
			float _ObjectOcclusionValue;
			float _SubsurfaceMinValue;
			float _GrassPerspectiveAngleValue;
			float _SubsurfaceMaxValue;
			half _GlobalSpace;
			half _DetailSpace;
			half _InteractionVariation;
			float _MotionScale_32;
			half _IsTVEShader;
			half _Cutoff;
			half _RenderPriority;
			half _RenderBlend;
			half _RenderZWrite;
			half _MotionAmplitude_32;
			half _RenderCull;
			float _MotionSpeed_30;
			half _PivotsMessage;
			half _MotionAmplitude_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			float _MotionSpeed_20;
			half _InteractionAmplitude;
			float _MotionSpeed_32;
			float _MotionScale_30;
			half _RenderNormals;
			half _MainNormalValue;
			half _IsVersion;
			half _RenderingCat;
			half _VertexVariationMode;
			half _MotionVariation_20;
			half _RenderClip;
			half _SecondOcclusionValue;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			TEXTURE2D(_SecondMaskTex);
			SAMPLER(sampler_SecondMaskTex);
			TEXTURE2D(_SecondPackedTex);
			SAMPLER(sampler_SecondPackedTex);
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_MainMaskTex);
			half4 TVE_OverlayColor;
			TEXTURE2D(_MainNormalTex);
			SAMPLER(sampler_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			SAMPLER(sampler_SecondNormalTex);
			half TVE_OverlayIntensity;
			TEXTURE2D(TVE_ExtrasTex);
			half4 TVE_VolumeCoord;
			SAMPLER(samplerTVE_ExtrasTex);
			TEXTURE2D(TVE_ExtrasTex_Vegetation);
			SAMPLER(samplerTVE_ExtrasTex_Vegetation);
			TEXTURE2D(TVE_ExtrasTex_Grass);
			SAMPLER(samplerTVE_ExtrasTex_Grass);
			TEXTURE2D(TVE_ExtrasTex_Objects);
			SAMPLER(samplerTVE_ExtrasTex_Objects);
			TEXTURE2D(TVE_ExtrasTex_User);
			SAMPLER(samplerTVE_ExtrasTex_User);


			half4 USE_BUFFERS( half4 Legacy, half4 Vegetation, half4 Grass, half4 Objects, half4 Custom )
			{
				#if defined (TVE_IS_VEGETATION_SHADER)
				return Vegetation;
				#elif defined (TVE_IS_GRASS_SHADER)
				return Grass;
				#elif defined (TVE_IS_OBJECT_SHADER)
				return Objects;
				#elif defined (TVE_IS_CUSTOM_SHADER)
				return Custom;
				#else
				return Legacy;
				#endif
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_texcoord3.xy = v.texcoord1.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord7 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , half ase_vface : VFACE ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g32108 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g32108 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g32108 );
				float4 temp_output_51_0_g32108 = ( _MainColor * tex2DNode29_g32108 );
				half3 Main_AlbedoRaw99_g32108 = (temp_output_51_0_g32108).rgb;
				half3 Main_AlbedoTinted2808_g32108 = ( float3(1,1,1) * float3(1,1,1) * Main_AlbedoRaw99_g32108 * float3(1,1,1) );
				half3 Main_AlbedoColored863_g32108 = Main_AlbedoTinted2808_g32108;
				float2 lerpResult1545_g32108 = lerp( IN.ase_texcoord2.xy , IN.ase_texcoord3.xy , _DetailCoordMode);
				#if defined(TVE_DETAIL_TYPE_VERTEX_BLUE)
				float2 staticSwitch3466_g32108 = lerpResult1545_g32108;
				#elif defined(TVE_DETAIL_TYPE_PROJECTION)
				float2 staticSwitch3466_g32108 = (WorldPosition).xz;
				#else
				float2 staticSwitch3466_g32108 = lerpResult1545_g32108;
				#endif
				half2 Second_UVs17_g32108 = ( ( staticSwitch3466_g32108 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				float4 tex2DNode3380_g32108 = SAMPLE_TEXTURE2D( _SecondPackedTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				half Packed_Albedo3385_g32108 = tex2DNode3380_g32108.r;
				float4 temp_cast_0 = (Packed_Albedo3385_g32108).xxxx;
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float4 staticSwitch3449_g32108 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float4 staticSwitch3449_g32108 = temp_cast_0;
				#else
				float4 staticSwitch3449_g32108 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				#endif
				half3 Second_Albedo153_g32108 = (( _SecondColor * staticSwitch3449_g32108 )).rgb;
				half3 Second_AlbedoColored1963_g32108 = Second_Albedo153_g32108;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g32319 = 2.0;
				#else
				float staticSwitch1_g32319 = 4.594794;
				#endif
				half Mesh_DetailMask90_g32108 = IN.ase_color.b;
				float temp_output_989_0_g32108 = ( ( Mesh_DetailMask90_g32108 - 0.5 ) + _DetailMeshValue );
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 lerpResult1537_g32108 = lerp( float3(0,1,0) , float3(0,-1,0) , _DetailProjectionMode);
				float dotResult1532_g32108 = dot( ase_worldNormal , lerpResult1537_g32108 );
				#if defined(TVE_DETAIL_TYPE_VERTEX_BLUE)
				float staticSwitch3467_g32108 = temp_output_989_0_g32108;
				#elif defined(TVE_DETAIL_TYPE_PROJECTION)
				float staticSwitch3467_g32108 = ( ( dotResult1532_g32108 * 0.5 ) + _DetailMeshValue );
				#else
				float staticSwitch3467_g32108 = temp_output_989_0_g32108;
				#endif
				half Blend_Source1540_g32108 = staticSwitch3467_g32108;
				float4 tex2DNode35_g32108 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g32108 );
				half Main_Mask_Raw57_g32108 = tex2DNode35_g32108.b;
				float4 tex2DNode33_g32108 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				half Second_Mask81_g32108 = tex2DNode33_g32108.b;
				float lerpResult1327_g32108 = lerp( Main_Mask_Raw57_g32108 , Second_Mask81_g32108 , _DetailMaskMode);
				float temp_output_7_0_g32425 = _DetailMaskContrast;
				float temp_output_973_0_g32108 = saturate( ( ( saturate( ( Blend_Source1540_g32108 + ( Blend_Source1540_g32108 * ( ( ( 1.0 - lerpResult1327_g32108 ) - 0.5 ) + _DetailMaskValue ) ) ) ) - temp_output_7_0_g32425 ) / ( ( 1.0 - _DetailMaskContrast ) - temp_output_7_0_g32425 ) ) );
				half Mask_Detail147_g32108 = temp_output_973_0_g32108;
				float3 lerpResult235_g32108 = lerp( Main_AlbedoColored863_g32108 , ( Main_AlbedoColored863_g32108 * Second_AlbedoColored1963_g32108 * staticSwitch1_g32319 ) , Mask_Detail147_g32108);
				float3 lerpResult208_g32108 = lerp( Main_AlbedoColored863_g32108 , Second_AlbedoColored1963_g32108 , Mask_Detail147_g32108);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch255_g32108 = Main_AlbedoColored863_g32108;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch255_g32108 = lerpResult235_g32108;
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch255_g32108 = lerpResult208_g32108;
				#else
				float3 staticSwitch255_g32108 = Main_AlbedoColored863_g32108;
				#endif
				half3 Blend_Albedo265_g32108 = staticSwitch255_g32108;
				half3 Blend_AlbedoAndSubsurface149_g32108 = Blend_Albedo265_g32108;
				half3 Global_OverlayColor1758_g32108 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g32108 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g32108 );
				float2 appendResult88_g32418 = (float2(tex2DNode117_g32108.a , tex2DNode117_g32108.g));
				float2 temp_output_90_0_g32418 = ( (appendResult88_g32418*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g32418 = (float3(temp_output_90_0_g32418 , 1.0));
				half3 Main_Normal137_g32108 = appendResult91_g32418;
				float4 tex2DNode145_g32108 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				float2 appendResult88_g32315 = (float2(tex2DNode145_g32108.a , tex2DNode145_g32108.g));
				float2 temp_output_90_0_g32315 = ( (appendResult88_g32315*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32315 = (float3(temp_output_90_0_g32315 , 1.0));
				half Packed_NormalX3387_g32108 = tex2DNode3380_g32108.a;
				half Packed_NormalY3386_g32108 = tex2DNode3380_g32108.g;
				float2 appendResult88_g32430 = (float2(Packed_NormalX3387_g32108 , Packed_NormalY3386_g32108));
				float2 temp_output_90_0_g32430 = ( (appendResult88_g32430*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32430 = (float3(temp_output_90_0_g32430 , 1.0));
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float3 staticSwitch3450_g32108 = appendResult91_g32315;
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float3 staticSwitch3450_g32108 = appendResult91_g32430;
				#else
				float3 staticSwitch3450_g32108 = appendResult91_g32315;
				#endif
				half3 Second_Normal179_g32108 = staticSwitch3450_g32108;
				float3 lerpResult230_g32108 = lerp( float3( 0,0,1 ) , Second_Normal179_g32108 , Mask_Detail147_g32108);
				float3 lerpResult3372_g32108 = lerp( float3( 0,0,1 ) , Main_Normal137_g32108 , _DetailNormalValue);
				float3 lerpResult3376_g32108 = lerp( Main_Normal137_g32108 , BlendNormal( lerpResult3372_g32108 , Second_Normal179_g32108 ) , Mask_Detail147_g32108);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch267_g32108 = Main_Normal137_g32108;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch267_g32108 = BlendNormal( Main_Normal137_g32108 , lerpResult230_g32108 );
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch267_g32108 = lerpResult3376_g32108;
				#else
				float3 staticSwitch267_g32108 = Main_Normal137_g32108;
				#endif
				half3 Blend_NormalRaw1051_g32108 = staticSwitch267_g32108;
				float3 switchResult1063_g32108 = (((ase_vface>0)?(Blend_NormalRaw1051_g32108):(( Blend_NormalRaw1051_g32108 * float3(-1,-1,-1) ))));
				half Overlay_Contrast1405_g32108 = _OverlayContrastValue;
				float3 appendResult1439_g32108 = (float3(Overlay_Contrast1405_g32108 , Overlay_Contrast1405_g32108 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal178_g32108 = ( switchResult1063_g32108 * appendResult1439_g32108 );
				float3 worldNormal178_g32108 = float3(dot(tanToWorld0,tanNormal178_g32108), dot(tanToWorld1,tanNormal178_g32108), dot(tanToWorld2,tanNormal178_g32108));
				half Global_OverlayIntensity154_g32108 = TVE_OverlayIntensity;
				float4x4 break19_g32355 = GetObjectToWorldMatrix();
				float3 appendResult20_g32355 = (float3(break19_g32355[ 0 ][ 3 ] , break19_g32355[ 1 ][ 3 ] , break19_g32355[ 2 ][ 3 ]));
				half3 Off19_g32356 = appendResult20_g32355;
				float4 transform68_g32355 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord7);
				float3 appendResult95_g32355 = (float3(IN.ase_texcoord2.z , 0.0 , IN.ase_texcoord2.w));
				float4 transform62_g32355 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord7.xyz - ( appendResult95_g32355 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32355 = ( (transform68_g32355).xyz - (transform62_g32355).xyz );
				half3 On20_g32356 = ObjectPositionWithPivots28_g32355;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32356 = On20_g32356;
				#else
				float3 staticSwitch14_g32356 = Off19_g32356;
				#endif
				half3 ObjectData20_g32357 = staticSwitch14_g32356;
				half3 WorldData19_g32357 = Off19_g32356;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32357 = WorldData19_g32357;
				#else
				float3 staticSwitch14_g32357 = ObjectData20_g32357;
				#endif
				float3 temp_output_42_0_g32355 = staticSwitch14_g32357;
				half3 ObjectData20_g32354 = temp_output_42_0_g32355;
				half3 WorldData19_g32354 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32354 = WorldData19_g32354;
				#else
				float3 staticSwitch14_g32354 = ObjectData20_g32354;
				#endif
				float2 temp_output_43_38_g32352 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32354).xz ) );
				half4 Legacy33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g32352 );
				half4 Vegetation33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g32352 );
				half4 Grass33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g32352 );
				half4 Objects33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g32352 );
				half4 Custom33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g32352 );
				half4 localUSE_BUFFERS33_g32353 = USE_BUFFERS( Legacy33_g32353 , Vegetation33_g32353 , Grass33_g32353 , Objects33_g32353 , Custom33_g32353 );
				float4 break49_g32352 = localUSE_BUFFERS33_g32353;
				half Global_ExtrasTex_B156_g32108 = break49_g32352.z;
				float temp_output_1025_0_g32108 = ( Global_OverlayIntensity154_g32108 * _GlobalOverlay * Global_ExtrasTex_B156_g32108 );
				half Overlay_Commons1365_g32108 = temp_output_1025_0_g32108;
				half Overlay_Mask269_g32108 = saturate( ( saturate( worldNormal178_g32108.y ) - ( 1.0 - Overlay_Commons1365_g32108 ) ) );
				float3 lerpResult336_g32108 = lerp( Blend_AlbedoAndSubsurface149_g32108 , Global_OverlayColor1758_g32108 , Overlay_Mask269_g32108);
				half3 Final_Albedo359_g32108 = lerpResult336_g32108;
				half Main_Alpha316_g32108 = (temp_output_51_0_g32108).a;
				float lerpResult354_g32108 = lerp( 1.0 , Main_Alpha316_g32108 , _render_premul);
				half Final_Premultiply355_g32108 = lerpResult354_g32108;
				float3 temp_output_410_0_g32108 = ( Final_Albedo359_g32108 * Final_Premultiply355_g32108 );
				
				float localCustomAlphaClip9_g32414 = ( 0.0 );
				half Main_AlphaRaw1203_g32108 = tex2DNode29_g32108.a;
				half Alpha5_g32414 = Main_AlphaRaw1203_g32108;
				float Alpha9_g32414 = Alpha5_g32414;
				#if _ALPHATEST_ON
				clip(Alpha9_g32414 - _Cutoff);
				#endif
				half Final_Clip914_g32108 = localCustomAlphaClip9_g32414;
				
				
				float3 Albedo = temp_output_410_0_g32108;
				float3 Emission = 0;
				float Alpha = Main_Alpha316_g32108;
				float AlphaClipThreshold = Final_Clip914_g32108;

				//#ifdef _ALPHATEST_ON
				//	clip(Alpha - AlphaClipThreshold);
				//#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
				metaInput.Emission = Emission;
				
				return MetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite [_render_zw]
			ZTest LEqual
			Offset 0,0
			ColorMask RGBA

			HLSLPROGRAM
		    #pragma multi_compile_instancing
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define TVE_DISABLE_ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70201

			#pragma enable_d3d11_debug_symbols
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_DETAIL_MODE_OFF TVE_DETAIL_MODE_OVERLAY TVE_DETAIL_MODE_REPLACE
			#pragma shader_feature_local TVE_DETAIL_MAPS_STANDARD TVE_DETAIL_MAPS_PACKED
			#pragma shader_feature_local TVE_DETAIL_TYPE_VERTEX_BLUE TVE_DETAIL_TYPE_PROJECTION
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#define TVE_VERTEX_DATA_BATCHED
			#define TVE_IS_OBJECT_SHADER


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MaxBoundsInfo;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			float4 _SubsurfaceDiffusion_asset;
			half4 _SecondUVs;
			float4 _Color;
			half3 _render_normals_options;
			half _render_zw;
			half _render_dst;
			half _render_cutoff;
			half _render_src;
			half _BatchingMessage;
			float _MotionVariation_32;
			half _DetailMapsMode;
			half _DetailTypeMode;
			half _GlobalCat;
			half _ObjectDataMessage;
			half _DetailCat;
			half _AdvancedCat;
			float _MotionScale_20;
			half _MainCat;
			float _MotionVariation_30;
			half _RenderMode;
			half _MotionAmplitude_20;
			half _render_cull;
			half _IsLitShader;
			half _IsPropShader;
			half _Banner;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			half _render_premul;
			half _vertex_pivot_mode;
			half _GlobalOverlay;
			half _OverlayContrastValue;
			half _DetailNormalValue;
			half _SecondNormalValue;
			half _DetailMaskContrast;
			half _DetailMaskValue;
			half _DetailMaskMode;
			half _DetailProjectionMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _IsAnyPathShader;
			half _MotionVariation_10;
			half _IsStandardShader;
			half _WorldDataMessage;
			half _DetailMode;
			half _MainOcclusionValue;
			half _MotionAmplitude_30;
			float _material_batching;
			half _MaskMode;
			float _ObjectMetallicValue;
			float _render_normals;
			float _GrassPerspectiveNoiseValue;
			float _ObjectSmoothnessValue;
			float _render_blend;
			float _render_mode;
			float _render_priority;
			float _OverlayVariation;
			float _OverlayContrast;
			float _GrassPerspectivePushValue;
			float _ObjectOcclusionValue;
			float _SubsurfaceMinValue;
			float _GrassPerspectiveAngleValue;
			float _SubsurfaceMaxValue;
			half _GlobalSpace;
			half _DetailSpace;
			half _InteractionVariation;
			float _MotionScale_32;
			half _IsTVEShader;
			half _Cutoff;
			half _RenderPriority;
			half _RenderBlend;
			half _RenderZWrite;
			half _MotionAmplitude_32;
			half _RenderCull;
			float _MotionSpeed_30;
			half _PivotsMessage;
			half _MotionAmplitude_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			float _MotionSpeed_20;
			half _InteractionAmplitude;
			float _MotionSpeed_32;
			float _MotionScale_30;
			half _RenderNormals;
			half _MainNormalValue;
			half _IsVersion;
			half _RenderingCat;
			half _VertexVariationMode;
			half _MotionVariation_20;
			half _RenderClip;
			half _SecondOcclusionValue;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			TEXTURE2D(_SecondMaskTex);
			SAMPLER(sampler_SecondMaskTex);
			TEXTURE2D(_SecondPackedTex);
			SAMPLER(sampler_SecondPackedTex);
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_MainMaskTex);
			half4 TVE_OverlayColor;
			TEXTURE2D(_MainNormalTex);
			SAMPLER(sampler_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			SAMPLER(sampler_SecondNormalTex);
			half TVE_OverlayIntensity;
			TEXTURE2D(TVE_ExtrasTex);
			half4 TVE_VolumeCoord;
			SAMPLER(samplerTVE_ExtrasTex);
			TEXTURE2D(TVE_ExtrasTex_Vegetation);
			SAMPLER(samplerTVE_ExtrasTex_Vegetation);
			TEXTURE2D(TVE_ExtrasTex_Grass);
			SAMPLER(samplerTVE_ExtrasTex_Grass);
			TEXTURE2D(TVE_ExtrasTex_Objects);
			SAMPLER(samplerTVE_ExtrasTex_Objects);
			TEXTURE2D(TVE_ExtrasTex_User);
			SAMPLER(samplerTVE_ExtrasTex_User);


			half4 USE_BUFFERS( half4 Legacy, half4 Vegetation, half4 Grass, half4 Objects, half4 Custom )
			{
				#if defined (TVE_IS_VEGETATION_SHADER)
				return Vegetation;
				#elif defined (TVE_IS_GRASS_SHADER)
				return Grass;
				#elif defined (TVE_IS_OBJECT_SHADER)
				return Objects;
				#elif defined (TVE_IS_CUSTOM_SHADER)
				return Custom;
				#else
				return Legacy;
				#endif
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_texcoord3.xy = v.ase_texcoord1.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord7 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , half ase_vface : VFACE ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g32108 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g32108 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g32108 );
				float4 temp_output_51_0_g32108 = ( _MainColor * tex2DNode29_g32108 );
				half3 Main_AlbedoRaw99_g32108 = (temp_output_51_0_g32108).rgb;
				half3 Main_AlbedoTinted2808_g32108 = ( float3(1,1,1) * float3(1,1,1) * Main_AlbedoRaw99_g32108 * float3(1,1,1) );
				half3 Main_AlbedoColored863_g32108 = Main_AlbedoTinted2808_g32108;
				float2 lerpResult1545_g32108 = lerp( IN.ase_texcoord2.xy , IN.ase_texcoord3.xy , _DetailCoordMode);
				#if defined(TVE_DETAIL_TYPE_VERTEX_BLUE)
				float2 staticSwitch3466_g32108 = lerpResult1545_g32108;
				#elif defined(TVE_DETAIL_TYPE_PROJECTION)
				float2 staticSwitch3466_g32108 = (WorldPosition).xz;
				#else
				float2 staticSwitch3466_g32108 = lerpResult1545_g32108;
				#endif
				half2 Second_UVs17_g32108 = ( ( staticSwitch3466_g32108 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				float4 tex2DNode3380_g32108 = SAMPLE_TEXTURE2D( _SecondPackedTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				half Packed_Albedo3385_g32108 = tex2DNode3380_g32108.r;
				float4 temp_cast_0 = (Packed_Albedo3385_g32108).xxxx;
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float4 staticSwitch3449_g32108 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float4 staticSwitch3449_g32108 = temp_cast_0;
				#else
				float4 staticSwitch3449_g32108 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				#endif
				half3 Second_Albedo153_g32108 = (( _SecondColor * staticSwitch3449_g32108 )).rgb;
				half3 Second_AlbedoColored1963_g32108 = Second_Albedo153_g32108;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g32319 = 2.0;
				#else
				float staticSwitch1_g32319 = 4.594794;
				#endif
				half Mesh_DetailMask90_g32108 = IN.ase_color.b;
				float temp_output_989_0_g32108 = ( ( Mesh_DetailMask90_g32108 - 0.5 ) + _DetailMeshValue );
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 lerpResult1537_g32108 = lerp( float3(0,1,0) , float3(0,-1,0) , _DetailProjectionMode);
				float dotResult1532_g32108 = dot( ase_worldNormal , lerpResult1537_g32108 );
				#if defined(TVE_DETAIL_TYPE_VERTEX_BLUE)
				float staticSwitch3467_g32108 = temp_output_989_0_g32108;
				#elif defined(TVE_DETAIL_TYPE_PROJECTION)
				float staticSwitch3467_g32108 = ( ( dotResult1532_g32108 * 0.5 ) + _DetailMeshValue );
				#else
				float staticSwitch3467_g32108 = temp_output_989_0_g32108;
				#endif
				half Blend_Source1540_g32108 = staticSwitch3467_g32108;
				float4 tex2DNode35_g32108 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g32108 );
				half Main_Mask_Raw57_g32108 = tex2DNode35_g32108.b;
				float4 tex2DNode33_g32108 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				half Second_Mask81_g32108 = tex2DNode33_g32108.b;
				float lerpResult1327_g32108 = lerp( Main_Mask_Raw57_g32108 , Second_Mask81_g32108 , _DetailMaskMode);
				float temp_output_7_0_g32425 = _DetailMaskContrast;
				float temp_output_973_0_g32108 = saturate( ( ( saturate( ( Blend_Source1540_g32108 + ( Blend_Source1540_g32108 * ( ( ( 1.0 - lerpResult1327_g32108 ) - 0.5 ) + _DetailMaskValue ) ) ) ) - temp_output_7_0_g32425 ) / ( ( 1.0 - _DetailMaskContrast ) - temp_output_7_0_g32425 ) ) );
				half Mask_Detail147_g32108 = temp_output_973_0_g32108;
				float3 lerpResult235_g32108 = lerp( Main_AlbedoColored863_g32108 , ( Main_AlbedoColored863_g32108 * Second_AlbedoColored1963_g32108 * staticSwitch1_g32319 ) , Mask_Detail147_g32108);
				float3 lerpResult208_g32108 = lerp( Main_AlbedoColored863_g32108 , Second_AlbedoColored1963_g32108 , Mask_Detail147_g32108);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch255_g32108 = Main_AlbedoColored863_g32108;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch255_g32108 = lerpResult235_g32108;
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch255_g32108 = lerpResult208_g32108;
				#else
				float3 staticSwitch255_g32108 = Main_AlbedoColored863_g32108;
				#endif
				half3 Blend_Albedo265_g32108 = staticSwitch255_g32108;
				half3 Blend_AlbedoAndSubsurface149_g32108 = Blend_Albedo265_g32108;
				half3 Global_OverlayColor1758_g32108 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g32108 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g32108 );
				float2 appendResult88_g32418 = (float2(tex2DNode117_g32108.a , tex2DNode117_g32108.g));
				float2 temp_output_90_0_g32418 = ( (appendResult88_g32418*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g32418 = (float3(temp_output_90_0_g32418 , 1.0));
				half3 Main_Normal137_g32108 = appendResult91_g32418;
				float4 tex2DNode145_g32108 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondMaskTex, Second_UVs17_g32108 );
				float2 appendResult88_g32315 = (float2(tex2DNode145_g32108.a , tex2DNode145_g32108.g));
				float2 temp_output_90_0_g32315 = ( (appendResult88_g32315*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32315 = (float3(temp_output_90_0_g32315 , 1.0));
				half Packed_NormalX3387_g32108 = tex2DNode3380_g32108.a;
				half Packed_NormalY3386_g32108 = tex2DNode3380_g32108.g;
				float2 appendResult88_g32430 = (float2(Packed_NormalX3387_g32108 , Packed_NormalY3386_g32108));
				float2 temp_output_90_0_g32430 = ( (appendResult88_g32430*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32430 = (float3(temp_output_90_0_g32430 , 1.0));
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float3 staticSwitch3450_g32108 = appendResult91_g32315;
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float3 staticSwitch3450_g32108 = appendResult91_g32430;
				#else
				float3 staticSwitch3450_g32108 = appendResult91_g32315;
				#endif
				half3 Second_Normal179_g32108 = staticSwitch3450_g32108;
				float3 lerpResult230_g32108 = lerp( float3( 0,0,1 ) , Second_Normal179_g32108 , Mask_Detail147_g32108);
				float3 lerpResult3372_g32108 = lerp( float3( 0,0,1 ) , Main_Normal137_g32108 , _DetailNormalValue);
				float3 lerpResult3376_g32108 = lerp( Main_Normal137_g32108 , BlendNormal( lerpResult3372_g32108 , Second_Normal179_g32108 ) , Mask_Detail147_g32108);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch267_g32108 = Main_Normal137_g32108;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch267_g32108 = BlendNormal( Main_Normal137_g32108 , lerpResult230_g32108 );
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch267_g32108 = lerpResult3376_g32108;
				#else
				float3 staticSwitch267_g32108 = Main_Normal137_g32108;
				#endif
				half3 Blend_NormalRaw1051_g32108 = staticSwitch267_g32108;
				float3 switchResult1063_g32108 = (((ase_vface>0)?(Blend_NormalRaw1051_g32108):(( Blend_NormalRaw1051_g32108 * float3(-1,-1,-1) ))));
				half Overlay_Contrast1405_g32108 = _OverlayContrastValue;
				float3 appendResult1439_g32108 = (float3(Overlay_Contrast1405_g32108 , Overlay_Contrast1405_g32108 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal178_g32108 = ( switchResult1063_g32108 * appendResult1439_g32108 );
				float3 worldNormal178_g32108 = float3(dot(tanToWorld0,tanNormal178_g32108), dot(tanToWorld1,tanNormal178_g32108), dot(tanToWorld2,tanNormal178_g32108));
				half Global_OverlayIntensity154_g32108 = TVE_OverlayIntensity;
				float4x4 break19_g32355 = GetObjectToWorldMatrix();
				float3 appendResult20_g32355 = (float3(break19_g32355[ 0 ][ 3 ] , break19_g32355[ 1 ][ 3 ] , break19_g32355[ 2 ][ 3 ]));
				half3 Off19_g32356 = appendResult20_g32355;
				float4 transform68_g32355 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord7);
				float3 appendResult95_g32355 = (float3(IN.ase_texcoord2.z , 0.0 , IN.ase_texcoord2.w));
				float4 transform62_g32355 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord7.xyz - ( appendResult95_g32355 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32355 = ( (transform68_g32355).xyz - (transform62_g32355).xyz );
				half3 On20_g32356 = ObjectPositionWithPivots28_g32355;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32356 = On20_g32356;
				#else
				float3 staticSwitch14_g32356 = Off19_g32356;
				#endif
				half3 ObjectData20_g32357 = staticSwitch14_g32356;
				half3 WorldData19_g32357 = Off19_g32356;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32357 = WorldData19_g32357;
				#else
				float3 staticSwitch14_g32357 = ObjectData20_g32357;
				#endif
				float3 temp_output_42_0_g32355 = staticSwitch14_g32357;
				half3 ObjectData20_g32354 = temp_output_42_0_g32355;
				half3 WorldData19_g32354 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32354 = WorldData19_g32354;
				#else
				float3 staticSwitch14_g32354 = ObjectData20_g32354;
				#endif
				float2 temp_output_43_38_g32352 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32354).xz ) );
				half4 Legacy33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g32352 );
				half4 Vegetation33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g32352 );
				half4 Grass33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g32352 );
				half4 Objects33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g32352 );
				half4 Custom33_g32353 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g32352 );
				half4 localUSE_BUFFERS33_g32353 = USE_BUFFERS( Legacy33_g32353 , Vegetation33_g32353 , Grass33_g32353 , Objects33_g32353 , Custom33_g32353 );
				float4 break49_g32352 = localUSE_BUFFERS33_g32353;
				half Global_ExtrasTex_B156_g32108 = break49_g32352.z;
				float temp_output_1025_0_g32108 = ( Global_OverlayIntensity154_g32108 * _GlobalOverlay * Global_ExtrasTex_B156_g32108 );
				half Overlay_Commons1365_g32108 = temp_output_1025_0_g32108;
				half Overlay_Mask269_g32108 = saturate( ( saturate( worldNormal178_g32108.y ) - ( 1.0 - Overlay_Commons1365_g32108 ) ) );
				float3 lerpResult336_g32108 = lerp( Blend_AlbedoAndSubsurface149_g32108 , Global_OverlayColor1758_g32108 , Overlay_Mask269_g32108);
				half3 Final_Albedo359_g32108 = lerpResult336_g32108;
				half Main_Alpha316_g32108 = (temp_output_51_0_g32108).a;
				float lerpResult354_g32108 = lerp( 1.0 , Main_Alpha316_g32108 , _render_premul);
				half Final_Premultiply355_g32108 = lerpResult354_g32108;
				float3 temp_output_410_0_g32108 = ( Final_Albedo359_g32108 * Final_Premultiply355_g32108 );
				
				float localCustomAlphaClip9_g32414 = ( 0.0 );
				half Main_AlphaRaw1203_g32108 = tex2DNode29_g32108.a;
				half Alpha5_g32414 = Main_AlphaRaw1203_g32108;
				float Alpha9_g32414 = Alpha5_g32414;
				#if _ALPHATEST_ON
				clip(Alpha9_g32414 - _Cutoff);
				#endif
				half Final_Clip914_g32108 = localCustomAlphaClip9_g32414;
				
				
				float3 Albedo = temp_output_410_0_g32108;
				float Alpha = Main_Alpha316_g32108;
				float AlphaClipThreshold = Final_Clip914_g32108;

				half4 color = half4( Albedo, Alpha );

				//#ifdef _ALPHATEST_ON
				//	clip(Alpha - AlphaClipThreshold);
				//#endif

				return color;
			}
			ENDHLSL
		}
		
	}
	/*ase_lod*/
	CustomEditor "TVEShaderCoreGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=18600
1927;7;1906;1015;2840.54;469.509;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;81;-1552,-896;Half;False;Property;_IsLitShader;_IsLitShader;206;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;343;-2176,320;Inherit;False;Use TVE_IS_OBJECT_SHADER;-1;;32434;1237b3cc9fbfe714d8343c91216dc9b4;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;342;-1376,-896;Half;False;Property;_IsAnyPathShader;_IsAnyPathShader;205;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Prop Standard Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;134;-1776,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;207;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-769;Half;False;Property;_render_cull;_render_cull;209;1;[HideInInspector];Create;True;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;127;-1984,-896;Half;False;Property;_IsPropShader;_IsPropShader;204;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1536,-768;Half;False;Property;_render_dst;_render_dst;211;1;[HideInInspector];Create;True;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-768;Half;False;Property;_render_cutoff;_render_cutoff;208;1;[HideInInspector];Create;True;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.719;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1728,-768;Half;False;Property;_render_src;_render_src;210;1;[HideInInspector];Create;True;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;341;-2176,256;Inherit;False;Use TVE_VERTEX_DATA_BATCHED;-1;;32433;749c61e1189c7f8408d9e6db94560d1d;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;354;-2176,-384;Inherit;False;Base Shader;1;;32108;856f7164d1c579d43a5cf4968a75ca43;50,1300,1,1298,1,1271,0,1708,0,1962,0,1712,0,1964,1,1969,1,1719,0,893,0,1745,0,1742,0,1718,1,1717,1,1715,1,1714,1,916,1,1949,1,1762,0,1763,0,1776,0,1646,0,1690,0,1757,0,3221,3,1981,0,2807,0,2953,0,3243,0,2172,0,2658,0,1734,1,1737,1,1733,1,1736,1,1968,1,1966,1,1735,1,878,1,1550,1,860,0,2750,0,2260,1,2261,1,2054,1,2032,1,2036,1,2060,1,2062,1,2039,1;0;15;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;212;1;[HideInInspector];Create;True;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;348;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;2;BOXOPHOBIC/The Vegetation Engine/Objects/Prop Standard Lit;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;17;False;False;False;False;False;False;False;False;True;0;False;-1;True;2;True;10;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;17;True;3;False;-1;True;False;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;36;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,True,669;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;1;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;0;0;6;False;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;349;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;347;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;351;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;350;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;352;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;True;1;True;17;True;3;False;-1;True;False;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1022.896;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1026.438;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;340;-2176,128;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
WireConnection;348;0;354;0
WireConnection;348;1;354;528
WireConnection;348;3;354;529
WireConnection;348;4;354;530
WireConnection;348;5;354;531
WireConnection;348;6;354;532
WireConnection;348;7;354;653
ASEEND*/
//CHKSM=B54F708CD21479E5B152FE08A88342E5B916BD6C
