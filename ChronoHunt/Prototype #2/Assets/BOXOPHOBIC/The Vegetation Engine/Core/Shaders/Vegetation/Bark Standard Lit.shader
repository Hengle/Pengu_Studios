// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Vegetation/Bark Standard Lit"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][StyledBanner(Bark Standard Lit)]_Banner("Banner", Float) = 0
		[StyledCategory(Render Settings)]_RenderingCat("[ Rendering Cat ]", Float) = 0
		[Enum(Opaque,0,Transparent,1)]_RenderMode("Render Mode", Float) = 0
		[Enum(Double Sided,0,Back Faces Only,1,Front Faces Only,2)]_RenderCull("Render Faces", Float) = 0
		[Enum(Flip Backface Normals,0,Mirror Backface Normals,1,None,2)]_RenderNormals("Render Normals", Float) = 0
		[Enum(Alpha Blend,0,Premultiply,1)]_RenderBlend("Render Blend", Float) = 0
		[Enum(Off,0,On,1)]_RenderZWrite("Render ZWrite", Float) = 1
		[IntRange]_RenderPriority("Render Priority", Range( -100 , 100)) = 0
		[Enum(Off,0,On,1)][Space(10)]_RenderClip("Alpha Clipping", Float) = 1
		_Cutoff("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledCategory(Global Settings)]_GlobalCat("[ Global Cat ]", Float) = 0
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalSize("Global Size", Range( 0 , 1)) = 1
		_GlobalSizeFade("Global Size Fade", Range( 0 , 1)) = 0
		[StyledSpace(10)]_GlobalSpace("# Global Space", Float) = 0
		[HideInInspector]_LocalSize("Local Size", Range( 0 , 1)) = 1
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
		[StyledCategory(Occlusion Settings)]_OcclusionCat("[ Occlusion Cat ]", Float) = 0
		[HDR]_VertexOcclusionColor("Vertex Occlusion Color", Color) = (0,0,0,0)
		_VertexOcclusionValue("Vertex Occlusion Power", Range( 0 , 8)) = 0
		[HideInInspector][ASEDiffusionProfile(_SubsurfaceDiffusion)]_SubsurfaceDiffusion_asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledCategory(Vertex Settings)]_VertexCat("[ Vertex Cat ]", Float) = 0
		[StyledMessage(Info, This motion type allows for high quality bending motion and interaction. The motion and global elements are calculated per instance., _VertexMotionMode, 0 , 2, 0)]_ObjectDataMessage("# Object Data Message", Float) = 0
		[StyledMessage(Info, This motion type allows for simpler and cheaper translation motion and interaction. The motion is calculated in world space but the global elements are calculated per instance., _VertexMotionMode, 1 , 2, 0)]_WorldDataMessage("# World Data Message", Float) = 0
		[StyledMessage(Info, The Baked pivots feature allows for using per mesh element interaction and elements influence. This feature requires pre baked pivots on prefab conversion. Useful for latge grass meshes., _VertexPivotMode, 1 , 0, 0)]_PivotsMessage("# Pivots Message", Float) = 0
		[Enum(High Quality,0,Low Quality,1)][Space(10)]_VertexMotionMode("Vertex Motion", Float) = 0
		[StyledSpace(10)]_VertexMotionSpace("# Vertex Motion Space", Float) = 0
		_Motion_10("Motion Bending", Range( 0 , 1)) = 1
		_Motion_20("Motion Rolling", Range( 0 , 1)) = 1
		_Motion_Interaction("Motion Interaction", Range( 0 , 1)) = 1
		[HideInInspector]_MotionAmplitude_10("Primary Bending", Float) = 2
		[HideInInspector]_MotionSpeed_10("Primary Speed", Float) = 6
		[HideInInspector]_MotionScale_10("Primary Elasticity", Float) = 1
		[HideInInspector]_MotionVariation_10("Primary Variation", Float) = 3
		[HideInInspector]_MotionAmplitude_20("Secundary Rolling", Float) = 0
		[HideInInspector]_MotionSpeed_20("Secundary Speed", Float) = 5
		[HideInInspector]_MotionScale_20("Secundary Elasticity", Float) = 0
		[HideInInspector]_MotionVariation_20("Secundary Variation", Range( 0 , 5)) = 0
		[HideInInspector]_InteractionAmplitude("Interaction Bending", Float) = 0
		[HideInInspector]_InteractionVariation("Interaction Variation", Float) = 0
		[StyledCategory(Advanced)]_AdvancedCat("[ Advanced Cat]", Float) = 0
		[StyledMessage(Info, Use the Batching Support option when the object is statically batched. All vertex calculations are done in world space and features like Baked Pivots and Size options are not supported because the object pivot data is missing with static batching., _VertexDataMode, 1 , 2,10)]_BatchingMessage("# Batching Message", Float) = 0
		[ASEEnd][StyledToggle]_VertexDataMode("Enable Batching Support", Float) = 0
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
		[HideInInspector]_IsBarkShader("_IsBarkShader", Float) = 1
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
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _ALPHATEST_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#pragma shader_feature_local TVE_DETAIL_MODE_OFF TVE_DETAIL_MODE_OVERLAY TVE_DETAIL_MODE_REPLACE
			#pragma shader_feature_local TVE_DETAIL_MAPS_STANDARD TVE_DETAIL_MAPS_PACKED
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#define TVE_IS_VEGETATION_SHADER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
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
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _Color;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			half3 _render_normals_options;
			half _VertexMotionSpace;
			half _VertexCat;
			half _InteractionVariation;
			half _Motion_Interaction;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _Motion_10;
			half _VertexMotionMode;
			half _MotionAmplitude_10;
			float _MotionScale_20;
			half _MotionVariation_20;
			float _MotionSpeed_20;
			half _Motion_20;
			half _vertex_pivot_mode;
			half _MotionAmplitude_20;
			half _render_cutoff;
			half _IsBarkShader;
			float _MotionSpeed_10;
			half _VertexDataMode;
			half _IsLitShader;
			half _GlobalSize;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			half _OcclusionCat;
			half _VertexOcclusionValue;
			half _render_premul;
			half _GlobalSizeFade;
			half _GlobalOverlay;
			half _DetailNormalValue;
			half _SecondNormalValue;
			half _DetailMaskContrast;
			half _DetailMaskValue;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _IsStandardShader;
			half _LocalSize;
			half _OverlayContrastValue;
			half _IsAnyPathShader;
			half _render_cull;
			half _render_dst;
			half _DetailTypeMode;
			half _AdvancedCat;
			half _DetailCat;
			half _RenderZWrite;
			half _RenderBlend;
			half _RenderNormals;
			half _RenderCull;
			half _MainCat;
			half _DetailMode;
			half _PivotsMessage;
			half _DetailMapsMode;
			half _RenderMode;
			half _VertexVariationMode;
			half _RenderPriority;
			half _IsVersion;
			half _IsTVEShader;
			half _RenderingCat;
			half _Cutoff;
			half _RenderClip;
			half _MainNormalValue;
			half _GlobalCat;
			half _DetailSpace;
			half _GlobalSpace;
			float _render_normals;
			half _MainOcclusionValue;
			half _Banner;
			half _render_zw;
			float _OverlayContrast;
			half _BatchingMessage;
			half _ObjectDataMessage;
			half _WorldDataMessage;
			half _MaskMode;
			float _GrassPerspectivePushValue;
			float _material_batching;
			float _ObjectSmoothnessValue;
			float _OverlayVariation;
			float _GrassPerspectiveAngleValue;
			float _ObjectMetallicValue;
			float _GrassPerspectiveNoiseValue;
			float _ObjectOcclusionValue;
			float _render_priority;
			float _render_mode;
			float _SubsurfaceMinValue;
			float _SubsurfaceMaxValue;
			float _render_blend;
			half _render_src;
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
			TEXTURE2D(TVE_MotionTex);
			half4 TVE_VolumeCoord;
			SAMPLER(samplerTVE_MotionTex);
			TEXTURE2D(TVE_MotionTex_Vegetation);
			SAMPLER(samplerTVE_MotionTex_Vegetation);
			TEXTURE2D(TVE_MotionTex_Grass);
			SAMPLER(samplerTVE_MotionTex_Grass);
			TEXTURE2D(TVE_MotionTex_Objects);
			SAMPLER(samplerTVE_MotionTex_Objects);
			TEXTURE2D(TVE_MotionTex_User);
			SAMPLER(samplerTVE_MotionTex_User);
			half TVE_WindPower;
			TEXTURE2D(TVE_NoiseTex);
			float2 TVE_NoiseSpeed_Vegetation;
			float2 TVE_NoiseSpeed_Grass;
			half TVE_NoiseSize_Vegetation;
			half TVE_NoiseSize_Grass;
			SAMPLER(samplerTVE_NoiseTex);
			half TVE_NoiseContrast;
			half TVE_WindMode;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			TEXTURE2D(TVE_ExtrasTex);
			SAMPLER(samplerTVE_ExtrasTex);
			TEXTURE2D(TVE_ExtrasTex_Vegetation);
			SAMPLER(samplerTVE_ExtrasTex_Vegetation);
			TEXTURE2D(TVE_ExtrasTex_Grass);
			SAMPLER(samplerTVE_ExtrasTex_Grass);
			TEXTURE2D(TVE_ExtrasTex_Objects);
			SAMPLER(samplerTVE_ExtrasTex_Objects);
			TEXTURE2D(TVE_ExtrasTex_User);
			SAMPLER(samplerTVE_ExtrasTex_User);
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

				half3 _Vector1 = half3(0,0,0);
				half3 Mesh_PivotsOS2291_g31428 = _Vector1;
				float3 temp_output_2283_0_g31428 = ( v.vertex.xyz - Mesh_PivotsOS2291_g31428 );
				half3 VertexPos40_g32728 = temp_output_2283_0_g31428;
				float3 appendResult74_g32728 = (float3(0.0 , VertexPos40_g32728.y , 0.0));
				float3 VertexPosRotationAxis50_g32728 = appendResult74_g32728;
				float3 break84_g32728 = VertexPos40_g32728;
				float3 appendResult81_g32728 = (float3(break84_g32728.x , 0.0 , break84_g32728.z));
				float3 VertexPosOtherAxis82_g32728 = appendResult81_g32728;
				half MotionAmplitude203095_g31428 = _MotionAmplitude_20;
				float ObjectData20_g32813 = 3.14;
				float Bounds_Radius121_g31428 = _MaxBoundsInfo.x;
				float WorldData19_g32813 = Bounds_Radius121_g31428;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32813 = WorldData19_g32813;
				#else
				float staticSwitch14_g32813 = ObjectData20_g32813;
				#endif
				float Motion_Max_Rolling1137_g31428 = staticSwitch14_g32813;
				float4x4 break19_g32771 = GetObjectToWorldMatrix();
				float3 appendResult20_g32771 = (float3(break19_g32771[ 0 ][ 3 ] , break19_g32771[ 1 ][ 3 ] , break19_g32771[ 2 ][ 3 ]));
				half3 Off19_g32772 = appendResult20_g32771;
				float4 transform68_g32771 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g32771 = (float3(v.texcoord.z , v.ase_texcoord3.w , v.texcoord.w));
				float4 transform62_g32771 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g32771 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32771 = ( (transform68_g32771).xyz - (transform62_g32771).xyz );
				half3 On20_g32772 = ObjectPositionWithPivots28_g32771;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32772 = On20_g32772;
				#else
				float3 staticSwitch14_g32772 = Off19_g32772;
				#endif
				half3 ObjectData20_g32773 = staticSwitch14_g32772;
				half3 WorldData19_g32773 = Off19_g32772;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32773 = WorldData19_g32773;
				#else
				float3 staticSwitch14_g32773 = ObjectData20_g32773;
				#endif
				float3 temp_output_42_0_g32771 = staticSwitch14_g32773;
				half3 ObjectData20_g32776 = temp_output_42_0_g32771;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g32776 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32776 = WorldData19_g32776;
				#else
				float3 staticSwitch14_g32776 = ObjectData20_g32776;
				#endif
				float2 temp_output_39_38_g32769 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32776).xz ) );
				half4 Legacy33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, temp_output_39_38_g32769, 0.0 );
				half4 Vegetation33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Vegetation, samplerTVE_MotionTex_Vegetation, temp_output_39_38_g32769, 0.0 );
				half4 Grass33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Grass, samplerTVE_MotionTex_Grass, temp_output_39_38_g32769, 0.0 );
				half4 Objects33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Objects, samplerTVE_MotionTex_Objects, temp_output_39_38_g32769, 0.0 );
				half4 Custom33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_User, samplerTVE_MotionTex_User, temp_output_39_38_g32769, 0.0 );
				half4 localUSE_BUFFERS33_g32777 = USE_BUFFERS( Legacy33_g32777 , Vegetation33_g32777 , Grass33_g32777 , Objects33_g32777 , Custom33_g32777 );
				float4 break322_g32778 = localUSE_BUFFERS33_g32777;
				half Wind_Power369_g32778 = saturate( ( (break322_g32778.z*2.0 + -1.0) + TVE_WindPower ) );
				float lerpResult376_g32778 = lerp( 0.1 , 1.0 , Wind_Power369_g32778);
				half Wind_Power_203109_g31428 = lerpResult376_g32778;
				half Mesh_Motion_260_g31428 = v.ase_texcoord3.y;
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch160_g32799 = TVE_NoiseSpeed_Grass;
				#else
				float2 staticSwitch160_g32799 = TVE_NoiseSpeed_Vegetation;
				#endif
				float4x4 break19_g32801 = GetObjectToWorldMatrix();
				float3 appendResult20_g32801 = (float3(break19_g32801[ 0 ][ 3 ] , break19_g32801[ 1 ][ 3 ] , break19_g32801[ 2 ][ 3 ]));
				half3 Off19_g32802 = appendResult20_g32801;
				float4 transform68_g32801 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32801 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
				float4 transform62_g32801 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32801 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32801 = ( (transform68_g32801).xyz - (transform62_g32801).xyz );
				half3 On20_g32802 = ObjectPositionWithPivots28_g32801;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32802 = On20_g32802;
				#else
				float3 staticSwitch14_g32802 = Off19_g32802;
				#endif
				half3 ObjectData20_g32803 = staticSwitch14_g32802;
				half3 WorldData19_g32803 = Off19_g32802;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32803 = WorldData19_g32803;
				#else
				float3 staticSwitch14_g32803 = ObjectData20_g32803;
				#endif
				float3 temp_output_42_0_g32801 = staticSwitch14_g32803;
				half3 ObjectData20_g32800 = temp_output_42_0_g32801;
				half3 WorldData19_g32800 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32800 = WorldData19_g32800;
				#else
				float3 staticSwitch14_g32800 = ObjectData20_g32800;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch164_g32799 = (ase_worldPos).xz;
				#else
				float2 staticSwitch164_g32799 = (staticSwitch14_g32800).xz;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float staticSwitch161_g32799 = TVE_NoiseSize_Grass;
				#else
				float staticSwitch161_g32799 = TVE_NoiseSize_Vegetation;
				#endif
				float2 panner73_g32799 = ( _TimeParameters.x * staticSwitch160_g32799 + ( staticSwitch164_g32799 * staticSwitch161_g32799 ));
				float4 tex2DNode75_g32799 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g32799, 0.0 );
				float4 saferPower77_g32799 = max( abs( tex2DNode75_g32799 ) , 0.0001 );
				float4 temp_cast_7 = (TVE_NoiseContrast).xxxx;
				float4 break142_g32799 = pow( saferPower77_g32799 , temp_cast_7 );
				half Global_NoiseTex_R34_g31428 = break142_g32799.r;
				half Motion_Use20162_g31428 = _Motion_20;
				float4x4 break19_g32763 = GetObjectToWorldMatrix();
				float3 appendResult20_g32763 = (float3(break19_g32763[ 0 ][ 3 ] , break19_g32763[ 1 ][ 3 ] , break19_g32763[ 2 ][ 3 ]));
				half3 Off19_g32764 = appendResult20_g32763;
				float4 transform68_g32763 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32763 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
				float4 transform62_g32763 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32763 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32763 = ( (transform68_g32763).xyz - (transform62_g32763).xyz );
				half3 On20_g32764 = ObjectPositionWithPivots28_g32763;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32764 = On20_g32764;
				#else
				float3 staticSwitch14_g32764 = Off19_g32764;
				#endif
				half3 ObjectData20_g32765 = staticSwitch14_g32764;
				half3 WorldData19_g32765 = Off19_g32764;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32765 = WorldData19_g32765;
				#else
				float3 staticSwitch14_g32765 = ObjectData20_g32765;
				#endif
				float3 temp_output_42_0_g32763 = staticSwitch14_g32765;
				float3 break9_g32763 = temp_output_42_0_g32763;
				half Variation_Complex102_g32760 = frac( ( v.ase_color.r + ( break9_g32763.x + break9_g32763.z ) ) );
				float ObjectData20_g32762 = Variation_Complex102_g32760;
				half Variation_Simple105_g32760 = v.ase_color.r;
				float WorldData19_g32762 = Variation_Simple105_g32760;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32762 = WorldData19_g32762;
				#else
				float staticSwitch14_g32762 = ObjectData20_g32762;
				#endif
				half Variation3073_g31428 = staticSwitch14_g32762;
				float temp_output_116_0_g32733 = Variation3073_g31428;
				float mulTime98_g32733 = _TimeParameters.x * 0.5;
				float lerpResult110_g32733 = lerp( ( ceil( saturate( ( frac( ( temp_output_116_0_g32733 + 0.3576 ) ) - 0.5 ) ) ) * 0.5 ) , ceil( saturate( ( frac( ( temp_output_116_0_g32733 + 0.1258 ) ) - 0.8 ) ) ) , (sin( mulTime98_g32733 )*0.5 + 0.5));
				half Wind_Power2223_g31428 = Wind_Power369_g32778;
				float lerpResult118_g32733 = lerp( 0.25 , 0.75 , Wind_Power2223_g31428);
				float lerpResult111_g32733 = lerp( lerpResult110_g32733 , 1.0 , ( lerpResult118_g32733 * lerpResult118_g32733 * lerpResult118_g32733 * lerpResult118_g32733 ));
				half Motion_Selective3182_g31428 = lerpResult111_g32733;
				half Input_Speed62_g32792 = _MotionSpeed_20;
				float mulTime354_g32792 = _TimeParameters.x * Input_Speed62_g32792;
				float temp_output_342_0_g32792 = ( ( _MotionVariation_20 * Variation3073_g31428 ) * v.ase_color.r );
				float4x4 break19_g32793 = GetObjectToWorldMatrix();
				float3 appendResult20_g32793 = (float3(break19_g32793[ 0 ][ 3 ] , break19_g32793[ 1 ][ 3 ] , break19_g32793[ 2 ][ 3 ]));
				half3 Off19_g32794 = appendResult20_g32793;
				float4 transform68_g32793 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32793 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
				float4 transform62_g32793 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32793 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32793 = ( (transform68_g32793).xyz - (transform62_g32793).xyz );
				half3 On20_g32794 = ObjectPositionWithPivots28_g32793;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32794 = On20_g32794;
				#else
				float3 staticSwitch14_g32794 = Off19_g32794;
				#endif
				half3 ObjectData20_g32795 = staticSwitch14_g32794;
				half3 WorldData19_g32795 = Off19_g32794;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32795 = WorldData19_g32795;
				#else
				float3 staticSwitch14_g32795 = ObjectData20_g32795;
				#endif
				float3 temp_output_42_0_g32793 = staticSwitch14_g32795;
				float3 break9_g32793 = temp_output_42_0_g32793;
				float ObjectData20_g32798 = ( temp_output_342_0_g32792 + ( break9_g32793.x + break9_g32793.z ) );
				float WorldData19_g32798 = temp_output_342_0_g32792;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32798 = WorldData19_g32798;
				#else
				float staticSwitch14_g32798 = ObjectData20_g32798;
				#endif
				float Motion_Variation284_g32792 = staticSwitch14_g32798;
				float Motion_Scale287_g32792 = ( _MotionScale_20 * ase_worldPos.x );
				half Motion_Rolling138_g31428 = ( ( MotionAmplitude203095_g31428 * Motion_Max_Rolling1137_g31428 ) * ( Wind_Power_203109_g31428 * Mesh_Motion_260_g31428 * Global_NoiseTex_R34_g31428 * Motion_Use20162_g31428 * Motion_Selective3182_g31428 ) * sin( ( mulTime354_g32792 + Motion_Variation284_g32792 + Motion_Scale287_g32792 ) ) );
				half Angle44_g32728 = Motion_Rolling138_g31428;
				half3 VertexPos40_g32740 = ( VertexPosRotationAxis50_g32728 + ( VertexPosOtherAxis82_g32728 * cos( Angle44_g32728 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g32728 ) * sin( Angle44_g32728 ) ) );
				float3 appendResult74_g32740 = (float3(VertexPos40_g32740.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g32740 = appendResult74_g32740;
				float3 break84_g32740 = VertexPos40_g32740;
				float3 appendResult81_g32740 = (float3(0.0 , break84_g32740.y , break84_g32740.z));
				half3 VertexPosOtherAxis82_g32740 = appendResult81_g32740;
				float ObjectData20_g32815 = 3.14;
				float Bounds_Height374_g31428 = _MaxBoundsInfo.y;
				float WorldData19_g32815 = ( Bounds_Height374_g31428 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32815 = WorldData19_g32815;
				#else
				float staticSwitch14_g32815 = ObjectData20_g32815;
				#endif
				float Motion_Max_Bending1133_g31428 = staticSwitch14_g32815;
				half Wind_Power_103106_g31428 = Wind_Power369_g32778;
				float3 appendResult323_g32778 = (float3(break322_g32778.x , 0.0 , break322_g32778.y));
				float3 temp_output_324_0_g32778 = (appendResult323_g32778*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g32778 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g32778 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g31428 = (temp_output_339_0_g32778).xz;
				half Motion_Use1056_g31428 = _Motion_10;
				half Input_Speed62_g32735 = _MotionSpeed_10;
				float mulTime373_g32735 = _TimeParameters.x * Input_Speed62_g32735;
				half Motion_Variation284_g32735 = ( _MotionVariation_10 * Variation3073_g31428 );
				float2 appendResult344_g32735 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g32735 = ( _MotionScale_10 * appendResult344_g32735 );
				half2 Sine_MinusOneToOne281_g32735 = sin( ( mulTime373_g32735 + Motion_Variation284_g32735 + Motion_Scale287_g32735 ) );
				float2 temp_cast_12 = (1.0).xx;
				half Input_Turbulence327_g32735 = Global_NoiseTex_R34_g31428;
				float2 lerpResult321_g32735 = lerp( Sine_MinusOneToOne281_g32735 , temp_cast_12 , Input_Turbulence327_g32735);
				half2 Motion_Bending2258_g31428 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g31428 ) * Wind_Power_103106_g31428 * Wind_DirectionOS39_g31428 * Motion_Use1056_g31428 * Global_NoiseTex_R34_g31428 * lerpResult321_g32735 );
				half Motion_UseInteraction2097_g31428 = _Motion_Interaction;
				half Motion_InteractionMask66_g31428 = break322_g32778.w;
				float lerpResult3307_g31428 = lerp( 1.0 , Variation3073_g31428 , _InteractionVariation);
				half2 Motion_Interaction53_g31428 = ( _InteractionAmplitude * Motion_Max_Bending1133_g31428 * Motion_UseInteraction2097_g31428 * Motion_InteractionMask66_g31428 * Motion_InteractionMask66_g31428 * Wind_DirectionOS39_g31428 * lerpResult3307_g31428 );
				float2 lerpResult109_g31428 = lerp( Motion_Bending2258_g31428 , Motion_Interaction53_g31428 , Motion_InteractionMask66_g31428);
				half Mesh_Motion_182_g31428 = v.ase_texcoord3.x;
				float2 break143_g31428 = ( lerpResult109_g31428 * Mesh_Motion_182_g31428 );
				half Motion_Z190_g31428 = break143_g31428.y;
				half Angle44_g32740 = Motion_Z190_g31428;
				half3 VertexPos40_g32723 = ( VertexPosRotationAxis50_g32740 + ( VertexPosOtherAxis82_g32740 * cos( Angle44_g32740 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g32740 ) * sin( Angle44_g32740 ) ) );
				float3 appendResult74_g32723 = (float3(0.0 , 0.0 , VertexPos40_g32723.z));
				half3 VertexPosRotationAxis50_g32723 = appendResult74_g32723;
				float3 break84_g32723 = VertexPos40_g32723;
				float3 appendResult81_g32723 = (float3(break84_g32723.x , break84_g32723.y , 0.0));
				half3 VertexPosOtherAxis82_g32723 = appendResult81_g32723;
				half Motion_X216_g31428 = break143_g31428.x;
				half Angle44_g32723 = -Motion_X216_g31428;
				half Wind_Mode3167_g31428 = TVE_WindMode;
				float3 lerpResult3168_g31428 = lerp( v.vertex.xyz , ( VertexPosRotationAxis50_g32723 + ( VertexPosOtherAxis82_g32723 * cos( Angle44_g32723 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g32723 ) * sin( Angle44_g32723 ) ) ) , Wind_Mode3167_g31428);
				float3 Vertex_Motion_Object833_g31428 = lerpResult3168_g31428;
				float3 temp_output_3474_0_g31428 = ( v.vertex.xyz - Mesh_PivotsOS2291_g31428 );
				float3 appendResult2047_g31428 = (float3(Motion_Rolling138_g31428 , 0.0 , -Motion_Rolling138_g31428));
				float3 appendResult2043_g31428 = (float3(Motion_X216_g31428 , 0.0 , Motion_Z190_g31428));
				float3 lerpResult3173_g31428 = lerp( v.vertex.xyz , ( ( temp_output_3474_0_g31428 + appendResult2047_g31428 ) + appendResult2043_g31428 ) , Wind_Mode3167_g31428);
				float3 Vertex_Motion_World1118_g31428 = lerpResult3173_g31428;
				float3 temp_output_3331_0_g31428 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g31428 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g31428 = Vertex_Motion_Object833_g31428;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g31428 = temp_output_3331_0_g31428;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g31428 = temp_output_3331_0_g31428;
				#else
				float3 staticSwitch3312_g31428 = Vertex_Motion_Object833_g31428;
				#endif
				half3 ObjectData20_g32782 = staticSwitch3312_g31428;
				half3 WorldData19_g32782 = Vertex_Motion_World1118_g31428;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32782 = WorldData19_g32782;
				#else
				float3 staticSwitch14_g32782 = ObjectData20_g32782;
				#endif
				float4x4 break19_g32806 = GetObjectToWorldMatrix();
				float3 appendResult20_g32806 = (float3(break19_g32806[ 0 ][ 3 ] , break19_g32806[ 1 ][ 3 ] , break19_g32806[ 2 ][ 3 ]));
				half3 Off19_g32807 = appendResult20_g32806;
				float4 transform68_g32806 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g32806 = (float3(v.texcoord.z , v.ase_texcoord3.w , v.texcoord.w));
				float4 transform62_g32806 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g32806 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32806 = ( (transform68_g32806).xyz - (transform62_g32806).xyz );
				half3 On20_g32807 = ObjectPositionWithPivots28_g32806;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32807 = On20_g32807;
				#else
				float3 staticSwitch14_g32807 = Off19_g32807;
				#endif
				half3 ObjectData20_g32808 = staticSwitch14_g32807;
				half3 WorldData19_g32808 = Off19_g32807;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32808 = WorldData19_g32808;
				#else
				float3 staticSwitch14_g32808 = ObjectData20_g32808;
				#endif
				float3 temp_output_42_0_g32806 = staticSwitch14_g32808;
				float temp_output_7_0_g32727 = TVE_SizeFadeEnd;
				float ObjectData20_g32780 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g32806 ) * _GlobalSizeFade ) - temp_output_7_0_g32727 ) / ( TVE_SizeFadeStart - temp_output_7_0_g32727 ) ) );
				float WorldData19_g32780 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32780 = WorldData19_g32780;
				#else
				float staticSwitch14_g32780 = ObjectData20_g32780;
				#endif
				float Vertex_SizeFade1740_g31428 = staticSwitch14_g32780;
				float4x4 break19_g32749 = GetObjectToWorldMatrix();
				float3 appendResult20_g32749 = (float3(break19_g32749[ 0 ][ 3 ] , break19_g32749[ 1 ][ 3 ] , break19_g32749[ 2 ][ 3 ]));
				half3 Off19_g32750 = appendResult20_g32749;
				float4 transform68_g32749 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32749 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
				float4 transform62_g32749 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32749 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32749 = ( (transform68_g32749).xyz - (transform62_g32749).xyz );
				half3 On20_g32750 = ObjectPositionWithPivots28_g32749;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32750 = On20_g32750;
				#else
				float3 staticSwitch14_g32750 = Off19_g32750;
				#endif
				half3 ObjectData20_g32751 = staticSwitch14_g32750;
				half3 WorldData19_g32751 = Off19_g32750;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32751 = WorldData19_g32751;
				#else
				float3 staticSwitch14_g32751 = ObjectData20_g32751;
				#endif
				float3 temp_output_42_0_g32749 = staticSwitch14_g32751;
				half3 ObjectData20_g32748 = temp_output_42_0_g32749;
				half3 WorldData19_g32748 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32748 = WorldData19_g32748;
				#else
				float3 staticSwitch14_g32748 = ObjectData20_g32748;
				#endif
				float2 temp_output_43_38_g32746 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32748).xz ) );
				half4 Legacy33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g32746, 0.0 );
				half4 Vegetation33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g32746, 0.0 );
				half4 Grass33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g32746, 0.0 );
				half4 Objects33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g32746, 0.0 );
				half4 Custom33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g32746, 0.0 );
				half4 localUSE_BUFFERS33_g32747 = USE_BUFFERS( Legacy33_g32747 , Vegetation33_g32747 , Grass33_g32747 , Objects33_g32747 , Custom33_g32747 );
				float4 break49_g32746 = localUSE_BUFFERS33_g32747;
				half Global_ExtrasTex_G305_g31428 = break49_g32746.y;
				float lerpResult346_g31428 = lerp( 1.0 , Global_ExtrasTex_G305_g31428 , _GlobalSize);
				float ObjectData20_g32781 = ( lerpResult346_g31428 * _LocalSize );
				float WorldData19_g32781 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32781 = WorldData19_g32781;
				#else
				float staticSwitch14_g32781 = ObjectData20_g32781;
				#endif
				half Vertex_Size1741_g31428 = staticSwitch14_g32781;
				half3 Grass_Coverage2661_g31428 = half3(0,0,0);
				float3 Final_VertexPosition890_g31428 = ( ( staticSwitch14_g32782 * Vertex_SizeFade1740_g31428 * Vertex_Size1741_g31428 ) + Mesh_PivotsOS2291_g31428 + Grass_Coverage2661_g31428 );
				
				o.ase_texcoord7 = v.texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord8 = v.vertex;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g31428;
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
				float4 ase_texcoord3 : TEXCOORD3;
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
				o.texcoord = v.texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

				half2 Main_UVs15_g31428 = ( ( IN.ase_texcoord7.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g31428 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g31428 );
				float4 temp_output_51_0_g31428 = ( _MainColor * tex2DNode29_g31428 );
				half3 Main_AlbedoRaw99_g31428 = (temp_output_51_0_g31428).rgb;
				half3 Main_AlbedoTinted2808_g31428 = ( float3(1,1,1) * float3(1,1,1) * Main_AlbedoRaw99_g31428 * float3(1,1,1) );
				half3 Main_AlbedoColored863_g31428 = Main_AlbedoTinted2808_g31428;
				float2 appendResult21_g32730 = (float2(IN.ase_texcoord7.z , IN.ase_texcoord7.w));
				float2 Mesh_DetailCoord3_g31428 = appendResult21_g32730;
				half2 Second_UVs17_g31428 = ( ( Mesh_DetailCoord3_g31428 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				float4 tex2DNode3380_g31428 = SAMPLE_TEXTURE2D( _SecondPackedTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				half Packed_Albedo3385_g31428 = tex2DNode3380_g31428.r;
				float4 temp_cast_0 = (Packed_Albedo3385_g31428).xxxx;
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float4 staticSwitch3449_g31428 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float4 staticSwitch3449_g31428 = temp_cast_0;
				#else
				float4 staticSwitch3449_g31428 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				#endif
				half3 Second_Albedo153_g31428 = (( _SecondColor * staticSwitch3449_g31428 )).rgb;
				half3 Second_AlbedoColored1963_g31428 = Second_Albedo153_g31428;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g32741 = 2.0;
				#else
				float staticSwitch1_g32741 = 4.594794;
				#endif
				half Mesh_DetailMask90_g31428 = IN.ase_color.b;
				float temp_output_989_0_g31428 = ( ( Mesh_DetailMask90_g31428 - 0.5 ) + _DetailMeshValue );
				half Blend_Source1540_g31428 = temp_output_989_0_g31428;
				float4 tex2DNode35_g31428 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g31428 );
				half Main_Mask_Raw57_g31428 = tex2DNode35_g31428.b;
				float4 tex2DNode33_g31428 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				half Second_Mask81_g31428 = tex2DNode33_g31428.b;
				float lerpResult1327_g31428 = lerp( Main_Mask_Raw57_g31428 , Second_Mask81_g31428 , _DetailMaskMode);
				float temp_output_7_0_g32739 = _DetailMaskContrast;
				float temp_output_973_0_g31428 = saturate( ( ( saturate( ( Blend_Source1540_g31428 + ( Blend_Source1540_g31428 * ( ( ( 1.0 - lerpResult1327_g31428 ) - 0.5 ) + _DetailMaskValue ) ) ) ) - temp_output_7_0_g32739 ) / ( ( 1.0 - _DetailMaskContrast ) - temp_output_7_0_g32739 ) ) );
				half Mask_Detail147_g31428 = temp_output_973_0_g31428;
				float3 lerpResult235_g31428 = lerp( Main_AlbedoColored863_g31428 , ( Main_AlbedoColored863_g31428 * Second_AlbedoColored1963_g31428 * staticSwitch1_g32741 ) , Mask_Detail147_g31428);
				float3 lerpResult208_g31428 = lerp( Main_AlbedoColored863_g31428 , Second_AlbedoColored1963_g31428 , Mask_Detail147_g31428);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch255_g31428 = Main_AlbedoColored863_g31428;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch255_g31428 = lerpResult235_g31428;
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch255_g31428 = lerpResult208_g31428;
				#else
				float3 staticSwitch255_g31428 = Main_AlbedoColored863_g31428;
				#endif
				half3 Blend_Albedo265_g31428 = staticSwitch255_g31428;
				half3 Blend_AlbedoAndSubsurface149_g31428 = Blend_Albedo265_g31428;
				half3 Global_OverlayColor1758_g31428 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g31428 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g31428 );
				float2 appendResult88_g32731 = (float2(tex2DNode117_g31428.a , tex2DNode117_g31428.g));
				float2 temp_output_90_0_g32731 = ( (appendResult88_g32731*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g32731 = (float3(temp_output_90_0_g32731 , 1.0));
				half3 Main_Normal137_g31428 = appendResult91_g32731;
				float4 tex2DNode145_g31428 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				float2 appendResult88_g32757 = (float2(tex2DNode145_g31428.a , tex2DNode145_g31428.g));
				float2 temp_output_90_0_g32757 = ( (appendResult88_g32757*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32757 = (float3(temp_output_90_0_g32757 , 1.0));
				half Packed_NormalX3387_g31428 = tex2DNode3380_g31428.a;
				half Packed_NormalY3386_g31428 = tex2DNode3380_g31428.g;
				float2 appendResult88_g32734 = (float2(Packed_NormalX3387_g31428 , Packed_NormalY3386_g31428));
				float2 temp_output_90_0_g32734 = ( (appendResult88_g32734*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32734 = (float3(temp_output_90_0_g32734 , 1.0));
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float3 staticSwitch3450_g31428 = appendResult91_g32757;
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float3 staticSwitch3450_g31428 = appendResult91_g32734;
				#else
				float3 staticSwitch3450_g31428 = appendResult91_g32757;
				#endif
				half3 Second_Normal179_g31428 = staticSwitch3450_g31428;
				float3 lerpResult230_g31428 = lerp( float3( 0,0,1 ) , Second_Normal179_g31428 , Mask_Detail147_g31428);
				float3 lerpResult3372_g31428 = lerp( float3( 0,0,1 ) , Main_Normal137_g31428 , _DetailNormalValue);
				float3 lerpResult3376_g31428 = lerp( Main_Normal137_g31428 , BlendNormal( lerpResult3372_g31428 , Second_Normal179_g31428 ) , Mask_Detail147_g31428);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch267_g31428 = Main_Normal137_g31428;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch267_g31428 = BlendNormal( Main_Normal137_g31428 , lerpResult230_g31428 );
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch267_g31428 = lerpResult3376_g31428;
				#else
				float3 staticSwitch267_g31428 = Main_Normal137_g31428;
				#endif
				half3 Blend_NormalRaw1051_g31428 = staticSwitch267_g31428;
				float3 switchResult1063_g31428 = (((ase_vface>0)?(Blend_NormalRaw1051_g31428):(( Blend_NormalRaw1051_g31428 * float3(-1,-1,-1) ))));
				half Overlay_Contrast1405_g31428 = _OverlayContrastValue;
				float3 appendResult1439_g31428 = (float3(Overlay_Contrast1405_g31428 , Overlay_Contrast1405_g31428 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal178_g31428 = ( switchResult1063_g31428 * appendResult1439_g31428 );
				float3 worldNormal178_g31428 = float3(dot(tanToWorld0,tanNormal178_g31428), dot(tanToWorld1,tanNormal178_g31428), dot(tanToWorld2,tanNormal178_g31428));
				half Global_OverlayIntensity154_g31428 = TVE_OverlayIntensity;
				float4x4 break19_g32749 = GetObjectToWorldMatrix();
				float3 appendResult20_g32749 = (float3(break19_g32749[ 0 ][ 3 ] , break19_g32749[ 1 ][ 3 ] , break19_g32749[ 2 ][ 3 ]));
				half3 Off19_g32750 = appendResult20_g32749;
				float4 transform68_g32749 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord8);
				float3 appendResult95_g32749 = (float3(IN.ase_texcoord7.z , 0.0 , IN.ase_texcoord7.w));
				float4 transform62_g32749 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord8.xyz - ( appendResult95_g32749 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32749 = ( (transform68_g32749).xyz - (transform62_g32749).xyz );
				half3 On20_g32750 = ObjectPositionWithPivots28_g32749;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32750 = On20_g32750;
				#else
				float3 staticSwitch14_g32750 = Off19_g32750;
				#endif
				half3 ObjectData20_g32751 = staticSwitch14_g32750;
				half3 WorldData19_g32751 = Off19_g32750;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32751 = WorldData19_g32751;
				#else
				float3 staticSwitch14_g32751 = ObjectData20_g32751;
				#endif
				float3 temp_output_42_0_g32749 = staticSwitch14_g32751;
				half3 ObjectData20_g32748 = temp_output_42_0_g32749;
				half3 WorldData19_g32748 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32748 = WorldData19_g32748;
				#else
				float3 staticSwitch14_g32748 = ObjectData20_g32748;
				#endif
				float2 temp_output_43_38_g32746 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32748).xz ) );
				half4 Legacy33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g32746 );
				half4 Vegetation33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g32746 );
				half4 Grass33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g32746 );
				half4 Objects33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g32746 );
				half4 Custom33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g32746 );
				half4 localUSE_BUFFERS33_g32747 = USE_BUFFERS( Legacy33_g32747 , Vegetation33_g32747 , Grass33_g32747 , Objects33_g32747 , Custom33_g32747 );
				float4 break49_g32746 = localUSE_BUFFERS33_g32747;
				half Global_ExtrasTex_B156_g31428 = break49_g32746.z;
				float temp_output_1025_0_g31428 = ( Global_OverlayIntensity154_g31428 * _GlobalOverlay * Global_ExtrasTex_B156_g31428 );
				half Overlay_Commons1365_g31428 = temp_output_1025_0_g31428;
				half Overlay_Mask269_g31428 = saturate( ( saturate( worldNormal178_g31428.y ) - ( 1.0 - Overlay_Commons1365_g31428 ) ) );
				float3 lerpResult336_g31428 = lerp( Blend_AlbedoAndSubsurface149_g31428 , Global_OverlayColor1758_g31428 , Overlay_Mask269_g31428);
				half3 Final_Albedo359_g31428 = lerpResult336_g31428;
				half Main_Alpha316_g31428 = (temp_output_51_0_g31428).a;
				float lerpResult354_g31428 = lerp( 1.0 , Main_Alpha316_g31428 , _render_premul);
				half Final_Premultiply355_g31428 = lerpResult354_g31428;
				float3 temp_output_410_0_g31428 = ( Final_Albedo359_g31428 * Final_Premultiply355_g31428 );
				float3 temp_cast_7 = (1.0).xxx;
				half Mesh_Occlusion318_g31428 = IN.ase_color.g;
				float saferPower1201_g31428 = max( Mesh_Occlusion318_g31428 , 0.0001 );
				float3 lerpResult2945_g31428 = lerp( (_VertexOcclusionColor).rgb , temp_cast_7 , saturate( pow( saferPower1201_g31428 , ( _VertexOcclusionValue + _OcclusionCat ) ) ));
				half3 Vertex_Occlusion648_g31428 = lerpResult2945_g31428;
				
				float3 temp_output_13_0_g32745 = staticSwitch267_g31428;
				float3 switchResult12_g32745 = (((ase_vface>0)?(temp_output_13_0_g32745):(( temp_output_13_0_g32745 * _render_normals_options ))));
				half3 Blend_Normal312_g31428 = switchResult12_g32745;
				half3 Final_Normal366_g31428 = Blend_Normal312_g31428;
				
				half Main_Metallic237_g31428 = ( tex2DNode35_g31428.r * _MainMetallicValue );
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float staticSwitch3451_g31428 = ( tex2DNode33_g31428.r * _SecondMetallicValue );
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float staticSwitch3451_g31428 = 0.0;
				#else
				float staticSwitch3451_g31428 = ( tex2DNode33_g31428.r * _SecondMetallicValue );
				#endif
				half Second_Metallic226_g31428 = staticSwitch3451_g31428;
				float lerpResult278_g31428 = lerp( Main_Metallic237_g31428 , Second_Metallic226_g31428 , Mask_Detail147_g31428);
				#if defined(TVE_DETAIL_MODE_OFF)
				float staticSwitch299_g31428 = Main_Metallic237_g31428;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float staticSwitch299_g31428 = Main_Metallic237_g31428;
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float staticSwitch299_g31428 = lerpResult278_g31428;
				#else
				float staticSwitch299_g31428 = Main_Metallic237_g31428;
				#endif
				half Blend_Metallic306_g31428 = staticSwitch299_g31428;
				float lerpResult342_g31428 = lerp( Blend_Metallic306_g31428 , 0.0 , Overlay_Mask269_g31428);
				half Final_Metallic367_g31428 = lerpResult342_g31428;
				
				half Main_Smoothness227_g31428 = ( tex2DNode35_g31428.a * _MainSmoothnessValue );
				half Packed_Smoothness3388_g31428 = tex2DNode3380_g31428.b;
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float staticSwitch3456_g31428 = tex2DNode33_g31428.a;
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float staticSwitch3456_g31428 = Packed_Smoothness3388_g31428;
				#else
				float staticSwitch3456_g31428 = tex2DNode33_g31428.a;
				#endif
				half Second_Smoothness236_g31428 = ( staticSwitch3456_g31428 * _SecondSmoothnessValue );
				float lerpResult266_g31428 = lerp( Main_Smoothness227_g31428 , Second_Smoothness236_g31428 , Mask_Detail147_g31428);
				#if defined(TVE_DETAIL_MODE_OFF)
				float staticSwitch297_g31428 = Main_Smoothness227_g31428;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float staticSwitch297_g31428 = Main_Smoothness227_g31428;
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float staticSwitch297_g31428 = lerpResult266_g31428;
				#else
				float staticSwitch297_g31428 = Main_Smoothness227_g31428;
				#endif
				half Blend_Smoothness314_g31428 = staticSwitch297_g31428;
				half Global_OverlaySmoothness311_g31428 = TVE_OverlaySmoothness;
				float lerpResult343_g31428 = lerp( Blend_Smoothness314_g31428 , Global_OverlaySmoothness311_g31428 , Overlay_Mask269_g31428);
				half Final_Smoothness371_g31428 = lerpResult343_g31428;
				half Global_Wetness1016_g31428 = ( TVE_Wetness * _GlobalWetness );
				half Global_ExtrasTex_A1033_g31428 = break49_g32746.w;
				float lerpResult1037_g31428 = lerp( Final_Smoothness371_g31428 , saturate( ( Final_Smoothness371_g31428 + Global_Wetness1016_g31428 ) ) , Global_ExtrasTex_A1033_g31428);
				
				float lerpResult240_g31428 = lerp( 1.0 , tex2DNode35_g31428.g , _MainOcclusionValue);
				half Main_Occlusion247_g31428 = lerpResult240_g31428;
				float lerpResult239_g31428 = lerp( 1.0 , tex2DNode33_g31428.g , _SecondOcclusionValue);
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float staticSwitch3455_g31428 = lerpResult239_g31428;
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float staticSwitch3455_g31428 = 1.0;
				#else
				float staticSwitch3455_g31428 = lerpResult239_g31428;
				#endif
				half Second_Occlusion251_g31428 = staticSwitch3455_g31428;
				float lerpResult294_g31428 = lerp( Main_Occlusion247_g31428 , Second_Occlusion251_g31428 , Mask_Detail147_g31428);
				#if defined(TVE_DETAIL_MODE_OFF)
				float staticSwitch310_g31428 = Main_Occlusion247_g31428;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float staticSwitch310_g31428 = ( Main_Occlusion247_g31428 * Second_Occlusion251_g31428 );
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float staticSwitch310_g31428 = lerpResult294_g31428;
				#else
				float staticSwitch310_g31428 = Main_Occlusion247_g31428;
				#endif
				half Blend_Occlusion323_g31428 = staticSwitch310_g31428;
				
				float localCustomAlphaClip9_g32759 = ( 0.0 );
				half Main_AlphaRaw1203_g31428 = tex2DNode29_g31428.a;
				half Alpha5_g32759 = Main_AlphaRaw1203_g31428;
				float Alpha9_g32759 = Alpha5_g32759;
				#if _ALPHATEST_ON
				clip(Alpha9_g32759 - _Cutoff);
				#endif
				half Final_Clip914_g31428 = localCustomAlphaClip9_g32759;
				
				float3 Albedo = ( temp_output_410_0_g31428 * Vertex_Occlusion648_g31428 );
				float3 Normal = Final_Normal366_g31428;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = Final_Metallic367_g31428;
				float Smoothness = lerpResult1037_g31428;
				float Occlusion = Blend_Occlusion323_g31428;
				float Alpha = Main_Alpha316_g31428;
				float AlphaClipThreshold = Final_Clip914_g31428;
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
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _ALPHATEST_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#define TVE_IS_VEGETATION_SHADER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _Color;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			half3 _render_normals_options;
			half _VertexMotionSpace;
			half _VertexCat;
			half _InteractionVariation;
			half _Motion_Interaction;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _Motion_10;
			half _VertexMotionMode;
			half _MotionAmplitude_10;
			float _MotionScale_20;
			half _MotionVariation_20;
			float _MotionSpeed_20;
			half _Motion_20;
			half _vertex_pivot_mode;
			half _MotionAmplitude_20;
			half _render_cutoff;
			half _IsBarkShader;
			float _MotionSpeed_10;
			half _VertexDataMode;
			half _IsLitShader;
			half _GlobalSize;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			half _OcclusionCat;
			half _VertexOcclusionValue;
			half _render_premul;
			half _GlobalSizeFade;
			half _GlobalOverlay;
			half _DetailNormalValue;
			half _SecondNormalValue;
			half _DetailMaskContrast;
			half _DetailMaskValue;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _IsStandardShader;
			half _LocalSize;
			half _OverlayContrastValue;
			half _IsAnyPathShader;
			half _render_cull;
			half _render_dst;
			half _DetailTypeMode;
			half _AdvancedCat;
			half _DetailCat;
			half _RenderZWrite;
			half _RenderBlend;
			half _RenderNormals;
			half _RenderCull;
			half _MainCat;
			half _DetailMode;
			half _PivotsMessage;
			half _DetailMapsMode;
			half _RenderMode;
			half _VertexVariationMode;
			half _RenderPriority;
			half _IsVersion;
			half _IsTVEShader;
			half _RenderingCat;
			half _Cutoff;
			half _RenderClip;
			half _MainNormalValue;
			half _GlobalCat;
			half _DetailSpace;
			half _GlobalSpace;
			float _render_normals;
			half _MainOcclusionValue;
			half _Banner;
			half _render_zw;
			float _OverlayContrast;
			half _BatchingMessage;
			half _ObjectDataMessage;
			half _WorldDataMessage;
			half _MaskMode;
			float _GrassPerspectivePushValue;
			float _material_batching;
			float _ObjectSmoothnessValue;
			float _OverlayVariation;
			float _GrassPerspectiveAngleValue;
			float _ObjectMetallicValue;
			float _GrassPerspectiveNoiseValue;
			float _ObjectOcclusionValue;
			float _render_priority;
			float _render_mode;
			float _SubsurfaceMinValue;
			float _SubsurfaceMaxValue;
			float _render_blend;
			half _render_src;
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
			TEXTURE2D(TVE_MotionTex);
			half4 TVE_VolumeCoord;
			SAMPLER(samplerTVE_MotionTex);
			TEXTURE2D(TVE_MotionTex_Vegetation);
			SAMPLER(samplerTVE_MotionTex_Vegetation);
			TEXTURE2D(TVE_MotionTex_Grass);
			SAMPLER(samplerTVE_MotionTex_Grass);
			TEXTURE2D(TVE_MotionTex_Objects);
			SAMPLER(samplerTVE_MotionTex_Objects);
			TEXTURE2D(TVE_MotionTex_User);
			SAMPLER(samplerTVE_MotionTex_User);
			half TVE_WindPower;
			TEXTURE2D(TVE_NoiseTex);
			float2 TVE_NoiseSpeed_Vegetation;
			float2 TVE_NoiseSpeed_Grass;
			half TVE_NoiseSize_Vegetation;
			half TVE_NoiseSize_Grass;
			SAMPLER(samplerTVE_NoiseTex);
			half TVE_NoiseContrast;
			half TVE_WindMode;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			TEXTURE2D(TVE_ExtrasTex);
			SAMPLER(samplerTVE_ExtrasTex);
			TEXTURE2D(TVE_ExtrasTex_Vegetation);
			SAMPLER(samplerTVE_ExtrasTex_Vegetation);
			TEXTURE2D(TVE_ExtrasTex_Grass);
			SAMPLER(samplerTVE_ExtrasTex_Grass);
			TEXTURE2D(TVE_ExtrasTex_Objects);
			SAMPLER(samplerTVE_ExtrasTex_Objects);
			TEXTURE2D(TVE_ExtrasTex_User);
			SAMPLER(samplerTVE_ExtrasTex_User);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);


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
			

			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				half3 _Vector1 = half3(0,0,0);
				half3 Mesh_PivotsOS2291_g31428 = _Vector1;
				float3 temp_output_2283_0_g31428 = ( v.vertex.xyz - Mesh_PivotsOS2291_g31428 );
				half3 VertexPos40_g32728 = temp_output_2283_0_g31428;
				float3 appendResult74_g32728 = (float3(0.0 , VertexPos40_g32728.y , 0.0));
				float3 VertexPosRotationAxis50_g32728 = appendResult74_g32728;
				float3 break84_g32728 = VertexPos40_g32728;
				float3 appendResult81_g32728 = (float3(break84_g32728.x , 0.0 , break84_g32728.z));
				float3 VertexPosOtherAxis82_g32728 = appendResult81_g32728;
				half MotionAmplitude203095_g31428 = _MotionAmplitude_20;
				float ObjectData20_g32813 = 3.14;
				float Bounds_Radius121_g31428 = _MaxBoundsInfo.x;
				float WorldData19_g32813 = Bounds_Radius121_g31428;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32813 = WorldData19_g32813;
				#else
				float staticSwitch14_g32813 = ObjectData20_g32813;
				#endif
				float Motion_Max_Rolling1137_g31428 = staticSwitch14_g32813;
				float4x4 break19_g32771 = GetObjectToWorldMatrix();
				float3 appendResult20_g32771 = (float3(break19_g32771[ 0 ][ 3 ] , break19_g32771[ 1 ][ 3 ] , break19_g32771[ 2 ][ 3 ]));
				half3 Off19_g32772 = appendResult20_g32771;
				float4 transform68_g32771 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g32771 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g32771 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g32771 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32771 = ( (transform68_g32771).xyz - (transform62_g32771).xyz );
				half3 On20_g32772 = ObjectPositionWithPivots28_g32771;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32772 = On20_g32772;
				#else
				float3 staticSwitch14_g32772 = Off19_g32772;
				#endif
				half3 ObjectData20_g32773 = staticSwitch14_g32772;
				half3 WorldData19_g32773 = Off19_g32772;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32773 = WorldData19_g32773;
				#else
				float3 staticSwitch14_g32773 = ObjectData20_g32773;
				#endif
				float3 temp_output_42_0_g32771 = staticSwitch14_g32773;
				half3 ObjectData20_g32776 = temp_output_42_0_g32771;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g32776 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32776 = WorldData19_g32776;
				#else
				float3 staticSwitch14_g32776 = ObjectData20_g32776;
				#endif
				float2 temp_output_39_38_g32769 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32776).xz ) );
				half4 Legacy33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, temp_output_39_38_g32769, 0.0 );
				half4 Vegetation33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Vegetation, samplerTVE_MotionTex_Vegetation, temp_output_39_38_g32769, 0.0 );
				half4 Grass33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Grass, samplerTVE_MotionTex_Grass, temp_output_39_38_g32769, 0.0 );
				half4 Objects33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Objects, samplerTVE_MotionTex_Objects, temp_output_39_38_g32769, 0.0 );
				half4 Custom33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_User, samplerTVE_MotionTex_User, temp_output_39_38_g32769, 0.0 );
				half4 localUSE_BUFFERS33_g32777 = USE_BUFFERS( Legacy33_g32777 , Vegetation33_g32777 , Grass33_g32777 , Objects33_g32777 , Custom33_g32777 );
				float4 break322_g32778 = localUSE_BUFFERS33_g32777;
				half Wind_Power369_g32778 = saturate( ( (break322_g32778.z*2.0 + -1.0) + TVE_WindPower ) );
				float lerpResult376_g32778 = lerp( 0.1 , 1.0 , Wind_Power369_g32778);
				half Wind_Power_203109_g31428 = lerpResult376_g32778;
				half Mesh_Motion_260_g31428 = v.ase_texcoord3.y;
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch160_g32799 = TVE_NoiseSpeed_Grass;
				#else
				float2 staticSwitch160_g32799 = TVE_NoiseSpeed_Vegetation;
				#endif
				float4x4 break19_g32801 = GetObjectToWorldMatrix();
				float3 appendResult20_g32801 = (float3(break19_g32801[ 0 ][ 3 ] , break19_g32801[ 1 ][ 3 ] , break19_g32801[ 2 ][ 3 ]));
				half3 Off19_g32802 = appendResult20_g32801;
				float4 transform68_g32801 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32801 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32801 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32801 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32801 = ( (transform68_g32801).xyz - (transform62_g32801).xyz );
				half3 On20_g32802 = ObjectPositionWithPivots28_g32801;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32802 = On20_g32802;
				#else
				float3 staticSwitch14_g32802 = Off19_g32802;
				#endif
				half3 ObjectData20_g32803 = staticSwitch14_g32802;
				half3 WorldData19_g32803 = Off19_g32802;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32803 = WorldData19_g32803;
				#else
				float3 staticSwitch14_g32803 = ObjectData20_g32803;
				#endif
				float3 temp_output_42_0_g32801 = staticSwitch14_g32803;
				half3 ObjectData20_g32800 = temp_output_42_0_g32801;
				half3 WorldData19_g32800 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32800 = WorldData19_g32800;
				#else
				float3 staticSwitch14_g32800 = ObjectData20_g32800;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch164_g32799 = (ase_worldPos).xz;
				#else
				float2 staticSwitch164_g32799 = (staticSwitch14_g32800).xz;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float staticSwitch161_g32799 = TVE_NoiseSize_Grass;
				#else
				float staticSwitch161_g32799 = TVE_NoiseSize_Vegetation;
				#endif
				float2 panner73_g32799 = ( _TimeParameters.x * staticSwitch160_g32799 + ( staticSwitch164_g32799 * staticSwitch161_g32799 ));
				float4 tex2DNode75_g32799 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g32799, 0.0 );
				float4 saferPower77_g32799 = max( abs( tex2DNode75_g32799 ) , 0.0001 );
				float4 temp_cast_7 = (TVE_NoiseContrast).xxxx;
				float4 break142_g32799 = pow( saferPower77_g32799 , temp_cast_7 );
				half Global_NoiseTex_R34_g31428 = break142_g32799.r;
				half Motion_Use20162_g31428 = _Motion_20;
				float4x4 break19_g32763 = GetObjectToWorldMatrix();
				float3 appendResult20_g32763 = (float3(break19_g32763[ 0 ][ 3 ] , break19_g32763[ 1 ][ 3 ] , break19_g32763[ 2 ][ 3 ]));
				half3 Off19_g32764 = appendResult20_g32763;
				float4 transform68_g32763 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32763 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32763 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32763 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32763 = ( (transform68_g32763).xyz - (transform62_g32763).xyz );
				half3 On20_g32764 = ObjectPositionWithPivots28_g32763;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32764 = On20_g32764;
				#else
				float3 staticSwitch14_g32764 = Off19_g32764;
				#endif
				half3 ObjectData20_g32765 = staticSwitch14_g32764;
				half3 WorldData19_g32765 = Off19_g32764;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32765 = WorldData19_g32765;
				#else
				float3 staticSwitch14_g32765 = ObjectData20_g32765;
				#endif
				float3 temp_output_42_0_g32763 = staticSwitch14_g32765;
				float3 break9_g32763 = temp_output_42_0_g32763;
				half Variation_Complex102_g32760 = frac( ( v.ase_color.r + ( break9_g32763.x + break9_g32763.z ) ) );
				float ObjectData20_g32762 = Variation_Complex102_g32760;
				half Variation_Simple105_g32760 = v.ase_color.r;
				float WorldData19_g32762 = Variation_Simple105_g32760;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32762 = WorldData19_g32762;
				#else
				float staticSwitch14_g32762 = ObjectData20_g32762;
				#endif
				half Variation3073_g31428 = staticSwitch14_g32762;
				float temp_output_116_0_g32733 = Variation3073_g31428;
				float mulTime98_g32733 = _TimeParameters.x * 0.5;
				float lerpResult110_g32733 = lerp( ( ceil( saturate( ( frac( ( temp_output_116_0_g32733 + 0.3576 ) ) - 0.5 ) ) ) * 0.5 ) , ceil( saturate( ( frac( ( temp_output_116_0_g32733 + 0.1258 ) ) - 0.8 ) ) ) , (sin( mulTime98_g32733 )*0.5 + 0.5));
				half Wind_Power2223_g31428 = Wind_Power369_g32778;
				float lerpResult118_g32733 = lerp( 0.25 , 0.75 , Wind_Power2223_g31428);
				float lerpResult111_g32733 = lerp( lerpResult110_g32733 , 1.0 , ( lerpResult118_g32733 * lerpResult118_g32733 * lerpResult118_g32733 * lerpResult118_g32733 ));
				half Motion_Selective3182_g31428 = lerpResult111_g32733;
				half Input_Speed62_g32792 = _MotionSpeed_20;
				float mulTime354_g32792 = _TimeParameters.x * Input_Speed62_g32792;
				float temp_output_342_0_g32792 = ( ( _MotionVariation_20 * Variation3073_g31428 ) * v.ase_color.r );
				float4x4 break19_g32793 = GetObjectToWorldMatrix();
				float3 appendResult20_g32793 = (float3(break19_g32793[ 0 ][ 3 ] , break19_g32793[ 1 ][ 3 ] , break19_g32793[ 2 ][ 3 ]));
				half3 Off19_g32794 = appendResult20_g32793;
				float4 transform68_g32793 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32793 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32793 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32793 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32793 = ( (transform68_g32793).xyz - (transform62_g32793).xyz );
				half3 On20_g32794 = ObjectPositionWithPivots28_g32793;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32794 = On20_g32794;
				#else
				float3 staticSwitch14_g32794 = Off19_g32794;
				#endif
				half3 ObjectData20_g32795 = staticSwitch14_g32794;
				half3 WorldData19_g32795 = Off19_g32794;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32795 = WorldData19_g32795;
				#else
				float3 staticSwitch14_g32795 = ObjectData20_g32795;
				#endif
				float3 temp_output_42_0_g32793 = staticSwitch14_g32795;
				float3 break9_g32793 = temp_output_42_0_g32793;
				float ObjectData20_g32798 = ( temp_output_342_0_g32792 + ( break9_g32793.x + break9_g32793.z ) );
				float WorldData19_g32798 = temp_output_342_0_g32792;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32798 = WorldData19_g32798;
				#else
				float staticSwitch14_g32798 = ObjectData20_g32798;
				#endif
				float Motion_Variation284_g32792 = staticSwitch14_g32798;
				float Motion_Scale287_g32792 = ( _MotionScale_20 * ase_worldPos.x );
				half Motion_Rolling138_g31428 = ( ( MotionAmplitude203095_g31428 * Motion_Max_Rolling1137_g31428 ) * ( Wind_Power_203109_g31428 * Mesh_Motion_260_g31428 * Global_NoiseTex_R34_g31428 * Motion_Use20162_g31428 * Motion_Selective3182_g31428 ) * sin( ( mulTime354_g32792 + Motion_Variation284_g32792 + Motion_Scale287_g32792 ) ) );
				half Angle44_g32728 = Motion_Rolling138_g31428;
				half3 VertexPos40_g32740 = ( VertexPosRotationAxis50_g32728 + ( VertexPosOtherAxis82_g32728 * cos( Angle44_g32728 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g32728 ) * sin( Angle44_g32728 ) ) );
				float3 appendResult74_g32740 = (float3(VertexPos40_g32740.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g32740 = appendResult74_g32740;
				float3 break84_g32740 = VertexPos40_g32740;
				float3 appendResult81_g32740 = (float3(0.0 , break84_g32740.y , break84_g32740.z));
				half3 VertexPosOtherAxis82_g32740 = appendResult81_g32740;
				float ObjectData20_g32815 = 3.14;
				float Bounds_Height374_g31428 = _MaxBoundsInfo.y;
				float WorldData19_g32815 = ( Bounds_Height374_g31428 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32815 = WorldData19_g32815;
				#else
				float staticSwitch14_g32815 = ObjectData20_g32815;
				#endif
				float Motion_Max_Bending1133_g31428 = staticSwitch14_g32815;
				half Wind_Power_103106_g31428 = Wind_Power369_g32778;
				float3 appendResult323_g32778 = (float3(break322_g32778.x , 0.0 , break322_g32778.y));
				float3 temp_output_324_0_g32778 = (appendResult323_g32778*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g32778 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g32778 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g31428 = (temp_output_339_0_g32778).xz;
				half Motion_Use1056_g31428 = _Motion_10;
				half Input_Speed62_g32735 = _MotionSpeed_10;
				float mulTime373_g32735 = _TimeParameters.x * Input_Speed62_g32735;
				half Motion_Variation284_g32735 = ( _MotionVariation_10 * Variation3073_g31428 );
				float2 appendResult344_g32735 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g32735 = ( _MotionScale_10 * appendResult344_g32735 );
				half2 Sine_MinusOneToOne281_g32735 = sin( ( mulTime373_g32735 + Motion_Variation284_g32735 + Motion_Scale287_g32735 ) );
				float2 temp_cast_12 = (1.0).xx;
				half Input_Turbulence327_g32735 = Global_NoiseTex_R34_g31428;
				float2 lerpResult321_g32735 = lerp( Sine_MinusOneToOne281_g32735 , temp_cast_12 , Input_Turbulence327_g32735);
				half2 Motion_Bending2258_g31428 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g31428 ) * Wind_Power_103106_g31428 * Wind_DirectionOS39_g31428 * Motion_Use1056_g31428 * Global_NoiseTex_R34_g31428 * lerpResult321_g32735 );
				half Motion_UseInteraction2097_g31428 = _Motion_Interaction;
				half Motion_InteractionMask66_g31428 = break322_g32778.w;
				float lerpResult3307_g31428 = lerp( 1.0 , Variation3073_g31428 , _InteractionVariation);
				half2 Motion_Interaction53_g31428 = ( _InteractionAmplitude * Motion_Max_Bending1133_g31428 * Motion_UseInteraction2097_g31428 * Motion_InteractionMask66_g31428 * Motion_InteractionMask66_g31428 * Wind_DirectionOS39_g31428 * lerpResult3307_g31428 );
				float2 lerpResult109_g31428 = lerp( Motion_Bending2258_g31428 , Motion_Interaction53_g31428 , Motion_InteractionMask66_g31428);
				half Mesh_Motion_182_g31428 = v.ase_texcoord3.x;
				float2 break143_g31428 = ( lerpResult109_g31428 * Mesh_Motion_182_g31428 );
				half Motion_Z190_g31428 = break143_g31428.y;
				half Angle44_g32740 = Motion_Z190_g31428;
				half3 VertexPos40_g32723 = ( VertexPosRotationAxis50_g32740 + ( VertexPosOtherAxis82_g32740 * cos( Angle44_g32740 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g32740 ) * sin( Angle44_g32740 ) ) );
				float3 appendResult74_g32723 = (float3(0.0 , 0.0 , VertexPos40_g32723.z));
				half3 VertexPosRotationAxis50_g32723 = appendResult74_g32723;
				float3 break84_g32723 = VertexPos40_g32723;
				float3 appendResult81_g32723 = (float3(break84_g32723.x , break84_g32723.y , 0.0));
				half3 VertexPosOtherAxis82_g32723 = appendResult81_g32723;
				half Motion_X216_g31428 = break143_g31428.x;
				half Angle44_g32723 = -Motion_X216_g31428;
				half Wind_Mode3167_g31428 = TVE_WindMode;
				float3 lerpResult3168_g31428 = lerp( v.vertex.xyz , ( VertexPosRotationAxis50_g32723 + ( VertexPosOtherAxis82_g32723 * cos( Angle44_g32723 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g32723 ) * sin( Angle44_g32723 ) ) ) , Wind_Mode3167_g31428);
				float3 Vertex_Motion_Object833_g31428 = lerpResult3168_g31428;
				float3 temp_output_3474_0_g31428 = ( v.vertex.xyz - Mesh_PivotsOS2291_g31428 );
				float3 appendResult2047_g31428 = (float3(Motion_Rolling138_g31428 , 0.0 , -Motion_Rolling138_g31428));
				float3 appendResult2043_g31428 = (float3(Motion_X216_g31428 , 0.0 , Motion_Z190_g31428));
				float3 lerpResult3173_g31428 = lerp( v.vertex.xyz , ( ( temp_output_3474_0_g31428 + appendResult2047_g31428 ) + appendResult2043_g31428 ) , Wind_Mode3167_g31428);
				float3 Vertex_Motion_World1118_g31428 = lerpResult3173_g31428;
				float3 temp_output_3331_0_g31428 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g31428 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g31428 = Vertex_Motion_Object833_g31428;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g31428 = temp_output_3331_0_g31428;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g31428 = temp_output_3331_0_g31428;
				#else
				float3 staticSwitch3312_g31428 = Vertex_Motion_Object833_g31428;
				#endif
				half3 ObjectData20_g32782 = staticSwitch3312_g31428;
				half3 WorldData19_g32782 = Vertex_Motion_World1118_g31428;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32782 = WorldData19_g32782;
				#else
				float3 staticSwitch14_g32782 = ObjectData20_g32782;
				#endif
				float4x4 break19_g32806 = GetObjectToWorldMatrix();
				float3 appendResult20_g32806 = (float3(break19_g32806[ 0 ][ 3 ] , break19_g32806[ 1 ][ 3 ] , break19_g32806[ 2 ][ 3 ]));
				half3 Off19_g32807 = appendResult20_g32806;
				float4 transform68_g32806 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g32806 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g32806 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g32806 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32806 = ( (transform68_g32806).xyz - (transform62_g32806).xyz );
				half3 On20_g32807 = ObjectPositionWithPivots28_g32806;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32807 = On20_g32807;
				#else
				float3 staticSwitch14_g32807 = Off19_g32807;
				#endif
				half3 ObjectData20_g32808 = staticSwitch14_g32807;
				half3 WorldData19_g32808 = Off19_g32807;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32808 = WorldData19_g32808;
				#else
				float3 staticSwitch14_g32808 = ObjectData20_g32808;
				#endif
				float3 temp_output_42_0_g32806 = staticSwitch14_g32808;
				float temp_output_7_0_g32727 = TVE_SizeFadeEnd;
				float ObjectData20_g32780 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g32806 ) * _GlobalSizeFade ) - temp_output_7_0_g32727 ) / ( TVE_SizeFadeStart - temp_output_7_0_g32727 ) ) );
				float WorldData19_g32780 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32780 = WorldData19_g32780;
				#else
				float staticSwitch14_g32780 = ObjectData20_g32780;
				#endif
				float Vertex_SizeFade1740_g31428 = staticSwitch14_g32780;
				float4x4 break19_g32749 = GetObjectToWorldMatrix();
				float3 appendResult20_g32749 = (float3(break19_g32749[ 0 ][ 3 ] , break19_g32749[ 1 ][ 3 ] , break19_g32749[ 2 ][ 3 ]));
				half3 Off19_g32750 = appendResult20_g32749;
				float4 transform68_g32749 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32749 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32749 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32749 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32749 = ( (transform68_g32749).xyz - (transform62_g32749).xyz );
				half3 On20_g32750 = ObjectPositionWithPivots28_g32749;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32750 = On20_g32750;
				#else
				float3 staticSwitch14_g32750 = Off19_g32750;
				#endif
				half3 ObjectData20_g32751 = staticSwitch14_g32750;
				half3 WorldData19_g32751 = Off19_g32750;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32751 = WorldData19_g32751;
				#else
				float3 staticSwitch14_g32751 = ObjectData20_g32751;
				#endif
				float3 temp_output_42_0_g32749 = staticSwitch14_g32751;
				half3 ObjectData20_g32748 = temp_output_42_0_g32749;
				half3 WorldData19_g32748 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32748 = WorldData19_g32748;
				#else
				float3 staticSwitch14_g32748 = ObjectData20_g32748;
				#endif
				float2 temp_output_43_38_g32746 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32748).xz ) );
				half4 Legacy33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g32746, 0.0 );
				half4 Vegetation33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g32746, 0.0 );
				half4 Grass33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g32746, 0.0 );
				half4 Objects33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g32746, 0.0 );
				half4 Custom33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g32746, 0.0 );
				half4 localUSE_BUFFERS33_g32747 = USE_BUFFERS( Legacy33_g32747 , Vegetation33_g32747 , Grass33_g32747 , Objects33_g32747 , Custom33_g32747 );
				float4 break49_g32746 = localUSE_BUFFERS33_g32747;
				half Global_ExtrasTex_G305_g31428 = break49_g32746.y;
				float lerpResult346_g31428 = lerp( 1.0 , Global_ExtrasTex_G305_g31428 , _GlobalSize);
				float ObjectData20_g32781 = ( lerpResult346_g31428 * _LocalSize );
				float WorldData19_g32781 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32781 = WorldData19_g32781;
				#else
				float staticSwitch14_g32781 = ObjectData20_g32781;
				#endif
				half Vertex_Size1741_g31428 = staticSwitch14_g32781;
				half3 Grass_Coverage2661_g31428 = half3(0,0,0);
				float3 Final_VertexPosition890_g31428 = ( ( staticSwitch14_g32782 * Vertex_SizeFade1740_g31428 * Vertex_Size1741_g31428 ) + Mesh_PivotsOS2291_g31428 + Grass_Coverage2661_g31428 );
				
				o.ase_texcoord2 = v.ase_texcoord;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g31428;
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
				float4 ase_texcoord3 : TEXCOORD3;
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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

				half2 Main_UVs15_g31428 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g31428 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g31428 );
				float4 temp_output_51_0_g31428 = ( _MainColor * tex2DNode29_g31428 );
				half Main_Alpha316_g31428 = (temp_output_51_0_g31428).a;
				
				float localCustomAlphaClip9_g32759 = ( 0.0 );
				half Main_AlphaRaw1203_g31428 = tex2DNode29_g31428.a;
				half Alpha5_g32759 = Main_AlphaRaw1203_g31428;
				float Alpha9_g32759 = Alpha5_g32759;
				#if _ALPHATEST_ON
				clip(Alpha9_g32759 - _Cutoff);
				#endif
				half Final_Clip914_g31428 = localCustomAlphaClip9_g32759;
				
				float Alpha = Main_Alpha316_g31428;
				float AlphaClipThreshold = Final_Clip914_g31428;
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
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _ALPHATEST_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#define TVE_IS_VEGETATION_SHADER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _Color;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			half3 _render_normals_options;
			half _VertexMotionSpace;
			half _VertexCat;
			half _InteractionVariation;
			half _Motion_Interaction;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _Motion_10;
			half _VertexMotionMode;
			half _MotionAmplitude_10;
			float _MotionScale_20;
			half _MotionVariation_20;
			float _MotionSpeed_20;
			half _Motion_20;
			half _vertex_pivot_mode;
			half _MotionAmplitude_20;
			half _render_cutoff;
			half _IsBarkShader;
			float _MotionSpeed_10;
			half _VertexDataMode;
			half _IsLitShader;
			half _GlobalSize;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			half _OcclusionCat;
			half _VertexOcclusionValue;
			half _render_premul;
			half _GlobalSizeFade;
			half _GlobalOverlay;
			half _DetailNormalValue;
			half _SecondNormalValue;
			half _DetailMaskContrast;
			half _DetailMaskValue;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _IsStandardShader;
			half _LocalSize;
			half _OverlayContrastValue;
			half _IsAnyPathShader;
			half _render_cull;
			half _render_dst;
			half _DetailTypeMode;
			half _AdvancedCat;
			half _DetailCat;
			half _RenderZWrite;
			half _RenderBlend;
			half _RenderNormals;
			half _RenderCull;
			half _MainCat;
			half _DetailMode;
			half _PivotsMessage;
			half _DetailMapsMode;
			half _RenderMode;
			half _VertexVariationMode;
			half _RenderPriority;
			half _IsVersion;
			half _IsTVEShader;
			half _RenderingCat;
			half _Cutoff;
			half _RenderClip;
			half _MainNormalValue;
			half _GlobalCat;
			half _DetailSpace;
			half _GlobalSpace;
			float _render_normals;
			half _MainOcclusionValue;
			half _Banner;
			half _render_zw;
			float _OverlayContrast;
			half _BatchingMessage;
			half _ObjectDataMessage;
			half _WorldDataMessage;
			half _MaskMode;
			float _GrassPerspectivePushValue;
			float _material_batching;
			float _ObjectSmoothnessValue;
			float _OverlayVariation;
			float _GrassPerspectiveAngleValue;
			float _ObjectMetallicValue;
			float _GrassPerspectiveNoiseValue;
			float _ObjectOcclusionValue;
			float _render_priority;
			float _render_mode;
			float _SubsurfaceMinValue;
			float _SubsurfaceMaxValue;
			float _render_blend;
			half _render_src;
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
			TEXTURE2D(TVE_MotionTex);
			half4 TVE_VolumeCoord;
			SAMPLER(samplerTVE_MotionTex);
			TEXTURE2D(TVE_MotionTex_Vegetation);
			SAMPLER(samplerTVE_MotionTex_Vegetation);
			TEXTURE2D(TVE_MotionTex_Grass);
			SAMPLER(samplerTVE_MotionTex_Grass);
			TEXTURE2D(TVE_MotionTex_Objects);
			SAMPLER(samplerTVE_MotionTex_Objects);
			TEXTURE2D(TVE_MotionTex_User);
			SAMPLER(samplerTVE_MotionTex_User);
			half TVE_WindPower;
			TEXTURE2D(TVE_NoiseTex);
			float2 TVE_NoiseSpeed_Vegetation;
			float2 TVE_NoiseSpeed_Grass;
			half TVE_NoiseSize_Vegetation;
			half TVE_NoiseSize_Grass;
			SAMPLER(samplerTVE_NoiseTex);
			half TVE_NoiseContrast;
			half TVE_WindMode;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			TEXTURE2D(TVE_ExtrasTex);
			SAMPLER(samplerTVE_ExtrasTex);
			TEXTURE2D(TVE_ExtrasTex_Vegetation);
			SAMPLER(samplerTVE_ExtrasTex_Vegetation);
			TEXTURE2D(TVE_ExtrasTex_Grass);
			SAMPLER(samplerTVE_ExtrasTex_Grass);
			TEXTURE2D(TVE_ExtrasTex_Objects);
			SAMPLER(samplerTVE_ExtrasTex_Objects);
			TEXTURE2D(TVE_ExtrasTex_User);
			SAMPLER(samplerTVE_ExtrasTex_User);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);


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

				half3 _Vector1 = half3(0,0,0);
				half3 Mesh_PivotsOS2291_g31428 = _Vector1;
				float3 temp_output_2283_0_g31428 = ( v.vertex.xyz - Mesh_PivotsOS2291_g31428 );
				half3 VertexPos40_g32728 = temp_output_2283_0_g31428;
				float3 appendResult74_g32728 = (float3(0.0 , VertexPos40_g32728.y , 0.0));
				float3 VertexPosRotationAxis50_g32728 = appendResult74_g32728;
				float3 break84_g32728 = VertexPos40_g32728;
				float3 appendResult81_g32728 = (float3(break84_g32728.x , 0.0 , break84_g32728.z));
				float3 VertexPosOtherAxis82_g32728 = appendResult81_g32728;
				half MotionAmplitude203095_g31428 = _MotionAmplitude_20;
				float ObjectData20_g32813 = 3.14;
				float Bounds_Radius121_g31428 = _MaxBoundsInfo.x;
				float WorldData19_g32813 = Bounds_Radius121_g31428;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32813 = WorldData19_g32813;
				#else
				float staticSwitch14_g32813 = ObjectData20_g32813;
				#endif
				float Motion_Max_Rolling1137_g31428 = staticSwitch14_g32813;
				float4x4 break19_g32771 = GetObjectToWorldMatrix();
				float3 appendResult20_g32771 = (float3(break19_g32771[ 0 ][ 3 ] , break19_g32771[ 1 ][ 3 ] , break19_g32771[ 2 ][ 3 ]));
				half3 Off19_g32772 = appendResult20_g32771;
				float4 transform68_g32771 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g32771 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g32771 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g32771 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32771 = ( (transform68_g32771).xyz - (transform62_g32771).xyz );
				half3 On20_g32772 = ObjectPositionWithPivots28_g32771;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32772 = On20_g32772;
				#else
				float3 staticSwitch14_g32772 = Off19_g32772;
				#endif
				half3 ObjectData20_g32773 = staticSwitch14_g32772;
				half3 WorldData19_g32773 = Off19_g32772;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32773 = WorldData19_g32773;
				#else
				float3 staticSwitch14_g32773 = ObjectData20_g32773;
				#endif
				float3 temp_output_42_0_g32771 = staticSwitch14_g32773;
				half3 ObjectData20_g32776 = temp_output_42_0_g32771;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g32776 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32776 = WorldData19_g32776;
				#else
				float3 staticSwitch14_g32776 = ObjectData20_g32776;
				#endif
				float2 temp_output_39_38_g32769 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32776).xz ) );
				half4 Legacy33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, temp_output_39_38_g32769, 0.0 );
				half4 Vegetation33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Vegetation, samplerTVE_MotionTex_Vegetation, temp_output_39_38_g32769, 0.0 );
				half4 Grass33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Grass, samplerTVE_MotionTex_Grass, temp_output_39_38_g32769, 0.0 );
				half4 Objects33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Objects, samplerTVE_MotionTex_Objects, temp_output_39_38_g32769, 0.0 );
				half4 Custom33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_User, samplerTVE_MotionTex_User, temp_output_39_38_g32769, 0.0 );
				half4 localUSE_BUFFERS33_g32777 = USE_BUFFERS( Legacy33_g32777 , Vegetation33_g32777 , Grass33_g32777 , Objects33_g32777 , Custom33_g32777 );
				float4 break322_g32778 = localUSE_BUFFERS33_g32777;
				half Wind_Power369_g32778 = saturate( ( (break322_g32778.z*2.0 + -1.0) + TVE_WindPower ) );
				float lerpResult376_g32778 = lerp( 0.1 , 1.0 , Wind_Power369_g32778);
				half Wind_Power_203109_g31428 = lerpResult376_g32778;
				half Mesh_Motion_260_g31428 = v.ase_texcoord3.y;
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch160_g32799 = TVE_NoiseSpeed_Grass;
				#else
				float2 staticSwitch160_g32799 = TVE_NoiseSpeed_Vegetation;
				#endif
				float4x4 break19_g32801 = GetObjectToWorldMatrix();
				float3 appendResult20_g32801 = (float3(break19_g32801[ 0 ][ 3 ] , break19_g32801[ 1 ][ 3 ] , break19_g32801[ 2 ][ 3 ]));
				half3 Off19_g32802 = appendResult20_g32801;
				float4 transform68_g32801 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32801 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32801 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32801 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32801 = ( (transform68_g32801).xyz - (transform62_g32801).xyz );
				half3 On20_g32802 = ObjectPositionWithPivots28_g32801;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32802 = On20_g32802;
				#else
				float3 staticSwitch14_g32802 = Off19_g32802;
				#endif
				half3 ObjectData20_g32803 = staticSwitch14_g32802;
				half3 WorldData19_g32803 = Off19_g32802;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32803 = WorldData19_g32803;
				#else
				float3 staticSwitch14_g32803 = ObjectData20_g32803;
				#endif
				float3 temp_output_42_0_g32801 = staticSwitch14_g32803;
				half3 ObjectData20_g32800 = temp_output_42_0_g32801;
				half3 WorldData19_g32800 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32800 = WorldData19_g32800;
				#else
				float3 staticSwitch14_g32800 = ObjectData20_g32800;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch164_g32799 = (ase_worldPos).xz;
				#else
				float2 staticSwitch164_g32799 = (staticSwitch14_g32800).xz;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float staticSwitch161_g32799 = TVE_NoiseSize_Grass;
				#else
				float staticSwitch161_g32799 = TVE_NoiseSize_Vegetation;
				#endif
				float2 panner73_g32799 = ( _TimeParameters.x * staticSwitch160_g32799 + ( staticSwitch164_g32799 * staticSwitch161_g32799 ));
				float4 tex2DNode75_g32799 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g32799, 0.0 );
				float4 saferPower77_g32799 = max( abs( tex2DNode75_g32799 ) , 0.0001 );
				float4 temp_cast_7 = (TVE_NoiseContrast).xxxx;
				float4 break142_g32799 = pow( saferPower77_g32799 , temp_cast_7 );
				half Global_NoiseTex_R34_g31428 = break142_g32799.r;
				half Motion_Use20162_g31428 = _Motion_20;
				float4x4 break19_g32763 = GetObjectToWorldMatrix();
				float3 appendResult20_g32763 = (float3(break19_g32763[ 0 ][ 3 ] , break19_g32763[ 1 ][ 3 ] , break19_g32763[ 2 ][ 3 ]));
				half3 Off19_g32764 = appendResult20_g32763;
				float4 transform68_g32763 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32763 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32763 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32763 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32763 = ( (transform68_g32763).xyz - (transform62_g32763).xyz );
				half3 On20_g32764 = ObjectPositionWithPivots28_g32763;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32764 = On20_g32764;
				#else
				float3 staticSwitch14_g32764 = Off19_g32764;
				#endif
				half3 ObjectData20_g32765 = staticSwitch14_g32764;
				half3 WorldData19_g32765 = Off19_g32764;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32765 = WorldData19_g32765;
				#else
				float3 staticSwitch14_g32765 = ObjectData20_g32765;
				#endif
				float3 temp_output_42_0_g32763 = staticSwitch14_g32765;
				float3 break9_g32763 = temp_output_42_0_g32763;
				half Variation_Complex102_g32760 = frac( ( v.ase_color.r + ( break9_g32763.x + break9_g32763.z ) ) );
				float ObjectData20_g32762 = Variation_Complex102_g32760;
				half Variation_Simple105_g32760 = v.ase_color.r;
				float WorldData19_g32762 = Variation_Simple105_g32760;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32762 = WorldData19_g32762;
				#else
				float staticSwitch14_g32762 = ObjectData20_g32762;
				#endif
				half Variation3073_g31428 = staticSwitch14_g32762;
				float temp_output_116_0_g32733 = Variation3073_g31428;
				float mulTime98_g32733 = _TimeParameters.x * 0.5;
				float lerpResult110_g32733 = lerp( ( ceil( saturate( ( frac( ( temp_output_116_0_g32733 + 0.3576 ) ) - 0.5 ) ) ) * 0.5 ) , ceil( saturate( ( frac( ( temp_output_116_0_g32733 + 0.1258 ) ) - 0.8 ) ) ) , (sin( mulTime98_g32733 )*0.5 + 0.5));
				half Wind_Power2223_g31428 = Wind_Power369_g32778;
				float lerpResult118_g32733 = lerp( 0.25 , 0.75 , Wind_Power2223_g31428);
				float lerpResult111_g32733 = lerp( lerpResult110_g32733 , 1.0 , ( lerpResult118_g32733 * lerpResult118_g32733 * lerpResult118_g32733 * lerpResult118_g32733 ));
				half Motion_Selective3182_g31428 = lerpResult111_g32733;
				half Input_Speed62_g32792 = _MotionSpeed_20;
				float mulTime354_g32792 = _TimeParameters.x * Input_Speed62_g32792;
				float temp_output_342_0_g32792 = ( ( _MotionVariation_20 * Variation3073_g31428 ) * v.ase_color.r );
				float4x4 break19_g32793 = GetObjectToWorldMatrix();
				float3 appendResult20_g32793 = (float3(break19_g32793[ 0 ][ 3 ] , break19_g32793[ 1 ][ 3 ] , break19_g32793[ 2 ][ 3 ]));
				half3 Off19_g32794 = appendResult20_g32793;
				float4 transform68_g32793 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32793 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32793 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32793 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32793 = ( (transform68_g32793).xyz - (transform62_g32793).xyz );
				half3 On20_g32794 = ObjectPositionWithPivots28_g32793;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32794 = On20_g32794;
				#else
				float3 staticSwitch14_g32794 = Off19_g32794;
				#endif
				half3 ObjectData20_g32795 = staticSwitch14_g32794;
				half3 WorldData19_g32795 = Off19_g32794;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32795 = WorldData19_g32795;
				#else
				float3 staticSwitch14_g32795 = ObjectData20_g32795;
				#endif
				float3 temp_output_42_0_g32793 = staticSwitch14_g32795;
				float3 break9_g32793 = temp_output_42_0_g32793;
				float ObjectData20_g32798 = ( temp_output_342_0_g32792 + ( break9_g32793.x + break9_g32793.z ) );
				float WorldData19_g32798 = temp_output_342_0_g32792;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32798 = WorldData19_g32798;
				#else
				float staticSwitch14_g32798 = ObjectData20_g32798;
				#endif
				float Motion_Variation284_g32792 = staticSwitch14_g32798;
				float Motion_Scale287_g32792 = ( _MotionScale_20 * ase_worldPos.x );
				half Motion_Rolling138_g31428 = ( ( MotionAmplitude203095_g31428 * Motion_Max_Rolling1137_g31428 ) * ( Wind_Power_203109_g31428 * Mesh_Motion_260_g31428 * Global_NoiseTex_R34_g31428 * Motion_Use20162_g31428 * Motion_Selective3182_g31428 ) * sin( ( mulTime354_g32792 + Motion_Variation284_g32792 + Motion_Scale287_g32792 ) ) );
				half Angle44_g32728 = Motion_Rolling138_g31428;
				half3 VertexPos40_g32740 = ( VertexPosRotationAxis50_g32728 + ( VertexPosOtherAxis82_g32728 * cos( Angle44_g32728 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g32728 ) * sin( Angle44_g32728 ) ) );
				float3 appendResult74_g32740 = (float3(VertexPos40_g32740.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g32740 = appendResult74_g32740;
				float3 break84_g32740 = VertexPos40_g32740;
				float3 appendResult81_g32740 = (float3(0.0 , break84_g32740.y , break84_g32740.z));
				half3 VertexPosOtherAxis82_g32740 = appendResult81_g32740;
				float ObjectData20_g32815 = 3.14;
				float Bounds_Height374_g31428 = _MaxBoundsInfo.y;
				float WorldData19_g32815 = ( Bounds_Height374_g31428 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32815 = WorldData19_g32815;
				#else
				float staticSwitch14_g32815 = ObjectData20_g32815;
				#endif
				float Motion_Max_Bending1133_g31428 = staticSwitch14_g32815;
				half Wind_Power_103106_g31428 = Wind_Power369_g32778;
				float3 appendResult323_g32778 = (float3(break322_g32778.x , 0.0 , break322_g32778.y));
				float3 temp_output_324_0_g32778 = (appendResult323_g32778*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g32778 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g32778 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g31428 = (temp_output_339_0_g32778).xz;
				half Motion_Use1056_g31428 = _Motion_10;
				half Input_Speed62_g32735 = _MotionSpeed_10;
				float mulTime373_g32735 = _TimeParameters.x * Input_Speed62_g32735;
				half Motion_Variation284_g32735 = ( _MotionVariation_10 * Variation3073_g31428 );
				float2 appendResult344_g32735 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g32735 = ( _MotionScale_10 * appendResult344_g32735 );
				half2 Sine_MinusOneToOne281_g32735 = sin( ( mulTime373_g32735 + Motion_Variation284_g32735 + Motion_Scale287_g32735 ) );
				float2 temp_cast_12 = (1.0).xx;
				half Input_Turbulence327_g32735 = Global_NoiseTex_R34_g31428;
				float2 lerpResult321_g32735 = lerp( Sine_MinusOneToOne281_g32735 , temp_cast_12 , Input_Turbulence327_g32735);
				half2 Motion_Bending2258_g31428 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g31428 ) * Wind_Power_103106_g31428 * Wind_DirectionOS39_g31428 * Motion_Use1056_g31428 * Global_NoiseTex_R34_g31428 * lerpResult321_g32735 );
				half Motion_UseInteraction2097_g31428 = _Motion_Interaction;
				half Motion_InteractionMask66_g31428 = break322_g32778.w;
				float lerpResult3307_g31428 = lerp( 1.0 , Variation3073_g31428 , _InteractionVariation);
				half2 Motion_Interaction53_g31428 = ( _InteractionAmplitude * Motion_Max_Bending1133_g31428 * Motion_UseInteraction2097_g31428 * Motion_InteractionMask66_g31428 * Motion_InteractionMask66_g31428 * Wind_DirectionOS39_g31428 * lerpResult3307_g31428 );
				float2 lerpResult109_g31428 = lerp( Motion_Bending2258_g31428 , Motion_Interaction53_g31428 , Motion_InteractionMask66_g31428);
				half Mesh_Motion_182_g31428 = v.ase_texcoord3.x;
				float2 break143_g31428 = ( lerpResult109_g31428 * Mesh_Motion_182_g31428 );
				half Motion_Z190_g31428 = break143_g31428.y;
				half Angle44_g32740 = Motion_Z190_g31428;
				half3 VertexPos40_g32723 = ( VertexPosRotationAxis50_g32740 + ( VertexPosOtherAxis82_g32740 * cos( Angle44_g32740 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g32740 ) * sin( Angle44_g32740 ) ) );
				float3 appendResult74_g32723 = (float3(0.0 , 0.0 , VertexPos40_g32723.z));
				half3 VertexPosRotationAxis50_g32723 = appendResult74_g32723;
				float3 break84_g32723 = VertexPos40_g32723;
				float3 appendResult81_g32723 = (float3(break84_g32723.x , break84_g32723.y , 0.0));
				half3 VertexPosOtherAxis82_g32723 = appendResult81_g32723;
				half Motion_X216_g31428 = break143_g31428.x;
				half Angle44_g32723 = -Motion_X216_g31428;
				half Wind_Mode3167_g31428 = TVE_WindMode;
				float3 lerpResult3168_g31428 = lerp( v.vertex.xyz , ( VertexPosRotationAxis50_g32723 + ( VertexPosOtherAxis82_g32723 * cos( Angle44_g32723 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g32723 ) * sin( Angle44_g32723 ) ) ) , Wind_Mode3167_g31428);
				float3 Vertex_Motion_Object833_g31428 = lerpResult3168_g31428;
				float3 temp_output_3474_0_g31428 = ( v.vertex.xyz - Mesh_PivotsOS2291_g31428 );
				float3 appendResult2047_g31428 = (float3(Motion_Rolling138_g31428 , 0.0 , -Motion_Rolling138_g31428));
				float3 appendResult2043_g31428 = (float3(Motion_X216_g31428 , 0.0 , Motion_Z190_g31428));
				float3 lerpResult3173_g31428 = lerp( v.vertex.xyz , ( ( temp_output_3474_0_g31428 + appendResult2047_g31428 ) + appendResult2043_g31428 ) , Wind_Mode3167_g31428);
				float3 Vertex_Motion_World1118_g31428 = lerpResult3173_g31428;
				float3 temp_output_3331_0_g31428 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g31428 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g31428 = Vertex_Motion_Object833_g31428;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g31428 = temp_output_3331_0_g31428;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g31428 = temp_output_3331_0_g31428;
				#else
				float3 staticSwitch3312_g31428 = Vertex_Motion_Object833_g31428;
				#endif
				half3 ObjectData20_g32782 = staticSwitch3312_g31428;
				half3 WorldData19_g32782 = Vertex_Motion_World1118_g31428;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32782 = WorldData19_g32782;
				#else
				float3 staticSwitch14_g32782 = ObjectData20_g32782;
				#endif
				float4x4 break19_g32806 = GetObjectToWorldMatrix();
				float3 appendResult20_g32806 = (float3(break19_g32806[ 0 ][ 3 ] , break19_g32806[ 1 ][ 3 ] , break19_g32806[ 2 ][ 3 ]));
				half3 Off19_g32807 = appendResult20_g32806;
				float4 transform68_g32806 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g32806 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g32806 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g32806 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32806 = ( (transform68_g32806).xyz - (transform62_g32806).xyz );
				half3 On20_g32807 = ObjectPositionWithPivots28_g32806;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32807 = On20_g32807;
				#else
				float3 staticSwitch14_g32807 = Off19_g32807;
				#endif
				half3 ObjectData20_g32808 = staticSwitch14_g32807;
				half3 WorldData19_g32808 = Off19_g32807;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32808 = WorldData19_g32808;
				#else
				float3 staticSwitch14_g32808 = ObjectData20_g32808;
				#endif
				float3 temp_output_42_0_g32806 = staticSwitch14_g32808;
				float temp_output_7_0_g32727 = TVE_SizeFadeEnd;
				float ObjectData20_g32780 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g32806 ) * _GlobalSizeFade ) - temp_output_7_0_g32727 ) / ( TVE_SizeFadeStart - temp_output_7_0_g32727 ) ) );
				float WorldData19_g32780 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32780 = WorldData19_g32780;
				#else
				float staticSwitch14_g32780 = ObjectData20_g32780;
				#endif
				float Vertex_SizeFade1740_g31428 = staticSwitch14_g32780;
				float4x4 break19_g32749 = GetObjectToWorldMatrix();
				float3 appendResult20_g32749 = (float3(break19_g32749[ 0 ][ 3 ] , break19_g32749[ 1 ][ 3 ] , break19_g32749[ 2 ][ 3 ]));
				half3 Off19_g32750 = appendResult20_g32749;
				float4 transform68_g32749 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32749 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32749 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32749 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32749 = ( (transform68_g32749).xyz - (transform62_g32749).xyz );
				half3 On20_g32750 = ObjectPositionWithPivots28_g32749;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32750 = On20_g32750;
				#else
				float3 staticSwitch14_g32750 = Off19_g32750;
				#endif
				half3 ObjectData20_g32751 = staticSwitch14_g32750;
				half3 WorldData19_g32751 = Off19_g32750;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32751 = WorldData19_g32751;
				#else
				float3 staticSwitch14_g32751 = ObjectData20_g32751;
				#endif
				float3 temp_output_42_0_g32749 = staticSwitch14_g32751;
				half3 ObjectData20_g32748 = temp_output_42_0_g32749;
				half3 WorldData19_g32748 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32748 = WorldData19_g32748;
				#else
				float3 staticSwitch14_g32748 = ObjectData20_g32748;
				#endif
				float2 temp_output_43_38_g32746 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32748).xz ) );
				half4 Legacy33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g32746, 0.0 );
				half4 Vegetation33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g32746, 0.0 );
				half4 Grass33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g32746, 0.0 );
				half4 Objects33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g32746, 0.0 );
				half4 Custom33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g32746, 0.0 );
				half4 localUSE_BUFFERS33_g32747 = USE_BUFFERS( Legacy33_g32747 , Vegetation33_g32747 , Grass33_g32747 , Objects33_g32747 , Custom33_g32747 );
				float4 break49_g32746 = localUSE_BUFFERS33_g32747;
				half Global_ExtrasTex_G305_g31428 = break49_g32746.y;
				float lerpResult346_g31428 = lerp( 1.0 , Global_ExtrasTex_G305_g31428 , _GlobalSize);
				float ObjectData20_g32781 = ( lerpResult346_g31428 * _LocalSize );
				float WorldData19_g32781 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32781 = WorldData19_g32781;
				#else
				float staticSwitch14_g32781 = ObjectData20_g32781;
				#endif
				half Vertex_Size1741_g31428 = staticSwitch14_g32781;
				half3 Grass_Coverage2661_g31428 = half3(0,0,0);
				float3 Final_VertexPosition890_g31428 = ( ( staticSwitch14_g32782 * Vertex_SizeFade1740_g31428 * Vertex_Size1741_g31428 ) + Mesh_PivotsOS2291_g31428 + Grass_Coverage2661_g31428 );
				
				o.ase_texcoord2 = v.ase_texcoord;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g31428;
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
				float4 ase_texcoord3 : TEXCOORD3;
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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

				half2 Main_UVs15_g31428 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g31428 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g31428 );
				float4 temp_output_51_0_g31428 = ( _MainColor * tex2DNode29_g31428 );
				half Main_Alpha316_g31428 = (temp_output_51_0_g31428).a;
				
				float localCustomAlphaClip9_g32759 = ( 0.0 );
				half Main_AlphaRaw1203_g31428 = tex2DNode29_g31428.a;
				half Alpha5_g32759 = Main_AlphaRaw1203_g31428;
				float Alpha9_g32759 = Alpha5_g32759;
				#if _ALPHATEST_ON
				clip(Alpha9_g32759 - _Cutoff);
				#endif
				half Final_Clip914_g31428 = localCustomAlphaClip9_g32759;
				
				float Alpha = Main_Alpha316_g31428;
				float AlphaClipThreshold = Final_Clip914_g31428;

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
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _ALPHATEST_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#pragma shader_feature_local TVE_DETAIL_MODE_OFF TVE_DETAIL_MODE_OVERLAY TVE_DETAIL_MODE_REPLACE
			#pragma shader_feature_local TVE_DETAIL_MAPS_STANDARD TVE_DETAIL_MAPS_PACKED
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#define TVE_IS_VEGETATION_SHADER


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
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
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _Color;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			half3 _render_normals_options;
			half _VertexMotionSpace;
			half _VertexCat;
			half _InteractionVariation;
			half _Motion_Interaction;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _Motion_10;
			half _VertexMotionMode;
			half _MotionAmplitude_10;
			float _MotionScale_20;
			half _MotionVariation_20;
			float _MotionSpeed_20;
			half _Motion_20;
			half _vertex_pivot_mode;
			half _MotionAmplitude_20;
			half _render_cutoff;
			half _IsBarkShader;
			float _MotionSpeed_10;
			half _VertexDataMode;
			half _IsLitShader;
			half _GlobalSize;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			half _OcclusionCat;
			half _VertexOcclusionValue;
			half _render_premul;
			half _GlobalSizeFade;
			half _GlobalOverlay;
			half _DetailNormalValue;
			half _SecondNormalValue;
			half _DetailMaskContrast;
			half _DetailMaskValue;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _IsStandardShader;
			half _LocalSize;
			half _OverlayContrastValue;
			half _IsAnyPathShader;
			half _render_cull;
			half _render_dst;
			half _DetailTypeMode;
			half _AdvancedCat;
			half _DetailCat;
			half _RenderZWrite;
			half _RenderBlend;
			half _RenderNormals;
			half _RenderCull;
			half _MainCat;
			half _DetailMode;
			half _PivotsMessage;
			half _DetailMapsMode;
			half _RenderMode;
			half _VertexVariationMode;
			half _RenderPriority;
			half _IsVersion;
			half _IsTVEShader;
			half _RenderingCat;
			half _Cutoff;
			half _RenderClip;
			half _MainNormalValue;
			half _GlobalCat;
			half _DetailSpace;
			half _GlobalSpace;
			float _render_normals;
			half _MainOcclusionValue;
			half _Banner;
			half _render_zw;
			float _OverlayContrast;
			half _BatchingMessage;
			half _ObjectDataMessage;
			half _WorldDataMessage;
			half _MaskMode;
			float _GrassPerspectivePushValue;
			float _material_batching;
			float _ObjectSmoothnessValue;
			float _OverlayVariation;
			float _GrassPerspectiveAngleValue;
			float _ObjectMetallicValue;
			float _GrassPerspectiveNoiseValue;
			float _ObjectOcclusionValue;
			float _render_priority;
			float _render_mode;
			float _SubsurfaceMinValue;
			float _SubsurfaceMaxValue;
			float _render_blend;
			half _render_src;
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
			TEXTURE2D(TVE_MotionTex);
			half4 TVE_VolumeCoord;
			SAMPLER(samplerTVE_MotionTex);
			TEXTURE2D(TVE_MotionTex_Vegetation);
			SAMPLER(samplerTVE_MotionTex_Vegetation);
			TEXTURE2D(TVE_MotionTex_Grass);
			SAMPLER(samplerTVE_MotionTex_Grass);
			TEXTURE2D(TVE_MotionTex_Objects);
			SAMPLER(samplerTVE_MotionTex_Objects);
			TEXTURE2D(TVE_MotionTex_User);
			SAMPLER(samplerTVE_MotionTex_User);
			half TVE_WindPower;
			TEXTURE2D(TVE_NoiseTex);
			float2 TVE_NoiseSpeed_Vegetation;
			float2 TVE_NoiseSpeed_Grass;
			half TVE_NoiseSize_Vegetation;
			half TVE_NoiseSize_Grass;
			SAMPLER(samplerTVE_NoiseTex);
			half TVE_NoiseContrast;
			half TVE_WindMode;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			TEXTURE2D(TVE_ExtrasTex);
			SAMPLER(samplerTVE_ExtrasTex);
			TEXTURE2D(TVE_ExtrasTex_Vegetation);
			SAMPLER(samplerTVE_ExtrasTex_Vegetation);
			TEXTURE2D(TVE_ExtrasTex_Grass);
			SAMPLER(samplerTVE_ExtrasTex_Grass);
			TEXTURE2D(TVE_ExtrasTex_Objects);
			SAMPLER(samplerTVE_ExtrasTex_Objects);
			TEXTURE2D(TVE_ExtrasTex_User);
			SAMPLER(samplerTVE_ExtrasTex_User);
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

				half3 _Vector1 = half3(0,0,0);
				half3 Mesh_PivotsOS2291_g31428 = _Vector1;
				float3 temp_output_2283_0_g31428 = ( v.vertex.xyz - Mesh_PivotsOS2291_g31428 );
				half3 VertexPos40_g32728 = temp_output_2283_0_g31428;
				float3 appendResult74_g32728 = (float3(0.0 , VertexPos40_g32728.y , 0.0));
				float3 VertexPosRotationAxis50_g32728 = appendResult74_g32728;
				float3 break84_g32728 = VertexPos40_g32728;
				float3 appendResult81_g32728 = (float3(break84_g32728.x , 0.0 , break84_g32728.z));
				float3 VertexPosOtherAxis82_g32728 = appendResult81_g32728;
				half MotionAmplitude203095_g31428 = _MotionAmplitude_20;
				float ObjectData20_g32813 = 3.14;
				float Bounds_Radius121_g31428 = _MaxBoundsInfo.x;
				float WorldData19_g32813 = Bounds_Radius121_g31428;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32813 = WorldData19_g32813;
				#else
				float staticSwitch14_g32813 = ObjectData20_g32813;
				#endif
				float Motion_Max_Rolling1137_g31428 = staticSwitch14_g32813;
				float4x4 break19_g32771 = GetObjectToWorldMatrix();
				float3 appendResult20_g32771 = (float3(break19_g32771[ 0 ][ 3 ] , break19_g32771[ 1 ][ 3 ] , break19_g32771[ 2 ][ 3 ]));
				half3 Off19_g32772 = appendResult20_g32771;
				float4 transform68_g32771 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g32771 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g32771 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g32771 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32771 = ( (transform68_g32771).xyz - (transform62_g32771).xyz );
				half3 On20_g32772 = ObjectPositionWithPivots28_g32771;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32772 = On20_g32772;
				#else
				float3 staticSwitch14_g32772 = Off19_g32772;
				#endif
				half3 ObjectData20_g32773 = staticSwitch14_g32772;
				half3 WorldData19_g32773 = Off19_g32772;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32773 = WorldData19_g32773;
				#else
				float3 staticSwitch14_g32773 = ObjectData20_g32773;
				#endif
				float3 temp_output_42_0_g32771 = staticSwitch14_g32773;
				half3 ObjectData20_g32776 = temp_output_42_0_g32771;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g32776 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32776 = WorldData19_g32776;
				#else
				float3 staticSwitch14_g32776 = ObjectData20_g32776;
				#endif
				float2 temp_output_39_38_g32769 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32776).xz ) );
				half4 Legacy33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, temp_output_39_38_g32769, 0.0 );
				half4 Vegetation33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Vegetation, samplerTVE_MotionTex_Vegetation, temp_output_39_38_g32769, 0.0 );
				half4 Grass33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Grass, samplerTVE_MotionTex_Grass, temp_output_39_38_g32769, 0.0 );
				half4 Objects33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Objects, samplerTVE_MotionTex_Objects, temp_output_39_38_g32769, 0.0 );
				half4 Custom33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_User, samplerTVE_MotionTex_User, temp_output_39_38_g32769, 0.0 );
				half4 localUSE_BUFFERS33_g32777 = USE_BUFFERS( Legacy33_g32777 , Vegetation33_g32777 , Grass33_g32777 , Objects33_g32777 , Custom33_g32777 );
				float4 break322_g32778 = localUSE_BUFFERS33_g32777;
				half Wind_Power369_g32778 = saturate( ( (break322_g32778.z*2.0 + -1.0) + TVE_WindPower ) );
				float lerpResult376_g32778 = lerp( 0.1 , 1.0 , Wind_Power369_g32778);
				half Wind_Power_203109_g31428 = lerpResult376_g32778;
				half Mesh_Motion_260_g31428 = v.ase_texcoord3.y;
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch160_g32799 = TVE_NoiseSpeed_Grass;
				#else
				float2 staticSwitch160_g32799 = TVE_NoiseSpeed_Vegetation;
				#endif
				float4x4 break19_g32801 = GetObjectToWorldMatrix();
				float3 appendResult20_g32801 = (float3(break19_g32801[ 0 ][ 3 ] , break19_g32801[ 1 ][ 3 ] , break19_g32801[ 2 ][ 3 ]));
				half3 Off19_g32802 = appendResult20_g32801;
				float4 transform68_g32801 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32801 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32801 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32801 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32801 = ( (transform68_g32801).xyz - (transform62_g32801).xyz );
				half3 On20_g32802 = ObjectPositionWithPivots28_g32801;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32802 = On20_g32802;
				#else
				float3 staticSwitch14_g32802 = Off19_g32802;
				#endif
				half3 ObjectData20_g32803 = staticSwitch14_g32802;
				half3 WorldData19_g32803 = Off19_g32802;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32803 = WorldData19_g32803;
				#else
				float3 staticSwitch14_g32803 = ObjectData20_g32803;
				#endif
				float3 temp_output_42_0_g32801 = staticSwitch14_g32803;
				half3 ObjectData20_g32800 = temp_output_42_0_g32801;
				half3 WorldData19_g32800 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32800 = WorldData19_g32800;
				#else
				float3 staticSwitch14_g32800 = ObjectData20_g32800;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch164_g32799 = (ase_worldPos).xz;
				#else
				float2 staticSwitch164_g32799 = (staticSwitch14_g32800).xz;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float staticSwitch161_g32799 = TVE_NoiseSize_Grass;
				#else
				float staticSwitch161_g32799 = TVE_NoiseSize_Vegetation;
				#endif
				float2 panner73_g32799 = ( _TimeParameters.x * staticSwitch160_g32799 + ( staticSwitch164_g32799 * staticSwitch161_g32799 ));
				float4 tex2DNode75_g32799 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g32799, 0.0 );
				float4 saferPower77_g32799 = max( abs( tex2DNode75_g32799 ) , 0.0001 );
				float4 temp_cast_7 = (TVE_NoiseContrast).xxxx;
				float4 break142_g32799 = pow( saferPower77_g32799 , temp_cast_7 );
				half Global_NoiseTex_R34_g31428 = break142_g32799.r;
				half Motion_Use20162_g31428 = _Motion_20;
				float4x4 break19_g32763 = GetObjectToWorldMatrix();
				float3 appendResult20_g32763 = (float3(break19_g32763[ 0 ][ 3 ] , break19_g32763[ 1 ][ 3 ] , break19_g32763[ 2 ][ 3 ]));
				half3 Off19_g32764 = appendResult20_g32763;
				float4 transform68_g32763 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32763 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32763 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32763 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32763 = ( (transform68_g32763).xyz - (transform62_g32763).xyz );
				half3 On20_g32764 = ObjectPositionWithPivots28_g32763;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32764 = On20_g32764;
				#else
				float3 staticSwitch14_g32764 = Off19_g32764;
				#endif
				half3 ObjectData20_g32765 = staticSwitch14_g32764;
				half3 WorldData19_g32765 = Off19_g32764;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32765 = WorldData19_g32765;
				#else
				float3 staticSwitch14_g32765 = ObjectData20_g32765;
				#endif
				float3 temp_output_42_0_g32763 = staticSwitch14_g32765;
				float3 break9_g32763 = temp_output_42_0_g32763;
				half Variation_Complex102_g32760 = frac( ( v.ase_color.r + ( break9_g32763.x + break9_g32763.z ) ) );
				float ObjectData20_g32762 = Variation_Complex102_g32760;
				half Variation_Simple105_g32760 = v.ase_color.r;
				float WorldData19_g32762 = Variation_Simple105_g32760;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32762 = WorldData19_g32762;
				#else
				float staticSwitch14_g32762 = ObjectData20_g32762;
				#endif
				half Variation3073_g31428 = staticSwitch14_g32762;
				float temp_output_116_0_g32733 = Variation3073_g31428;
				float mulTime98_g32733 = _TimeParameters.x * 0.5;
				float lerpResult110_g32733 = lerp( ( ceil( saturate( ( frac( ( temp_output_116_0_g32733 + 0.3576 ) ) - 0.5 ) ) ) * 0.5 ) , ceil( saturate( ( frac( ( temp_output_116_0_g32733 + 0.1258 ) ) - 0.8 ) ) ) , (sin( mulTime98_g32733 )*0.5 + 0.5));
				half Wind_Power2223_g31428 = Wind_Power369_g32778;
				float lerpResult118_g32733 = lerp( 0.25 , 0.75 , Wind_Power2223_g31428);
				float lerpResult111_g32733 = lerp( lerpResult110_g32733 , 1.0 , ( lerpResult118_g32733 * lerpResult118_g32733 * lerpResult118_g32733 * lerpResult118_g32733 ));
				half Motion_Selective3182_g31428 = lerpResult111_g32733;
				half Input_Speed62_g32792 = _MotionSpeed_20;
				float mulTime354_g32792 = _TimeParameters.x * Input_Speed62_g32792;
				float temp_output_342_0_g32792 = ( ( _MotionVariation_20 * Variation3073_g31428 ) * v.ase_color.r );
				float4x4 break19_g32793 = GetObjectToWorldMatrix();
				float3 appendResult20_g32793 = (float3(break19_g32793[ 0 ][ 3 ] , break19_g32793[ 1 ][ 3 ] , break19_g32793[ 2 ][ 3 ]));
				half3 Off19_g32794 = appendResult20_g32793;
				float4 transform68_g32793 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32793 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32793 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32793 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32793 = ( (transform68_g32793).xyz - (transform62_g32793).xyz );
				half3 On20_g32794 = ObjectPositionWithPivots28_g32793;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32794 = On20_g32794;
				#else
				float3 staticSwitch14_g32794 = Off19_g32794;
				#endif
				half3 ObjectData20_g32795 = staticSwitch14_g32794;
				half3 WorldData19_g32795 = Off19_g32794;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32795 = WorldData19_g32795;
				#else
				float3 staticSwitch14_g32795 = ObjectData20_g32795;
				#endif
				float3 temp_output_42_0_g32793 = staticSwitch14_g32795;
				float3 break9_g32793 = temp_output_42_0_g32793;
				float ObjectData20_g32798 = ( temp_output_342_0_g32792 + ( break9_g32793.x + break9_g32793.z ) );
				float WorldData19_g32798 = temp_output_342_0_g32792;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32798 = WorldData19_g32798;
				#else
				float staticSwitch14_g32798 = ObjectData20_g32798;
				#endif
				float Motion_Variation284_g32792 = staticSwitch14_g32798;
				float Motion_Scale287_g32792 = ( _MotionScale_20 * ase_worldPos.x );
				half Motion_Rolling138_g31428 = ( ( MotionAmplitude203095_g31428 * Motion_Max_Rolling1137_g31428 ) * ( Wind_Power_203109_g31428 * Mesh_Motion_260_g31428 * Global_NoiseTex_R34_g31428 * Motion_Use20162_g31428 * Motion_Selective3182_g31428 ) * sin( ( mulTime354_g32792 + Motion_Variation284_g32792 + Motion_Scale287_g32792 ) ) );
				half Angle44_g32728 = Motion_Rolling138_g31428;
				half3 VertexPos40_g32740 = ( VertexPosRotationAxis50_g32728 + ( VertexPosOtherAxis82_g32728 * cos( Angle44_g32728 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g32728 ) * sin( Angle44_g32728 ) ) );
				float3 appendResult74_g32740 = (float3(VertexPos40_g32740.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g32740 = appendResult74_g32740;
				float3 break84_g32740 = VertexPos40_g32740;
				float3 appendResult81_g32740 = (float3(0.0 , break84_g32740.y , break84_g32740.z));
				half3 VertexPosOtherAxis82_g32740 = appendResult81_g32740;
				float ObjectData20_g32815 = 3.14;
				float Bounds_Height374_g31428 = _MaxBoundsInfo.y;
				float WorldData19_g32815 = ( Bounds_Height374_g31428 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32815 = WorldData19_g32815;
				#else
				float staticSwitch14_g32815 = ObjectData20_g32815;
				#endif
				float Motion_Max_Bending1133_g31428 = staticSwitch14_g32815;
				half Wind_Power_103106_g31428 = Wind_Power369_g32778;
				float3 appendResult323_g32778 = (float3(break322_g32778.x , 0.0 , break322_g32778.y));
				float3 temp_output_324_0_g32778 = (appendResult323_g32778*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g32778 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g32778 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g31428 = (temp_output_339_0_g32778).xz;
				half Motion_Use1056_g31428 = _Motion_10;
				half Input_Speed62_g32735 = _MotionSpeed_10;
				float mulTime373_g32735 = _TimeParameters.x * Input_Speed62_g32735;
				half Motion_Variation284_g32735 = ( _MotionVariation_10 * Variation3073_g31428 );
				float2 appendResult344_g32735 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g32735 = ( _MotionScale_10 * appendResult344_g32735 );
				half2 Sine_MinusOneToOne281_g32735 = sin( ( mulTime373_g32735 + Motion_Variation284_g32735 + Motion_Scale287_g32735 ) );
				float2 temp_cast_12 = (1.0).xx;
				half Input_Turbulence327_g32735 = Global_NoiseTex_R34_g31428;
				float2 lerpResult321_g32735 = lerp( Sine_MinusOneToOne281_g32735 , temp_cast_12 , Input_Turbulence327_g32735);
				half2 Motion_Bending2258_g31428 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g31428 ) * Wind_Power_103106_g31428 * Wind_DirectionOS39_g31428 * Motion_Use1056_g31428 * Global_NoiseTex_R34_g31428 * lerpResult321_g32735 );
				half Motion_UseInteraction2097_g31428 = _Motion_Interaction;
				half Motion_InteractionMask66_g31428 = break322_g32778.w;
				float lerpResult3307_g31428 = lerp( 1.0 , Variation3073_g31428 , _InteractionVariation);
				half2 Motion_Interaction53_g31428 = ( _InteractionAmplitude * Motion_Max_Bending1133_g31428 * Motion_UseInteraction2097_g31428 * Motion_InteractionMask66_g31428 * Motion_InteractionMask66_g31428 * Wind_DirectionOS39_g31428 * lerpResult3307_g31428 );
				float2 lerpResult109_g31428 = lerp( Motion_Bending2258_g31428 , Motion_Interaction53_g31428 , Motion_InteractionMask66_g31428);
				half Mesh_Motion_182_g31428 = v.ase_texcoord3.x;
				float2 break143_g31428 = ( lerpResult109_g31428 * Mesh_Motion_182_g31428 );
				half Motion_Z190_g31428 = break143_g31428.y;
				half Angle44_g32740 = Motion_Z190_g31428;
				half3 VertexPos40_g32723 = ( VertexPosRotationAxis50_g32740 + ( VertexPosOtherAxis82_g32740 * cos( Angle44_g32740 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g32740 ) * sin( Angle44_g32740 ) ) );
				float3 appendResult74_g32723 = (float3(0.0 , 0.0 , VertexPos40_g32723.z));
				half3 VertexPosRotationAxis50_g32723 = appendResult74_g32723;
				float3 break84_g32723 = VertexPos40_g32723;
				float3 appendResult81_g32723 = (float3(break84_g32723.x , break84_g32723.y , 0.0));
				half3 VertexPosOtherAxis82_g32723 = appendResult81_g32723;
				half Motion_X216_g31428 = break143_g31428.x;
				half Angle44_g32723 = -Motion_X216_g31428;
				half Wind_Mode3167_g31428 = TVE_WindMode;
				float3 lerpResult3168_g31428 = lerp( v.vertex.xyz , ( VertexPosRotationAxis50_g32723 + ( VertexPosOtherAxis82_g32723 * cos( Angle44_g32723 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g32723 ) * sin( Angle44_g32723 ) ) ) , Wind_Mode3167_g31428);
				float3 Vertex_Motion_Object833_g31428 = lerpResult3168_g31428;
				float3 temp_output_3474_0_g31428 = ( v.vertex.xyz - Mesh_PivotsOS2291_g31428 );
				float3 appendResult2047_g31428 = (float3(Motion_Rolling138_g31428 , 0.0 , -Motion_Rolling138_g31428));
				float3 appendResult2043_g31428 = (float3(Motion_X216_g31428 , 0.0 , Motion_Z190_g31428));
				float3 lerpResult3173_g31428 = lerp( v.vertex.xyz , ( ( temp_output_3474_0_g31428 + appendResult2047_g31428 ) + appendResult2043_g31428 ) , Wind_Mode3167_g31428);
				float3 Vertex_Motion_World1118_g31428 = lerpResult3173_g31428;
				float3 temp_output_3331_0_g31428 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g31428 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g31428 = Vertex_Motion_Object833_g31428;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g31428 = temp_output_3331_0_g31428;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g31428 = temp_output_3331_0_g31428;
				#else
				float3 staticSwitch3312_g31428 = Vertex_Motion_Object833_g31428;
				#endif
				half3 ObjectData20_g32782 = staticSwitch3312_g31428;
				half3 WorldData19_g32782 = Vertex_Motion_World1118_g31428;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32782 = WorldData19_g32782;
				#else
				float3 staticSwitch14_g32782 = ObjectData20_g32782;
				#endif
				float4x4 break19_g32806 = GetObjectToWorldMatrix();
				float3 appendResult20_g32806 = (float3(break19_g32806[ 0 ][ 3 ] , break19_g32806[ 1 ][ 3 ] , break19_g32806[ 2 ][ 3 ]));
				half3 Off19_g32807 = appendResult20_g32806;
				float4 transform68_g32806 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g32806 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g32806 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g32806 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32806 = ( (transform68_g32806).xyz - (transform62_g32806).xyz );
				half3 On20_g32807 = ObjectPositionWithPivots28_g32806;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32807 = On20_g32807;
				#else
				float3 staticSwitch14_g32807 = Off19_g32807;
				#endif
				half3 ObjectData20_g32808 = staticSwitch14_g32807;
				half3 WorldData19_g32808 = Off19_g32807;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32808 = WorldData19_g32808;
				#else
				float3 staticSwitch14_g32808 = ObjectData20_g32808;
				#endif
				float3 temp_output_42_0_g32806 = staticSwitch14_g32808;
				float temp_output_7_0_g32727 = TVE_SizeFadeEnd;
				float ObjectData20_g32780 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g32806 ) * _GlobalSizeFade ) - temp_output_7_0_g32727 ) / ( TVE_SizeFadeStart - temp_output_7_0_g32727 ) ) );
				float WorldData19_g32780 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32780 = WorldData19_g32780;
				#else
				float staticSwitch14_g32780 = ObjectData20_g32780;
				#endif
				float Vertex_SizeFade1740_g31428 = staticSwitch14_g32780;
				float4x4 break19_g32749 = GetObjectToWorldMatrix();
				float3 appendResult20_g32749 = (float3(break19_g32749[ 0 ][ 3 ] , break19_g32749[ 1 ][ 3 ] , break19_g32749[ 2 ][ 3 ]));
				half3 Off19_g32750 = appendResult20_g32749;
				float4 transform68_g32749 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32749 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32749 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32749 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32749 = ( (transform68_g32749).xyz - (transform62_g32749).xyz );
				half3 On20_g32750 = ObjectPositionWithPivots28_g32749;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32750 = On20_g32750;
				#else
				float3 staticSwitch14_g32750 = Off19_g32750;
				#endif
				half3 ObjectData20_g32751 = staticSwitch14_g32750;
				half3 WorldData19_g32751 = Off19_g32750;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32751 = WorldData19_g32751;
				#else
				float3 staticSwitch14_g32751 = ObjectData20_g32751;
				#endif
				float3 temp_output_42_0_g32749 = staticSwitch14_g32751;
				half3 ObjectData20_g32748 = temp_output_42_0_g32749;
				half3 WorldData19_g32748 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32748 = WorldData19_g32748;
				#else
				float3 staticSwitch14_g32748 = ObjectData20_g32748;
				#endif
				float2 temp_output_43_38_g32746 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32748).xz ) );
				half4 Legacy33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g32746, 0.0 );
				half4 Vegetation33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g32746, 0.0 );
				half4 Grass33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g32746, 0.0 );
				half4 Objects33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g32746, 0.0 );
				half4 Custom33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g32746, 0.0 );
				half4 localUSE_BUFFERS33_g32747 = USE_BUFFERS( Legacy33_g32747 , Vegetation33_g32747 , Grass33_g32747 , Objects33_g32747 , Custom33_g32747 );
				float4 break49_g32746 = localUSE_BUFFERS33_g32747;
				half Global_ExtrasTex_G305_g31428 = break49_g32746.y;
				float lerpResult346_g31428 = lerp( 1.0 , Global_ExtrasTex_G305_g31428 , _GlobalSize);
				float ObjectData20_g32781 = ( lerpResult346_g31428 * _LocalSize );
				float WorldData19_g32781 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32781 = WorldData19_g32781;
				#else
				float staticSwitch14_g32781 = ObjectData20_g32781;
				#endif
				half Vertex_Size1741_g31428 = staticSwitch14_g32781;
				half3 Grass_Coverage2661_g31428 = half3(0,0,0);
				float3 Final_VertexPosition890_g31428 = ( ( staticSwitch14_g32782 * Vertex_SizeFade1740_g31428 * Vertex_Size1741_g31428 ) + Mesh_PivotsOS2291_g31428 + Grass_Coverage2661_g31428 );
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord6 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g31428;
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
				float4 ase_texcoord3 : TEXCOORD3;
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
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

				half2 Main_UVs15_g31428 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g31428 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g31428 );
				float4 temp_output_51_0_g31428 = ( _MainColor * tex2DNode29_g31428 );
				half3 Main_AlbedoRaw99_g31428 = (temp_output_51_0_g31428).rgb;
				half3 Main_AlbedoTinted2808_g31428 = ( float3(1,1,1) * float3(1,1,1) * Main_AlbedoRaw99_g31428 * float3(1,1,1) );
				half3 Main_AlbedoColored863_g31428 = Main_AlbedoTinted2808_g31428;
				float2 appendResult21_g32730 = (float2(IN.ase_texcoord2.z , IN.ase_texcoord2.w));
				float2 Mesh_DetailCoord3_g31428 = appendResult21_g32730;
				half2 Second_UVs17_g31428 = ( ( Mesh_DetailCoord3_g31428 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				float4 tex2DNode3380_g31428 = SAMPLE_TEXTURE2D( _SecondPackedTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				half Packed_Albedo3385_g31428 = tex2DNode3380_g31428.r;
				float4 temp_cast_0 = (Packed_Albedo3385_g31428).xxxx;
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float4 staticSwitch3449_g31428 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float4 staticSwitch3449_g31428 = temp_cast_0;
				#else
				float4 staticSwitch3449_g31428 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				#endif
				half3 Second_Albedo153_g31428 = (( _SecondColor * staticSwitch3449_g31428 )).rgb;
				half3 Second_AlbedoColored1963_g31428 = Second_Albedo153_g31428;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g32741 = 2.0;
				#else
				float staticSwitch1_g32741 = 4.594794;
				#endif
				half Mesh_DetailMask90_g31428 = IN.ase_color.b;
				float temp_output_989_0_g31428 = ( ( Mesh_DetailMask90_g31428 - 0.5 ) + _DetailMeshValue );
				half Blend_Source1540_g31428 = temp_output_989_0_g31428;
				float4 tex2DNode35_g31428 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g31428 );
				half Main_Mask_Raw57_g31428 = tex2DNode35_g31428.b;
				float4 tex2DNode33_g31428 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				half Second_Mask81_g31428 = tex2DNode33_g31428.b;
				float lerpResult1327_g31428 = lerp( Main_Mask_Raw57_g31428 , Second_Mask81_g31428 , _DetailMaskMode);
				float temp_output_7_0_g32739 = _DetailMaskContrast;
				float temp_output_973_0_g31428 = saturate( ( ( saturate( ( Blend_Source1540_g31428 + ( Blend_Source1540_g31428 * ( ( ( 1.0 - lerpResult1327_g31428 ) - 0.5 ) + _DetailMaskValue ) ) ) ) - temp_output_7_0_g32739 ) / ( ( 1.0 - _DetailMaskContrast ) - temp_output_7_0_g32739 ) ) );
				half Mask_Detail147_g31428 = temp_output_973_0_g31428;
				float3 lerpResult235_g31428 = lerp( Main_AlbedoColored863_g31428 , ( Main_AlbedoColored863_g31428 * Second_AlbedoColored1963_g31428 * staticSwitch1_g32741 ) , Mask_Detail147_g31428);
				float3 lerpResult208_g31428 = lerp( Main_AlbedoColored863_g31428 , Second_AlbedoColored1963_g31428 , Mask_Detail147_g31428);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch255_g31428 = Main_AlbedoColored863_g31428;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch255_g31428 = lerpResult235_g31428;
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch255_g31428 = lerpResult208_g31428;
				#else
				float3 staticSwitch255_g31428 = Main_AlbedoColored863_g31428;
				#endif
				half3 Blend_Albedo265_g31428 = staticSwitch255_g31428;
				half3 Blend_AlbedoAndSubsurface149_g31428 = Blend_Albedo265_g31428;
				half3 Global_OverlayColor1758_g31428 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g31428 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g31428 );
				float2 appendResult88_g32731 = (float2(tex2DNode117_g31428.a , tex2DNode117_g31428.g));
				float2 temp_output_90_0_g32731 = ( (appendResult88_g32731*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g32731 = (float3(temp_output_90_0_g32731 , 1.0));
				half3 Main_Normal137_g31428 = appendResult91_g32731;
				float4 tex2DNode145_g31428 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				float2 appendResult88_g32757 = (float2(tex2DNode145_g31428.a , tex2DNode145_g31428.g));
				float2 temp_output_90_0_g32757 = ( (appendResult88_g32757*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32757 = (float3(temp_output_90_0_g32757 , 1.0));
				half Packed_NormalX3387_g31428 = tex2DNode3380_g31428.a;
				half Packed_NormalY3386_g31428 = tex2DNode3380_g31428.g;
				float2 appendResult88_g32734 = (float2(Packed_NormalX3387_g31428 , Packed_NormalY3386_g31428));
				float2 temp_output_90_0_g32734 = ( (appendResult88_g32734*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32734 = (float3(temp_output_90_0_g32734 , 1.0));
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float3 staticSwitch3450_g31428 = appendResult91_g32757;
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float3 staticSwitch3450_g31428 = appendResult91_g32734;
				#else
				float3 staticSwitch3450_g31428 = appendResult91_g32757;
				#endif
				half3 Second_Normal179_g31428 = staticSwitch3450_g31428;
				float3 lerpResult230_g31428 = lerp( float3( 0,0,1 ) , Second_Normal179_g31428 , Mask_Detail147_g31428);
				float3 lerpResult3372_g31428 = lerp( float3( 0,0,1 ) , Main_Normal137_g31428 , _DetailNormalValue);
				float3 lerpResult3376_g31428 = lerp( Main_Normal137_g31428 , BlendNormal( lerpResult3372_g31428 , Second_Normal179_g31428 ) , Mask_Detail147_g31428);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch267_g31428 = Main_Normal137_g31428;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch267_g31428 = BlendNormal( Main_Normal137_g31428 , lerpResult230_g31428 );
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch267_g31428 = lerpResult3376_g31428;
				#else
				float3 staticSwitch267_g31428 = Main_Normal137_g31428;
				#endif
				half3 Blend_NormalRaw1051_g31428 = staticSwitch267_g31428;
				float3 switchResult1063_g31428 = (((ase_vface>0)?(Blend_NormalRaw1051_g31428):(( Blend_NormalRaw1051_g31428 * float3(-1,-1,-1) ))));
				half Overlay_Contrast1405_g31428 = _OverlayContrastValue;
				float3 appendResult1439_g31428 = (float3(Overlay_Contrast1405_g31428 , Overlay_Contrast1405_g31428 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal178_g31428 = ( switchResult1063_g31428 * appendResult1439_g31428 );
				float3 worldNormal178_g31428 = float3(dot(tanToWorld0,tanNormal178_g31428), dot(tanToWorld1,tanNormal178_g31428), dot(tanToWorld2,tanNormal178_g31428));
				half Global_OverlayIntensity154_g31428 = TVE_OverlayIntensity;
				float4x4 break19_g32749 = GetObjectToWorldMatrix();
				float3 appendResult20_g32749 = (float3(break19_g32749[ 0 ][ 3 ] , break19_g32749[ 1 ][ 3 ] , break19_g32749[ 2 ][ 3 ]));
				half3 Off19_g32750 = appendResult20_g32749;
				float4 transform68_g32749 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord6);
				float3 appendResult95_g32749 = (float3(IN.ase_texcoord2.z , 0.0 , IN.ase_texcoord2.w));
				float4 transform62_g32749 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord6.xyz - ( appendResult95_g32749 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32749 = ( (transform68_g32749).xyz - (transform62_g32749).xyz );
				half3 On20_g32750 = ObjectPositionWithPivots28_g32749;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32750 = On20_g32750;
				#else
				float3 staticSwitch14_g32750 = Off19_g32750;
				#endif
				half3 ObjectData20_g32751 = staticSwitch14_g32750;
				half3 WorldData19_g32751 = Off19_g32750;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32751 = WorldData19_g32751;
				#else
				float3 staticSwitch14_g32751 = ObjectData20_g32751;
				#endif
				float3 temp_output_42_0_g32749 = staticSwitch14_g32751;
				half3 ObjectData20_g32748 = temp_output_42_0_g32749;
				half3 WorldData19_g32748 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32748 = WorldData19_g32748;
				#else
				float3 staticSwitch14_g32748 = ObjectData20_g32748;
				#endif
				float2 temp_output_43_38_g32746 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32748).xz ) );
				half4 Legacy33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g32746 );
				half4 Vegetation33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g32746 );
				half4 Grass33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g32746 );
				half4 Objects33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g32746 );
				half4 Custom33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g32746 );
				half4 localUSE_BUFFERS33_g32747 = USE_BUFFERS( Legacy33_g32747 , Vegetation33_g32747 , Grass33_g32747 , Objects33_g32747 , Custom33_g32747 );
				float4 break49_g32746 = localUSE_BUFFERS33_g32747;
				half Global_ExtrasTex_B156_g31428 = break49_g32746.z;
				float temp_output_1025_0_g31428 = ( Global_OverlayIntensity154_g31428 * _GlobalOverlay * Global_ExtrasTex_B156_g31428 );
				half Overlay_Commons1365_g31428 = temp_output_1025_0_g31428;
				half Overlay_Mask269_g31428 = saturate( ( saturate( worldNormal178_g31428.y ) - ( 1.0 - Overlay_Commons1365_g31428 ) ) );
				float3 lerpResult336_g31428 = lerp( Blend_AlbedoAndSubsurface149_g31428 , Global_OverlayColor1758_g31428 , Overlay_Mask269_g31428);
				half3 Final_Albedo359_g31428 = lerpResult336_g31428;
				half Main_Alpha316_g31428 = (temp_output_51_0_g31428).a;
				float lerpResult354_g31428 = lerp( 1.0 , Main_Alpha316_g31428 , _render_premul);
				half Final_Premultiply355_g31428 = lerpResult354_g31428;
				float3 temp_output_410_0_g31428 = ( Final_Albedo359_g31428 * Final_Premultiply355_g31428 );
				float3 temp_cast_7 = (1.0).xxx;
				half Mesh_Occlusion318_g31428 = IN.ase_color.g;
				float saferPower1201_g31428 = max( Mesh_Occlusion318_g31428 , 0.0001 );
				float3 lerpResult2945_g31428 = lerp( (_VertexOcclusionColor).rgb , temp_cast_7 , saturate( pow( saferPower1201_g31428 , ( _VertexOcclusionValue + _OcclusionCat ) ) ));
				half3 Vertex_Occlusion648_g31428 = lerpResult2945_g31428;
				
				float localCustomAlphaClip9_g32759 = ( 0.0 );
				half Main_AlphaRaw1203_g31428 = tex2DNode29_g31428.a;
				half Alpha5_g32759 = Main_AlphaRaw1203_g31428;
				float Alpha9_g32759 = Alpha5_g32759;
				#if _ALPHATEST_ON
				clip(Alpha9_g32759 - _Cutoff);
				#endif
				half Final_Clip914_g31428 = localCustomAlphaClip9_g32759;
				
				
				float3 Albedo = ( temp_output_410_0_g31428 * Vertex_Occlusion648_g31428 );
				float3 Emission = 0;
				float Alpha = Main_Alpha316_g31428;
				float AlphaClipThreshold = Final_Clip914_g31428;

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
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _ALPHATEST_ON 1
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
			
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#pragma shader_feature_local TVE_DETAIL_MODE_OFF TVE_DETAIL_MODE_OVERLAY TVE_DETAIL_MODE_REPLACE
			#pragma shader_feature_local TVE_DETAIL_MAPS_STANDARD TVE_DETAIL_MAPS_PACKED
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#define TVE_IS_VEGETATION_SHADER


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
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
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _Color;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			half3 _render_normals_options;
			half _VertexMotionSpace;
			half _VertexCat;
			half _InteractionVariation;
			half _Motion_Interaction;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _Motion_10;
			half _VertexMotionMode;
			half _MotionAmplitude_10;
			float _MotionScale_20;
			half _MotionVariation_20;
			float _MotionSpeed_20;
			half _Motion_20;
			half _vertex_pivot_mode;
			half _MotionAmplitude_20;
			half _render_cutoff;
			half _IsBarkShader;
			float _MotionSpeed_10;
			half _VertexDataMode;
			half _IsLitShader;
			half _GlobalSize;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			half _OcclusionCat;
			half _VertexOcclusionValue;
			half _render_premul;
			half _GlobalSizeFade;
			half _GlobalOverlay;
			half _DetailNormalValue;
			half _SecondNormalValue;
			half _DetailMaskContrast;
			half _DetailMaskValue;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _IsStandardShader;
			half _LocalSize;
			half _OverlayContrastValue;
			half _IsAnyPathShader;
			half _render_cull;
			half _render_dst;
			half _DetailTypeMode;
			half _AdvancedCat;
			half _DetailCat;
			half _RenderZWrite;
			half _RenderBlend;
			half _RenderNormals;
			half _RenderCull;
			half _MainCat;
			half _DetailMode;
			half _PivotsMessage;
			half _DetailMapsMode;
			half _RenderMode;
			half _VertexVariationMode;
			half _RenderPriority;
			half _IsVersion;
			half _IsTVEShader;
			half _RenderingCat;
			half _Cutoff;
			half _RenderClip;
			half _MainNormalValue;
			half _GlobalCat;
			half _DetailSpace;
			half _GlobalSpace;
			float _render_normals;
			half _MainOcclusionValue;
			half _Banner;
			half _render_zw;
			float _OverlayContrast;
			half _BatchingMessage;
			half _ObjectDataMessage;
			half _WorldDataMessage;
			half _MaskMode;
			float _GrassPerspectivePushValue;
			float _material_batching;
			float _ObjectSmoothnessValue;
			float _OverlayVariation;
			float _GrassPerspectiveAngleValue;
			float _ObjectMetallicValue;
			float _GrassPerspectiveNoiseValue;
			float _ObjectOcclusionValue;
			float _render_priority;
			float _render_mode;
			float _SubsurfaceMinValue;
			float _SubsurfaceMaxValue;
			float _render_blend;
			half _render_src;
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
			TEXTURE2D(TVE_MotionTex);
			half4 TVE_VolumeCoord;
			SAMPLER(samplerTVE_MotionTex);
			TEXTURE2D(TVE_MotionTex_Vegetation);
			SAMPLER(samplerTVE_MotionTex_Vegetation);
			TEXTURE2D(TVE_MotionTex_Grass);
			SAMPLER(samplerTVE_MotionTex_Grass);
			TEXTURE2D(TVE_MotionTex_Objects);
			SAMPLER(samplerTVE_MotionTex_Objects);
			TEXTURE2D(TVE_MotionTex_User);
			SAMPLER(samplerTVE_MotionTex_User);
			half TVE_WindPower;
			TEXTURE2D(TVE_NoiseTex);
			float2 TVE_NoiseSpeed_Vegetation;
			float2 TVE_NoiseSpeed_Grass;
			half TVE_NoiseSize_Vegetation;
			half TVE_NoiseSize_Grass;
			SAMPLER(samplerTVE_NoiseTex);
			half TVE_NoiseContrast;
			half TVE_WindMode;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			TEXTURE2D(TVE_ExtrasTex);
			SAMPLER(samplerTVE_ExtrasTex);
			TEXTURE2D(TVE_ExtrasTex_Vegetation);
			SAMPLER(samplerTVE_ExtrasTex_Vegetation);
			TEXTURE2D(TVE_ExtrasTex_Grass);
			SAMPLER(samplerTVE_ExtrasTex_Grass);
			TEXTURE2D(TVE_ExtrasTex_Objects);
			SAMPLER(samplerTVE_ExtrasTex_Objects);
			TEXTURE2D(TVE_ExtrasTex_User);
			SAMPLER(samplerTVE_ExtrasTex_User);
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

				half3 _Vector1 = half3(0,0,0);
				half3 Mesh_PivotsOS2291_g31428 = _Vector1;
				float3 temp_output_2283_0_g31428 = ( v.vertex.xyz - Mesh_PivotsOS2291_g31428 );
				half3 VertexPos40_g32728 = temp_output_2283_0_g31428;
				float3 appendResult74_g32728 = (float3(0.0 , VertexPos40_g32728.y , 0.0));
				float3 VertexPosRotationAxis50_g32728 = appendResult74_g32728;
				float3 break84_g32728 = VertexPos40_g32728;
				float3 appendResult81_g32728 = (float3(break84_g32728.x , 0.0 , break84_g32728.z));
				float3 VertexPosOtherAxis82_g32728 = appendResult81_g32728;
				half MotionAmplitude203095_g31428 = _MotionAmplitude_20;
				float ObjectData20_g32813 = 3.14;
				float Bounds_Radius121_g31428 = _MaxBoundsInfo.x;
				float WorldData19_g32813 = Bounds_Radius121_g31428;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32813 = WorldData19_g32813;
				#else
				float staticSwitch14_g32813 = ObjectData20_g32813;
				#endif
				float Motion_Max_Rolling1137_g31428 = staticSwitch14_g32813;
				float4x4 break19_g32771 = GetObjectToWorldMatrix();
				float3 appendResult20_g32771 = (float3(break19_g32771[ 0 ][ 3 ] , break19_g32771[ 1 ][ 3 ] , break19_g32771[ 2 ][ 3 ]));
				half3 Off19_g32772 = appendResult20_g32771;
				float4 transform68_g32771 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g32771 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g32771 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g32771 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32771 = ( (transform68_g32771).xyz - (transform62_g32771).xyz );
				half3 On20_g32772 = ObjectPositionWithPivots28_g32771;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32772 = On20_g32772;
				#else
				float3 staticSwitch14_g32772 = Off19_g32772;
				#endif
				half3 ObjectData20_g32773 = staticSwitch14_g32772;
				half3 WorldData19_g32773 = Off19_g32772;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32773 = WorldData19_g32773;
				#else
				float3 staticSwitch14_g32773 = ObjectData20_g32773;
				#endif
				float3 temp_output_42_0_g32771 = staticSwitch14_g32773;
				half3 ObjectData20_g32776 = temp_output_42_0_g32771;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g32776 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32776 = WorldData19_g32776;
				#else
				float3 staticSwitch14_g32776 = ObjectData20_g32776;
				#endif
				float2 temp_output_39_38_g32769 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32776).xz ) );
				half4 Legacy33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, temp_output_39_38_g32769, 0.0 );
				half4 Vegetation33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Vegetation, samplerTVE_MotionTex_Vegetation, temp_output_39_38_g32769, 0.0 );
				half4 Grass33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Grass, samplerTVE_MotionTex_Grass, temp_output_39_38_g32769, 0.0 );
				half4 Objects33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Objects, samplerTVE_MotionTex_Objects, temp_output_39_38_g32769, 0.0 );
				half4 Custom33_g32777 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_User, samplerTVE_MotionTex_User, temp_output_39_38_g32769, 0.0 );
				half4 localUSE_BUFFERS33_g32777 = USE_BUFFERS( Legacy33_g32777 , Vegetation33_g32777 , Grass33_g32777 , Objects33_g32777 , Custom33_g32777 );
				float4 break322_g32778 = localUSE_BUFFERS33_g32777;
				half Wind_Power369_g32778 = saturate( ( (break322_g32778.z*2.0 + -1.0) + TVE_WindPower ) );
				float lerpResult376_g32778 = lerp( 0.1 , 1.0 , Wind_Power369_g32778);
				half Wind_Power_203109_g31428 = lerpResult376_g32778;
				half Mesh_Motion_260_g31428 = v.ase_texcoord3.y;
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch160_g32799 = TVE_NoiseSpeed_Grass;
				#else
				float2 staticSwitch160_g32799 = TVE_NoiseSpeed_Vegetation;
				#endif
				float4x4 break19_g32801 = GetObjectToWorldMatrix();
				float3 appendResult20_g32801 = (float3(break19_g32801[ 0 ][ 3 ] , break19_g32801[ 1 ][ 3 ] , break19_g32801[ 2 ][ 3 ]));
				half3 Off19_g32802 = appendResult20_g32801;
				float4 transform68_g32801 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32801 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32801 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32801 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32801 = ( (transform68_g32801).xyz - (transform62_g32801).xyz );
				half3 On20_g32802 = ObjectPositionWithPivots28_g32801;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32802 = On20_g32802;
				#else
				float3 staticSwitch14_g32802 = Off19_g32802;
				#endif
				half3 ObjectData20_g32803 = staticSwitch14_g32802;
				half3 WorldData19_g32803 = Off19_g32802;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32803 = WorldData19_g32803;
				#else
				float3 staticSwitch14_g32803 = ObjectData20_g32803;
				#endif
				float3 temp_output_42_0_g32801 = staticSwitch14_g32803;
				half3 ObjectData20_g32800 = temp_output_42_0_g32801;
				half3 WorldData19_g32800 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32800 = WorldData19_g32800;
				#else
				float3 staticSwitch14_g32800 = ObjectData20_g32800;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch164_g32799 = (ase_worldPos).xz;
				#else
				float2 staticSwitch164_g32799 = (staticSwitch14_g32800).xz;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float staticSwitch161_g32799 = TVE_NoiseSize_Grass;
				#else
				float staticSwitch161_g32799 = TVE_NoiseSize_Vegetation;
				#endif
				float2 panner73_g32799 = ( _TimeParameters.x * staticSwitch160_g32799 + ( staticSwitch164_g32799 * staticSwitch161_g32799 ));
				float4 tex2DNode75_g32799 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g32799, 0.0 );
				float4 saferPower77_g32799 = max( abs( tex2DNode75_g32799 ) , 0.0001 );
				float4 temp_cast_7 = (TVE_NoiseContrast).xxxx;
				float4 break142_g32799 = pow( saferPower77_g32799 , temp_cast_7 );
				half Global_NoiseTex_R34_g31428 = break142_g32799.r;
				half Motion_Use20162_g31428 = _Motion_20;
				float4x4 break19_g32763 = GetObjectToWorldMatrix();
				float3 appendResult20_g32763 = (float3(break19_g32763[ 0 ][ 3 ] , break19_g32763[ 1 ][ 3 ] , break19_g32763[ 2 ][ 3 ]));
				half3 Off19_g32764 = appendResult20_g32763;
				float4 transform68_g32763 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32763 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32763 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32763 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32763 = ( (transform68_g32763).xyz - (transform62_g32763).xyz );
				half3 On20_g32764 = ObjectPositionWithPivots28_g32763;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32764 = On20_g32764;
				#else
				float3 staticSwitch14_g32764 = Off19_g32764;
				#endif
				half3 ObjectData20_g32765 = staticSwitch14_g32764;
				half3 WorldData19_g32765 = Off19_g32764;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32765 = WorldData19_g32765;
				#else
				float3 staticSwitch14_g32765 = ObjectData20_g32765;
				#endif
				float3 temp_output_42_0_g32763 = staticSwitch14_g32765;
				float3 break9_g32763 = temp_output_42_0_g32763;
				half Variation_Complex102_g32760 = frac( ( v.ase_color.r + ( break9_g32763.x + break9_g32763.z ) ) );
				float ObjectData20_g32762 = Variation_Complex102_g32760;
				half Variation_Simple105_g32760 = v.ase_color.r;
				float WorldData19_g32762 = Variation_Simple105_g32760;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32762 = WorldData19_g32762;
				#else
				float staticSwitch14_g32762 = ObjectData20_g32762;
				#endif
				half Variation3073_g31428 = staticSwitch14_g32762;
				float temp_output_116_0_g32733 = Variation3073_g31428;
				float mulTime98_g32733 = _TimeParameters.x * 0.5;
				float lerpResult110_g32733 = lerp( ( ceil( saturate( ( frac( ( temp_output_116_0_g32733 + 0.3576 ) ) - 0.5 ) ) ) * 0.5 ) , ceil( saturate( ( frac( ( temp_output_116_0_g32733 + 0.1258 ) ) - 0.8 ) ) ) , (sin( mulTime98_g32733 )*0.5 + 0.5));
				half Wind_Power2223_g31428 = Wind_Power369_g32778;
				float lerpResult118_g32733 = lerp( 0.25 , 0.75 , Wind_Power2223_g31428);
				float lerpResult111_g32733 = lerp( lerpResult110_g32733 , 1.0 , ( lerpResult118_g32733 * lerpResult118_g32733 * lerpResult118_g32733 * lerpResult118_g32733 ));
				half Motion_Selective3182_g31428 = lerpResult111_g32733;
				half Input_Speed62_g32792 = _MotionSpeed_20;
				float mulTime354_g32792 = _TimeParameters.x * Input_Speed62_g32792;
				float temp_output_342_0_g32792 = ( ( _MotionVariation_20 * Variation3073_g31428 ) * v.ase_color.r );
				float4x4 break19_g32793 = GetObjectToWorldMatrix();
				float3 appendResult20_g32793 = (float3(break19_g32793[ 0 ][ 3 ] , break19_g32793[ 1 ][ 3 ] , break19_g32793[ 2 ][ 3 ]));
				half3 Off19_g32794 = appendResult20_g32793;
				float4 transform68_g32793 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32793 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32793 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32793 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32793 = ( (transform68_g32793).xyz - (transform62_g32793).xyz );
				half3 On20_g32794 = ObjectPositionWithPivots28_g32793;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32794 = On20_g32794;
				#else
				float3 staticSwitch14_g32794 = Off19_g32794;
				#endif
				half3 ObjectData20_g32795 = staticSwitch14_g32794;
				half3 WorldData19_g32795 = Off19_g32794;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32795 = WorldData19_g32795;
				#else
				float3 staticSwitch14_g32795 = ObjectData20_g32795;
				#endif
				float3 temp_output_42_0_g32793 = staticSwitch14_g32795;
				float3 break9_g32793 = temp_output_42_0_g32793;
				float ObjectData20_g32798 = ( temp_output_342_0_g32792 + ( break9_g32793.x + break9_g32793.z ) );
				float WorldData19_g32798 = temp_output_342_0_g32792;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32798 = WorldData19_g32798;
				#else
				float staticSwitch14_g32798 = ObjectData20_g32798;
				#endif
				float Motion_Variation284_g32792 = staticSwitch14_g32798;
				float Motion_Scale287_g32792 = ( _MotionScale_20 * ase_worldPos.x );
				half Motion_Rolling138_g31428 = ( ( MotionAmplitude203095_g31428 * Motion_Max_Rolling1137_g31428 ) * ( Wind_Power_203109_g31428 * Mesh_Motion_260_g31428 * Global_NoiseTex_R34_g31428 * Motion_Use20162_g31428 * Motion_Selective3182_g31428 ) * sin( ( mulTime354_g32792 + Motion_Variation284_g32792 + Motion_Scale287_g32792 ) ) );
				half Angle44_g32728 = Motion_Rolling138_g31428;
				half3 VertexPos40_g32740 = ( VertexPosRotationAxis50_g32728 + ( VertexPosOtherAxis82_g32728 * cos( Angle44_g32728 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g32728 ) * sin( Angle44_g32728 ) ) );
				float3 appendResult74_g32740 = (float3(VertexPos40_g32740.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g32740 = appendResult74_g32740;
				float3 break84_g32740 = VertexPos40_g32740;
				float3 appendResult81_g32740 = (float3(0.0 , break84_g32740.y , break84_g32740.z));
				half3 VertexPosOtherAxis82_g32740 = appendResult81_g32740;
				float ObjectData20_g32815 = 3.14;
				float Bounds_Height374_g31428 = _MaxBoundsInfo.y;
				float WorldData19_g32815 = ( Bounds_Height374_g31428 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32815 = WorldData19_g32815;
				#else
				float staticSwitch14_g32815 = ObjectData20_g32815;
				#endif
				float Motion_Max_Bending1133_g31428 = staticSwitch14_g32815;
				half Wind_Power_103106_g31428 = Wind_Power369_g32778;
				float3 appendResult323_g32778 = (float3(break322_g32778.x , 0.0 , break322_g32778.y));
				float3 temp_output_324_0_g32778 = (appendResult323_g32778*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g32778 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g32778 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g31428 = (temp_output_339_0_g32778).xz;
				half Motion_Use1056_g31428 = _Motion_10;
				half Input_Speed62_g32735 = _MotionSpeed_10;
				float mulTime373_g32735 = _TimeParameters.x * Input_Speed62_g32735;
				half Motion_Variation284_g32735 = ( _MotionVariation_10 * Variation3073_g31428 );
				float2 appendResult344_g32735 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g32735 = ( _MotionScale_10 * appendResult344_g32735 );
				half2 Sine_MinusOneToOne281_g32735 = sin( ( mulTime373_g32735 + Motion_Variation284_g32735 + Motion_Scale287_g32735 ) );
				float2 temp_cast_12 = (1.0).xx;
				half Input_Turbulence327_g32735 = Global_NoiseTex_R34_g31428;
				float2 lerpResult321_g32735 = lerp( Sine_MinusOneToOne281_g32735 , temp_cast_12 , Input_Turbulence327_g32735);
				half2 Motion_Bending2258_g31428 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g31428 ) * Wind_Power_103106_g31428 * Wind_DirectionOS39_g31428 * Motion_Use1056_g31428 * Global_NoiseTex_R34_g31428 * lerpResult321_g32735 );
				half Motion_UseInteraction2097_g31428 = _Motion_Interaction;
				half Motion_InteractionMask66_g31428 = break322_g32778.w;
				float lerpResult3307_g31428 = lerp( 1.0 , Variation3073_g31428 , _InteractionVariation);
				half2 Motion_Interaction53_g31428 = ( _InteractionAmplitude * Motion_Max_Bending1133_g31428 * Motion_UseInteraction2097_g31428 * Motion_InteractionMask66_g31428 * Motion_InteractionMask66_g31428 * Wind_DirectionOS39_g31428 * lerpResult3307_g31428 );
				float2 lerpResult109_g31428 = lerp( Motion_Bending2258_g31428 , Motion_Interaction53_g31428 , Motion_InteractionMask66_g31428);
				half Mesh_Motion_182_g31428 = v.ase_texcoord3.x;
				float2 break143_g31428 = ( lerpResult109_g31428 * Mesh_Motion_182_g31428 );
				half Motion_Z190_g31428 = break143_g31428.y;
				half Angle44_g32740 = Motion_Z190_g31428;
				half3 VertexPos40_g32723 = ( VertexPosRotationAxis50_g32740 + ( VertexPosOtherAxis82_g32740 * cos( Angle44_g32740 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g32740 ) * sin( Angle44_g32740 ) ) );
				float3 appendResult74_g32723 = (float3(0.0 , 0.0 , VertexPos40_g32723.z));
				half3 VertexPosRotationAxis50_g32723 = appendResult74_g32723;
				float3 break84_g32723 = VertexPos40_g32723;
				float3 appendResult81_g32723 = (float3(break84_g32723.x , break84_g32723.y , 0.0));
				half3 VertexPosOtherAxis82_g32723 = appendResult81_g32723;
				half Motion_X216_g31428 = break143_g31428.x;
				half Angle44_g32723 = -Motion_X216_g31428;
				half Wind_Mode3167_g31428 = TVE_WindMode;
				float3 lerpResult3168_g31428 = lerp( v.vertex.xyz , ( VertexPosRotationAxis50_g32723 + ( VertexPosOtherAxis82_g32723 * cos( Angle44_g32723 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g32723 ) * sin( Angle44_g32723 ) ) ) , Wind_Mode3167_g31428);
				float3 Vertex_Motion_Object833_g31428 = lerpResult3168_g31428;
				float3 temp_output_3474_0_g31428 = ( v.vertex.xyz - Mesh_PivotsOS2291_g31428 );
				float3 appendResult2047_g31428 = (float3(Motion_Rolling138_g31428 , 0.0 , -Motion_Rolling138_g31428));
				float3 appendResult2043_g31428 = (float3(Motion_X216_g31428 , 0.0 , Motion_Z190_g31428));
				float3 lerpResult3173_g31428 = lerp( v.vertex.xyz , ( ( temp_output_3474_0_g31428 + appendResult2047_g31428 ) + appendResult2043_g31428 ) , Wind_Mode3167_g31428);
				float3 Vertex_Motion_World1118_g31428 = lerpResult3173_g31428;
				float3 temp_output_3331_0_g31428 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g31428 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g31428 = Vertex_Motion_Object833_g31428;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g31428 = temp_output_3331_0_g31428;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g31428 = temp_output_3331_0_g31428;
				#else
				float3 staticSwitch3312_g31428 = Vertex_Motion_Object833_g31428;
				#endif
				half3 ObjectData20_g32782 = staticSwitch3312_g31428;
				half3 WorldData19_g32782 = Vertex_Motion_World1118_g31428;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32782 = WorldData19_g32782;
				#else
				float3 staticSwitch14_g32782 = ObjectData20_g32782;
				#endif
				float4x4 break19_g32806 = GetObjectToWorldMatrix();
				float3 appendResult20_g32806 = (float3(break19_g32806[ 0 ][ 3 ] , break19_g32806[ 1 ][ 3 ] , break19_g32806[ 2 ][ 3 ]));
				half3 Off19_g32807 = appendResult20_g32806;
				float4 transform68_g32806 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g32806 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g32806 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g32806 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32806 = ( (transform68_g32806).xyz - (transform62_g32806).xyz );
				half3 On20_g32807 = ObjectPositionWithPivots28_g32806;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32807 = On20_g32807;
				#else
				float3 staticSwitch14_g32807 = Off19_g32807;
				#endif
				half3 ObjectData20_g32808 = staticSwitch14_g32807;
				half3 WorldData19_g32808 = Off19_g32807;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32808 = WorldData19_g32808;
				#else
				float3 staticSwitch14_g32808 = ObjectData20_g32808;
				#endif
				float3 temp_output_42_0_g32806 = staticSwitch14_g32808;
				float temp_output_7_0_g32727 = TVE_SizeFadeEnd;
				float ObjectData20_g32780 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g32806 ) * _GlobalSizeFade ) - temp_output_7_0_g32727 ) / ( TVE_SizeFadeStart - temp_output_7_0_g32727 ) ) );
				float WorldData19_g32780 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32780 = WorldData19_g32780;
				#else
				float staticSwitch14_g32780 = ObjectData20_g32780;
				#endif
				float Vertex_SizeFade1740_g31428 = staticSwitch14_g32780;
				float4x4 break19_g32749 = GetObjectToWorldMatrix();
				float3 appendResult20_g32749 = (float3(break19_g32749[ 0 ][ 3 ] , break19_g32749[ 1 ][ 3 ] , break19_g32749[ 2 ][ 3 ]));
				half3 Off19_g32750 = appendResult20_g32749;
				float4 transform68_g32749 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g32749 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g32749 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g32749 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32749 = ( (transform68_g32749).xyz - (transform62_g32749).xyz );
				half3 On20_g32750 = ObjectPositionWithPivots28_g32749;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32750 = On20_g32750;
				#else
				float3 staticSwitch14_g32750 = Off19_g32750;
				#endif
				half3 ObjectData20_g32751 = staticSwitch14_g32750;
				half3 WorldData19_g32751 = Off19_g32750;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32751 = WorldData19_g32751;
				#else
				float3 staticSwitch14_g32751 = ObjectData20_g32751;
				#endif
				float3 temp_output_42_0_g32749 = staticSwitch14_g32751;
				half3 ObjectData20_g32748 = temp_output_42_0_g32749;
				half3 WorldData19_g32748 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32748 = WorldData19_g32748;
				#else
				float3 staticSwitch14_g32748 = ObjectData20_g32748;
				#endif
				float2 temp_output_43_38_g32746 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32748).xz ) );
				half4 Legacy33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g32746, 0.0 );
				half4 Vegetation33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g32746, 0.0 );
				half4 Grass33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g32746, 0.0 );
				half4 Objects33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g32746, 0.0 );
				half4 Custom33_g32747 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g32746, 0.0 );
				half4 localUSE_BUFFERS33_g32747 = USE_BUFFERS( Legacy33_g32747 , Vegetation33_g32747 , Grass33_g32747 , Objects33_g32747 , Custom33_g32747 );
				float4 break49_g32746 = localUSE_BUFFERS33_g32747;
				half Global_ExtrasTex_G305_g31428 = break49_g32746.y;
				float lerpResult346_g31428 = lerp( 1.0 , Global_ExtrasTex_G305_g31428 , _GlobalSize);
				float ObjectData20_g32781 = ( lerpResult346_g31428 * _LocalSize );
				float WorldData19_g32781 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32781 = WorldData19_g32781;
				#else
				float staticSwitch14_g32781 = ObjectData20_g32781;
				#endif
				half Vertex_Size1741_g31428 = staticSwitch14_g32781;
				half3 Grass_Coverage2661_g31428 = half3(0,0,0);
				float3 Final_VertexPosition890_g31428 = ( ( staticSwitch14_g32782 * Vertex_SizeFade1740_g31428 * Vertex_Size1741_g31428 ) + Mesh_PivotsOS2291_g31428 + Grass_Coverage2661_g31428 );
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord6 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g31428;
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
				float4 ase_texcoord3 : TEXCOORD3;
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
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

				half2 Main_UVs15_g31428 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g31428 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g31428 );
				float4 temp_output_51_0_g31428 = ( _MainColor * tex2DNode29_g31428 );
				half3 Main_AlbedoRaw99_g31428 = (temp_output_51_0_g31428).rgb;
				half3 Main_AlbedoTinted2808_g31428 = ( float3(1,1,1) * float3(1,1,1) * Main_AlbedoRaw99_g31428 * float3(1,1,1) );
				half3 Main_AlbedoColored863_g31428 = Main_AlbedoTinted2808_g31428;
				float2 appendResult21_g32730 = (float2(IN.ase_texcoord2.z , IN.ase_texcoord2.w));
				float2 Mesh_DetailCoord3_g31428 = appendResult21_g32730;
				half2 Second_UVs17_g31428 = ( ( Mesh_DetailCoord3_g31428 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				float4 tex2DNode3380_g31428 = SAMPLE_TEXTURE2D( _SecondPackedTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				half Packed_Albedo3385_g31428 = tex2DNode3380_g31428.r;
				float4 temp_cast_0 = (Packed_Albedo3385_g31428).xxxx;
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float4 staticSwitch3449_g31428 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float4 staticSwitch3449_g31428 = temp_cast_0;
				#else
				float4 staticSwitch3449_g31428 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				#endif
				half3 Second_Albedo153_g31428 = (( _SecondColor * staticSwitch3449_g31428 )).rgb;
				half3 Second_AlbedoColored1963_g31428 = Second_Albedo153_g31428;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g32741 = 2.0;
				#else
				float staticSwitch1_g32741 = 4.594794;
				#endif
				half Mesh_DetailMask90_g31428 = IN.ase_color.b;
				float temp_output_989_0_g31428 = ( ( Mesh_DetailMask90_g31428 - 0.5 ) + _DetailMeshValue );
				half Blend_Source1540_g31428 = temp_output_989_0_g31428;
				float4 tex2DNode35_g31428 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g31428 );
				half Main_Mask_Raw57_g31428 = tex2DNode35_g31428.b;
				float4 tex2DNode33_g31428 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				half Second_Mask81_g31428 = tex2DNode33_g31428.b;
				float lerpResult1327_g31428 = lerp( Main_Mask_Raw57_g31428 , Second_Mask81_g31428 , _DetailMaskMode);
				float temp_output_7_0_g32739 = _DetailMaskContrast;
				float temp_output_973_0_g31428 = saturate( ( ( saturate( ( Blend_Source1540_g31428 + ( Blend_Source1540_g31428 * ( ( ( 1.0 - lerpResult1327_g31428 ) - 0.5 ) + _DetailMaskValue ) ) ) ) - temp_output_7_0_g32739 ) / ( ( 1.0 - _DetailMaskContrast ) - temp_output_7_0_g32739 ) ) );
				half Mask_Detail147_g31428 = temp_output_973_0_g31428;
				float3 lerpResult235_g31428 = lerp( Main_AlbedoColored863_g31428 , ( Main_AlbedoColored863_g31428 * Second_AlbedoColored1963_g31428 * staticSwitch1_g32741 ) , Mask_Detail147_g31428);
				float3 lerpResult208_g31428 = lerp( Main_AlbedoColored863_g31428 , Second_AlbedoColored1963_g31428 , Mask_Detail147_g31428);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch255_g31428 = Main_AlbedoColored863_g31428;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch255_g31428 = lerpResult235_g31428;
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch255_g31428 = lerpResult208_g31428;
				#else
				float3 staticSwitch255_g31428 = Main_AlbedoColored863_g31428;
				#endif
				half3 Blend_Albedo265_g31428 = staticSwitch255_g31428;
				half3 Blend_AlbedoAndSubsurface149_g31428 = Blend_Albedo265_g31428;
				half3 Global_OverlayColor1758_g31428 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g31428 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g31428 );
				float2 appendResult88_g32731 = (float2(tex2DNode117_g31428.a , tex2DNode117_g31428.g));
				float2 temp_output_90_0_g32731 = ( (appendResult88_g32731*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g32731 = (float3(temp_output_90_0_g32731 , 1.0));
				half3 Main_Normal137_g31428 = appendResult91_g32731;
				float4 tex2DNode145_g31428 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondMaskTex, Second_UVs17_g31428 );
				float2 appendResult88_g32757 = (float2(tex2DNode145_g31428.a , tex2DNode145_g31428.g));
				float2 temp_output_90_0_g32757 = ( (appendResult88_g32757*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32757 = (float3(temp_output_90_0_g32757 , 1.0));
				half Packed_NormalX3387_g31428 = tex2DNode3380_g31428.a;
				half Packed_NormalY3386_g31428 = tex2DNode3380_g31428.g;
				float2 appendResult88_g32734 = (float2(Packed_NormalX3387_g31428 , Packed_NormalY3386_g31428));
				float2 temp_output_90_0_g32734 = ( (appendResult88_g32734*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g32734 = (float3(temp_output_90_0_g32734 , 1.0));
				#if defined(TVE_DETAIL_MAPS_STANDARD)
				float3 staticSwitch3450_g31428 = appendResult91_g32757;
				#elif defined(TVE_DETAIL_MAPS_PACKED)
				float3 staticSwitch3450_g31428 = appendResult91_g32734;
				#else
				float3 staticSwitch3450_g31428 = appendResult91_g32757;
				#endif
				half3 Second_Normal179_g31428 = staticSwitch3450_g31428;
				float3 lerpResult230_g31428 = lerp( float3( 0,0,1 ) , Second_Normal179_g31428 , Mask_Detail147_g31428);
				float3 lerpResult3372_g31428 = lerp( float3( 0,0,1 ) , Main_Normal137_g31428 , _DetailNormalValue);
				float3 lerpResult3376_g31428 = lerp( Main_Normal137_g31428 , BlendNormal( lerpResult3372_g31428 , Second_Normal179_g31428 ) , Mask_Detail147_g31428);
				#if defined(TVE_DETAIL_MODE_OFF)
				float3 staticSwitch267_g31428 = Main_Normal137_g31428;
				#elif defined(TVE_DETAIL_MODE_OVERLAY)
				float3 staticSwitch267_g31428 = BlendNormal( Main_Normal137_g31428 , lerpResult230_g31428 );
				#elif defined(TVE_DETAIL_MODE_REPLACE)
				float3 staticSwitch267_g31428 = lerpResult3376_g31428;
				#else
				float3 staticSwitch267_g31428 = Main_Normal137_g31428;
				#endif
				half3 Blend_NormalRaw1051_g31428 = staticSwitch267_g31428;
				float3 switchResult1063_g31428 = (((ase_vface>0)?(Blend_NormalRaw1051_g31428):(( Blend_NormalRaw1051_g31428 * float3(-1,-1,-1) ))));
				half Overlay_Contrast1405_g31428 = _OverlayContrastValue;
				float3 appendResult1439_g31428 = (float3(Overlay_Contrast1405_g31428 , Overlay_Contrast1405_g31428 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal178_g31428 = ( switchResult1063_g31428 * appendResult1439_g31428 );
				float3 worldNormal178_g31428 = float3(dot(tanToWorld0,tanNormal178_g31428), dot(tanToWorld1,tanNormal178_g31428), dot(tanToWorld2,tanNormal178_g31428));
				half Global_OverlayIntensity154_g31428 = TVE_OverlayIntensity;
				float4x4 break19_g32749 = GetObjectToWorldMatrix();
				float3 appendResult20_g32749 = (float3(break19_g32749[ 0 ][ 3 ] , break19_g32749[ 1 ][ 3 ] , break19_g32749[ 2 ][ 3 ]));
				half3 Off19_g32750 = appendResult20_g32749;
				float4 transform68_g32749 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord6);
				float3 appendResult95_g32749 = (float3(IN.ase_texcoord2.z , 0.0 , IN.ase_texcoord2.w));
				float4 transform62_g32749 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord6.xyz - ( appendResult95_g32749 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32749 = ( (transform68_g32749).xyz - (transform62_g32749).xyz );
				half3 On20_g32750 = ObjectPositionWithPivots28_g32749;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32750 = On20_g32750;
				#else
				float3 staticSwitch14_g32750 = Off19_g32750;
				#endif
				half3 ObjectData20_g32751 = staticSwitch14_g32750;
				half3 WorldData19_g32751 = Off19_g32750;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32751 = WorldData19_g32751;
				#else
				float3 staticSwitch14_g32751 = ObjectData20_g32751;
				#endif
				float3 temp_output_42_0_g32749 = staticSwitch14_g32751;
				half3 ObjectData20_g32748 = temp_output_42_0_g32749;
				half3 WorldData19_g32748 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32748 = WorldData19_g32748;
				#else
				float3 staticSwitch14_g32748 = ObjectData20_g32748;
				#endif
				float2 temp_output_43_38_g32746 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32748).xz ) );
				half4 Legacy33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g32746 );
				half4 Vegetation33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g32746 );
				half4 Grass33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g32746 );
				half4 Objects33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g32746 );
				half4 Custom33_g32747 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g32746 );
				half4 localUSE_BUFFERS33_g32747 = USE_BUFFERS( Legacy33_g32747 , Vegetation33_g32747 , Grass33_g32747 , Objects33_g32747 , Custom33_g32747 );
				float4 break49_g32746 = localUSE_BUFFERS33_g32747;
				half Global_ExtrasTex_B156_g31428 = break49_g32746.z;
				float temp_output_1025_0_g31428 = ( Global_OverlayIntensity154_g31428 * _GlobalOverlay * Global_ExtrasTex_B156_g31428 );
				half Overlay_Commons1365_g31428 = temp_output_1025_0_g31428;
				half Overlay_Mask269_g31428 = saturate( ( saturate( worldNormal178_g31428.y ) - ( 1.0 - Overlay_Commons1365_g31428 ) ) );
				float3 lerpResult336_g31428 = lerp( Blend_AlbedoAndSubsurface149_g31428 , Global_OverlayColor1758_g31428 , Overlay_Mask269_g31428);
				half3 Final_Albedo359_g31428 = lerpResult336_g31428;
				half Main_Alpha316_g31428 = (temp_output_51_0_g31428).a;
				float lerpResult354_g31428 = lerp( 1.0 , Main_Alpha316_g31428 , _render_premul);
				half Final_Premultiply355_g31428 = lerpResult354_g31428;
				float3 temp_output_410_0_g31428 = ( Final_Albedo359_g31428 * Final_Premultiply355_g31428 );
				float3 temp_cast_7 = (1.0).xxx;
				half Mesh_Occlusion318_g31428 = IN.ase_color.g;
				float saferPower1201_g31428 = max( Mesh_Occlusion318_g31428 , 0.0001 );
				float3 lerpResult2945_g31428 = lerp( (_VertexOcclusionColor).rgb , temp_cast_7 , saturate( pow( saferPower1201_g31428 , ( _VertexOcclusionValue + _OcclusionCat ) ) ));
				half3 Vertex_Occlusion648_g31428 = lerpResult2945_g31428;
				
				float localCustomAlphaClip9_g32759 = ( 0.0 );
				half Main_AlphaRaw1203_g31428 = tex2DNode29_g31428.a;
				half Alpha5_g32759 = Main_AlphaRaw1203_g31428;
				float Alpha9_g32759 = Alpha5_g32759;
				#if _ALPHATEST_ON
				clip(Alpha9_g32759 - _Cutoff);
				#endif
				half Final_Clip914_g31428 = localCustomAlphaClip9_g32759;
				
				
				float3 Albedo = ( temp_output_410_0_g31428 * Vertex_Occlusion648_g31428 );
				float Alpha = Main_Alpha316_g31428;
				float AlphaClipThreshold = Final_Clip914_g31428;

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
1927;1;1906;1021;2904.004;870.7061;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;81;-1552,-896;Half;False;Property;_IsLitShader;_IsLitShader;206;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;307;-2176,256;Inherit;False;Use TVE_IS_VEGETATION_SHADER;-1;;32817;b458122dd75182d488380bd0f592b9e6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;127;-1984,-896;Half;False;Property;_IsBarkShader;_IsBarkShader;204;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;134;-1776,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;207;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;306;-1376,-896;Half;False;Property;_IsAnyPathShader;_IsAnyPathShader;205;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1728,-768;Half;False;Property;_render_src;_render_src;210;1;[HideInInspector];Create;True;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-768;Half;False;Property;_render_cutoff;_render_cutoff;208;1;[HideInInspector];Create;True;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.719;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-768;Half;False;Property;_render_cull;_render_cull;209;1;[HideInInspector];Create;True;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Bark Standard Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;212;1;[HideInInspector];Create;True;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;317;-2176,-384;Inherit;False;Base Shader;1;;31428;856f7164d1c579d43a5cf4968a75ca43;50,1300,1,1298,1,1271,1,1962,0,1708,0,1712,1,1964,1,1969,1,1719,0,893,0,1745,1,1742,1,1715,1,1718,1,1717,1,1714,1,916,1,1949,1,1763,0,1762,0,1776,0,1646,0,1690,0,1757,0,3221,3,1981,0,2807,0,2953,0,3243,0,2172,0,2658,0,1735,1,1736,1,1734,1,1737,1,1968,1,1966,1,1733,1,878,0,1550,0,860,1,2750,0,2260,1,2261,1,2054,1,2032,1,2036,0,2060,0,2062,0,2039,0;0;15;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534
Node;AmplifyShaderEditor.RangedFloatNode;7;-1536,-768;Half;False;Property;_render_dst;_render_dst;211;1;[HideInInspector];Create;True;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;313;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;311;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;2;BOXOPHOBIC/The Vegetation Engine/Vegetation/Bark Standard Lit;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;17;False;False;False;False;False;False;False;False;True;0;False;-1;True;2;True;10;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;17;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;36;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,True,669;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;1;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;0;0;6;False;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;315;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;True;1;True;17;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;314;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;312;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;310;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1026.438;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;285;-2176,128;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1022.896;100;Final;0;;0,1,0.5,1;0;0
WireConnection;311;0;317;0
WireConnection;311;1;317;528
WireConnection;311;3;317;529
WireConnection;311;4;317;530
WireConnection;311;5;317;531
WireConnection;311;6;317;532
WireConnection;311;7;317;653
WireConnection;311;8;317;534
ASEEND*/
//CHKSM=0286737632BDF998A12A6B74C0377ABBF62408F3