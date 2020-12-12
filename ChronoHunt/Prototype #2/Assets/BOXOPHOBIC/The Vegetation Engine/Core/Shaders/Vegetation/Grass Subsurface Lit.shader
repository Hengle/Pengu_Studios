// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Vegetation/Grass Subsurface Lit"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledBanner(Grass Subsurface Lit)]_Banner("Banner", Float) = 0
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
		_GlobalColors("Global Colors", Range( 0 , 1)) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalLeaves("Global Leaves", Range( 0 , 1)) = 1
		_GlobalHealthiness("Global Healthiness", Range( 0 , 1)) = 1
		_GlobalSize("Global Size", Range( 0 , 1)) = 1
		_GlobalSizeFade("Global Size Fade", Range( 0 , 1)) = 0
		[StyledSpace(10)]_GlobalSpace("# Global Space", Float) = 0
		[HideInInspector][HDR]_LocalColors("Local Colors", Color) = (1,1,1,1)
		[HideInInspector]_LocalLeaves("Local Leaves", Range( 0 , 1)) = 1
		[HideInInspector]_LocalSize("Local Size", Range( 0 , 1)) = 1
		_ColorsMaskValue("Colors Use Mask (bottom mask)", Range( 0 , 1)) = 0
		_OverlayContrastValue("Overlay Contrast", Range( 0 , 10)) = 4
		_OverlayVariationValue("Overlay Variation", Range( 0 , 1)) = 0
		_LeavesVariationValue("Leaves Variation", Range( 0 , 1)) = 0
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
		[StyledSpace(10)]_DetailSpace("# Detail Space", Float) = 0
		[StyledCategory(Occlusion Settings)]_OcclusionCat("[ Occlusion Cat ]", Float) = 0
		[HDR]_VertexOcclusionColor("Vertex Occlusion Color", Color) = (0,0,0,0)
		_VertexOcclusionValue("Vertex Occlusion Power", Range( 0 , 8)) = 0
		[StyledCategory(Subsurface Settings)]_SubsurfaceCat("[ Subsurface Cat ]", Float) = 0
		[HideInInspector][ASEDiffusionProfile(_SubsurfaceDiffusion)]_SubsurfaceDiffusion_asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (0.3315085,0.490566,0,1)
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 1
		_SubsurfaceViewValue("Subsurface View", Range( 0 , 8)) = 1
		_SubsurfaceAngleValue("Subsurface Angle", Range( 0 , 16)) = 8
		_SubsurfaceLightValue("Subsurface Use Light", Range( 0 , 1)) = 1
		_SubsurfaceMaskValue("Subsurface Use Mask (top mask)", Range( 0 , 1)) = 1
		[StyledCategory(Gradient Settings)]_GradientCat("[ Gradient Cat ]", Float) = 0
		[HDR]_GradientColorOne("Gradient Color One", Color) = (1,1,1,1)
		[HDR]_GradientColorTwo("Gradient Color Two", Color) = (1,1,1,1)
		_GradientMinValue("Gradient Mask Min", Range( 0 , 1)) = 0
		_GradientMaxValue("Gradient Mask Max ", Range( 0 , 1)) = 1
		[StyledCategory(Noise Settings)]_MoiseCat("[ Noise Cat ]", Float) = 0
		[NoScaleOffset]_NoiseTex("Noise Mask", 2D) = "white" {}
		_NoiseScaleValue("Noise Mask Scale", Range( 0 , 1)) = 0.01
		_NoiseMinValue("Noise Mask Min", Range( 0 , 1)) = 0
		_NoiseMaxValue("Noise Mask Max ", Range( 0 , 1)) = 1
		[HDR][Space(10)]_NoiseTintOne("Noise Tint One", Color) = (1,1,1,1)
		[HDR]_NoiseTintTwo("Noise Tint Two", Color) = (1,1,1,1)
		[StyledCategory(Perspective Settings)]_PerspectiveCat("[ Perspective Cat ]", Float) = 0
		_PerspectivePushValue("Perspective Push", Range( 0 , 4)) = 0
		_PerspectiveNoiseValue("Perspective Noise", Range( 0 , 4)) = 0
		_PerspectiveAngleValue("Perspective Angle", Range( 0 , 8)) = 1
		[StyledCategory(Vertex Settings)]_VertexCat("[ Vertex Cat ]", Float) = 0
		[StyledMessage(Info, The Object motion feature allows for high quality bending motion and interaction. The motion and global elements are calculated per instance., _VertexMotionMode, 0 , 2, 0)]_ObjectDataMessage("# Object Data Message", Float) = 0
		[StyledMessage(Info, The World motion feature allows for simpler and cheaper translation motion and interaction. The motion is calculated in world space but the global elements are calculated per instance., _VertexMotionMode, 1 , 2, 0)]_WorldDataMessage("# World Data Message", Float) = 0
		[StyledMessage(Info, The Baked pivots feature allows for using per mesh element interaction and elements influence. This feature requires pre baked pivots on prefab conversion. Useful for latge grass meshes., _VertexPivotMode, 1 , 0, 0)]_PivotsMessage("# Pivots Message", Float) = 0
		[Enum(Object,0,World,1)][Space(10)]_VertexMotionMode("Vertex Motion", Float) = 0
		[Enum(Object,0,Baked,1)]_VertexPivotMode("Vertex Pivot", Float) = 0
		[StyledSpace(10)]_VertexMotionSpace("# Vertex Motion Space", Float) = 0
		[HDR]_MotionHighlightColor("Motion Highlight", Color) = (2,2,2,1)
		_Motion_10("Motion Bending", Range( 0 , 1)) = 1
		_Motion_32("Motion Flutter", Range( 0 , 1)) = 1
		_Motion_Interaction("Motion Interaction", Range( 0 , 1)) = 1
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
		[HideInInspector]_Float18("Float 7", Float) = 1
		[HideInInspector]_IsGrassShader("_IsGrassShader", Float) = 1
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsForwardPathShader("_IsForwardPathShader", Float) = 1
		[HideInInspector]_IsLitShader("_IsLitShader", Float) = 1
		[HideInInspector]_render_cutoff("_render_cutoff", Float) = 0.5
		[HideInInspector]_render_src("_render_src", Float) = 1
		[HideInInspector]_render_cull("_render_cull", Float) = 0
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
			#define _TRANSMISSION_ASE 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#define TVE_PIVOT_DATA_BAKED
			#define TVE_IS_GRASS_SHADER
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


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
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NoiseTintOne;
			half4 _SubsurfaceColor;
			float4 _LocalColors;
			half4 _MotionHighlightColor;
			half4 _MainUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_asset;
			half4 _GradientColorTwo;
			half4 _NoiseTintTwo;
			half4 _GradientColorOne;
			float4 _Color;
			half3 _render_normals_options;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _PerspectivePushValue;
			half _LocalSize;
			half _GlobalSize;
			half _PerspectiveCat;
			half _GlobalSizeFade;
			half _VertexMotionMode;
			half _VertexMotionSpace;
			half _VertexCat;
			half _Motion_32;
			half _Motion_Interaction;
			half _Motion_10;
			half _vertex_pivot_mode;
			half _VertexPivotMode;
			half _IsForwardPathShader;
			half _BatchingMessage;
			float _MotionVariation_32;
			half _DetailMapsMode;
			half _DetailTypeMode;
			half _GlobalCat;
			half _VertexDataMode;
			half _GradientMinValue;
			half _IsLitShader;
			half _GradientCat;
			half _LeavesVariationValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _OcclusionCat;
			half _VertexOcclusionValue;
			half _render_premul;
			half _OverlayVariationValue;
			half _GlobalOverlay;
			half _OverlayContrastValue;
			half _SubsurfaceViewValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceCat;
			half _GlobalHealthiness;
			half _SubsurfaceValue;
			half _SubsurfaceLightValue;
			half _ColorsMaskValue;
			half _GlobalColors;
			half _NoiseMaxValue;
			half _NoiseMinValue;
			half _MoiseCat;
			half _NoiseScaleValue;
			half _ObjectDataMessage;
			half _GradientMaxValue;
			half _DetailCat;
			half _MainCat;
			float _MotionScale_20;
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
			half _InteractionVariation;
			float _ObjectOcclusionValue;
			float _GrassPerspectiveAngleValue;
			float _SubsurfaceMaxValue;
			half _GlobalSpace;
			half _DetailSpace;
			half _render_cull;
			float _Float18;
			half _IsGrassShader;
			half _Banner;
			half _render_src;
			half _IsStandardShader;
			half _render_dst;
			half _render_cutoff;
			half _render_zw;
			float _SubsurfaceMinValue;
			half _AdvancedCat;
			float _MotionScale_32;
			half _Cutoff;
			half _GlobalLeaves;
			float _MotionVariation_30;
			half _RenderMode;
			half _MotionAmplitude_20;
			half _MotionVariation_10;
			half _WorldDataMessage;
			float _MotionSpeed_10;
			half _DetailMode;
			half _RenderPriority;
			half _RenderBlend;
			half _RenderZWrite;
			half _MotionAmplitude_32;
			half _RenderCull;
			half _IsTVEShader;
			float _MotionSpeed_30;
			half _MotionAmplitude_10;
			float _MotionScale_10;
			float _MotionSpeed_20;
			half _RenderClip;
			half _InteractionAmplitude;
			float _MotionSpeed_32;
			float _MotionScale_30;
			half _RenderNormals;
			half _MainNormalValue;
			half _IsVersion;
			half _RenderingCat;
			half _VertexVariationMode;
			half _MotionVariation_20;
			half _PivotsMessage;
			half _LocalLeaves;
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
			TEXTURE2D(_NoiseTex);
			SAMPLER(sampler_NoiseTex);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half TVE_NoiseHighlight;
			TEXTURE2D(TVE_ColorsTex);
			SAMPLER(samplerTVE_ColorsTex);
			TEXTURE2D(TVE_ColorsTex_Vegetation);
			SAMPLER(samplerTVE_ColorsTex_Vegetation);
			TEXTURE2D(TVE_ColorsTex_Grass);
			SAMPLER(samplerTVE_ColorsTex_Grass);
			TEXTURE2D(TVE_ColorsTex_Objects);
			SAMPLER(samplerTVE_ColorsTex_Objects);
			TEXTURE2D(TVE_ColorsTex_User);
			SAMPLER(samplerTVE_ColorsTex_User);
			float4 TVE_MainLightParams;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			TEXTURE2D(_MainNormalTex);
			SAMPLER(sampler_MainNormalTex);
			half TVE_OverlayIntensity;
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_MainMaskTex);
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
				half3 Off19_g35190 = _Vector1;
				float3 appendResult2827_g35167 = (float3(v.texcoord.z , v.ase_texcoord3.w , v.texcoord.w));
				half3 Mesh_PivotsData2831_g35167 = ( appendResult2827_g35167 * _VertexPivotMode );
				half3 On20_g35190 = Mesh_PivotsData2831_g35167;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35190 = On20_g35190;
				#else
				float3 staticSwitch14_g35190 = Off19_g35190;
				#endif
				half3 ObjectData20_g35191 = staticSwitch14_g35190;
				half3 WorldData19_g35191 = Off19_g35190;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35191 = WorldData19_g35191;
				#else
				float3 staticSwitch14_g35191 = ObjectData20_g35191;
				#endif
				#ifdef TVE_VERTEX_DATA_WORLD
				float3 staticSwitch14_g35213 = _Vector1;
				#else
				float3 staticSwitch14_g35213 = staticSwitch14_g35191;
				#endif
				half3 Mesh_PivotsOS2291_g35167 = staticSwitch14_g35213;
				float3 temp_output_2283_0_g35167 = ( v.vertex.xyz - Mesh_PivotsOS2291_g35167 );
				half3 VertexPos40_g35258 = temp_output_2283_0_g35167;
				float3 appendResult74_g35258 = (float3(VertexPos40_g35258.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g35258 = appendResult74_g35258;
				float3 break84_g35258 = VertexPos40_g35258;
				float3 appendResult81_g35258 = (float3(0.0 , break84_g35258.y , break84_g35258.z));
				half3 VertexPosOtherAxis82_g35258 = appendResult81_g35258;
				float ObjectData20_g35232 = 3.14;
				float Bounds_Height374_g35167 = _MaxBoundsInfo.y;
				float WorldData19_g35232 = ( Bounds_Height374_g35167 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35232 = WorldData19_g35232;
				#else
				float staticSwitch14_g35232 = ObjectData20_g35232;
				#endif
				float Motion_Max_Bending1133_g35167 = staticSwitch14_g35232;
				float4x4 break19_g35225 = GetObjectToWorldMatrix();
				float3 appendResult20_g35225 = (float3(break19_g35225[ 0 ][ 3 ] , break19_g35225[ 1 ][ 3 ] , break19_g35225[ 2 ][ 3 ]));
				half3 Off19_g35226 = appendResult20_g35225;
				float4 transform68_g35225 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g35225 = (float3(v.texcoord.z , v.ase_texcoord3.w , v.texcoord.w));
				float4 transform62_g35225 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g35225 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35225 = ( (transform68_g35225).xyz - (transform62_g35225).xyz );
				half3 On20_g35226 = ObjectPositionWithPivots28_g35225;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35226 = On20_g35226;
				#else
				float3 staticSwitch14_g35226 = Off19_g35226;
				#endif
				half3 ObjectData20_g35227 = staticSwitch14_g35226;
				half3 WorldData19_g35227 = Off19_g35226;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35227 = WorldData19_g35227;
				#else
				float3 staticSwitch14_g35227 = ObjectData20_g35227;
				#endif
				float3 temp_output_42_0_g35225 = staticSwitch14_g35227;
				half3 ObjectData20_g35230 = temp_output_42_0_g35225;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g35230 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35230 = WorldData19_g35230;
				#else
				float3 staticSwitch14_g35230 = ObjectData20_g35230;
				#endif
				float2 temp_output_39_38_g35223 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35230).xz ) );
				half4 Legacy33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, temp_output_39_38_g35223, 0.0 );
				half4 Vegetation33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Vegetation, samplerTVE_MotionTex_Vegetation, temp_output_39_38_g35223, 0.0 );
				half4 Grass33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Grass, samplerTVE_MotionTex_Grass, temp_output_39_38_g35223, 0.0 );
				half4 Objects33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Objects, samplerTVE_MotionTex_Objects, temp_output_39_38_g35223, 0.0 );
				half4 Custom33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_User, samplerTVE_MotionTex_User, temp_output_39_38_g35223, 0.0 );
				half4 localUSE_BUFFERS33_g35231 = USE_BUFFERS( Legacy33_g35231 , Vegetation33_g35231 , Grass33_g35231 , Objects33_g35231 , Custom33_g35231 );
				float4 break322_g35179 = localUSE_BUFFERS33_g35231;
				half Wind_Power369_g35179 = saturate( ( (break322_g35179.z*2.0 + -1.0) + TVE_WindPower ) );
				half Wind_Power_103106_g35167 = Wind_Power369_g35179;
				float3 appendResult323_g35179 = (float3(break322_g35179.x , 0.0 , break322_g35179.y));
				float3 temp_output_324_0_g35179 = (appendResult323_g35179*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g35179 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g35179 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g35167 = (temp_output_339_0_g35179).xz;
				half Motion_Use1056_g35167 = _Motion_10;
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch160_g35199 = TVE_NoiseSpeed_Grass;
				#else
				float2 staticSwitch160_g35199 = TVE_NoiseSpeed_Vegetation;
				#endif
				float4x4 break19_g35201 = GetObjectToWorldMatrix();
				float3 appendResult20_g35201 = (float3(break19_g35201[ 0 ][ 3 ] , break19_g35201[ 1 ][ 3 ] , break19_g35201[ 2 ][ 3 ]));
				half3 Off19_g35202 = appendResult20_g35201;
				float4 transform68_g35201 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35201 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
				float4 transform62_g35201 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35201 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35201 = ( (transform68_g35201).xyz - (transform62_g35201).xyz );
				half3 On20_g35202 = ObjectPositionWithPivots28_g35201;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35202 = On20_g35202;
				#else
				float3 staticSwitch14_g35202 = Off19_g35202;
				#endif
				half3 ObjectData20_g35203 = staticSwitch14_g35202;
				half3 WorldData19_g35203 = Off19_g35202;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35203 = WorldData19_g35203;
				#else
				float3 staticSwitch14_g35203 = ObjectData20_g35203;
				#endif
				float3 temp_output_42_0_g35201 = staticSwitch14_g35203;
				half3 ObjectData20_g35200 = temp_output_42_0_g35201;
				half3 WorldData19_g35200 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35200 = WorldData19_g35200;
				#else
				float3 staticSwitch14_g35200 = ObjectData20_g35200;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch164_g35199 = (ase_worldPos).xz;
				#else
				float2 staticSwitch164_g35199 = (staticSwitch14_g35200).xz;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float staticSwitch161_g35199 = TVE_NoiseSize_Grass;
				#else
				float staticSwitch161_g35199 = TVE_NoiseSize_Vegetation;
				#endif
				float2 panner73_g35199 = ( _TimeParameters.x * staticSwitch160_g35199 + ( staticSwitch164_g35199 * staticSwitch161_g35199 ));
				float4 tex2DNode75_g35199 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g35199, 0.0 );
				float4 saferPower77_g35199 = max( abs( tex2DNode75_g35199 ) , 0.0001 );
				float4 temp_cast_9 = (TVE_NoiseContrast).xxxx;
				float4 break142_g35199 = pow( saferPower77_g35199 , temp_cast_9 );
				half Global_NoiseTex_R34_g35167 = break142_g35199.r;
				half Input_Speed62_g35256 = _MotionSpeed_10;
				float mulTime373_g35256 = _TimeParameters.x * Input_Speed62_g35256;
				float4x4 break19_g35238 = GetObjectToWorldMatrix();
				float3 appendResult20_g35238 = (float3(break19_g35238[ 0 ][ 3 ] , break19_g35238[ 1 ][ 3 ] , break19_g35238[ 2 ][ 3 ]));
				half3 Off19_g35239 = appendResult20_g35238;
				float4 transform68_g35238 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35238 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
				float4 transform62_g35238 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35238 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35238 = ( (transform68_g35238).xyz - (transform62_g35238).xyz );
				half3 On20_g35239 = ObjectPositionWithPivots28_g35238;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35239 = On20_g35239;
				#else
				float3 staticSwitch14_g35239 = Off19_g35239;
				#endif
				half3 ObjectData20_g35240 = staticSwitch14_g35239;
				half3 WorldData19_g35240 = Off19_g35239;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35240 = WorldData19_g35240;
				#else
				float3 staticSwitch14_g35240 = ObjectData20_g35240;
				#endif
				float3 temp_output_42_0_g35238 = staticSwitch14_g35240;
				float3 break9_g35238 = temp_output_42_0_g35238;
				half Variation_Complex102_g35235 = frac( ( v.ase_color.r + ( break9_g35238.x + break9_g35238.z ) ) );
				float ObjectData20_g35237 = Variation_Complex102_g35235;
				half Variation_Simple105_g35235 = v.ase_color.r;
				float WorldData19_g35237 = Variation_Simple105_g35235;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35237 = WorldData19_g35237;
				#else
				float staticSwitch14_g35237 = ObjectData20_g35237;
				#endif
				half Variation3073_g35167 = staticSwitch14_g35237;
				half Motion_Variation284_g35256 = ( _MotionVariation_10 * Variation3073_g35167 );
				float2 appendResult344_g35256 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g35256 = ( _MotionScale_10 * appendResult344_g35256 );
				half2 Sine_MinusOneToOne281_g35256 = sin( ( mulTime373_g35256 + Motion_Variation284_g35256 + Motion_Scale287_g35256 ) );
				float2 temp_cast_11 = (1.0).xx;
				half Input_Turbulence327_g35256 = Global_NoiseTex_R34_g35167;
				float2 lerpResult321_g35256 = lerp( Sine_MinusOneToOne281_g35256 , temp_cast_11 , Input_Turbulence327_g35256);
				half2 Motion_Bending2258_g35167 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g35167 ) * Wind_Power_103106_g35167 * Wind_DirectionOS39_g35167 * Motion_Use1056_g35167 * Global_NoiseTex_R34_g35167 * lerpResult321_g35256 );
				half Motion_UseInteraction2097_g35167 = _Motion_Interaction;
				half Motion_InteractionMask66_g35167 = break322_g35179.w;
				float lerpResult3307_g35167 = lerp( 1.0 , Variation3073_g35167 , _InteractionVariation);
				half2 Motion_Interaction53_g35167 = ( _InteractionAmplitude * Motion_Max_Bending1133_g35167 * Motion_UseInteraction2097_g35167 * Motion_InteractionMask66_g35167 * Motion_InteractionMask66_g35167 * Wind_DirectionOS39_g35167 * lerpResult3307_g35167 );
				float2 lerpResult109_g35167 = lerp( Motion_Bending2258_g35167 , Motion_Interaction53_g35167 , Motion_InteractionMask66_g35167);
				half Mesh_Motion_182_g35167 = v.ase_texcoord3.x;
				float2 break143_g35167 = ( lerpResult109_g35167 * Mesh_Motion_182_g35167 );
				half Motion_Z190_g35167 = break143_g35167.y;
				half Angle44_g35258 = Motion_Z190_g35167;
				half3 VertexPos40_g35250 = ( VertexPosRotationAxis50_g35258 + ( VertexPosOtherAxis82_g35258 * cos( Angle44_g35258 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g35258 ) * sin( Angle44_g35258 ) ) );
				float3 appendResult74_g35250 = (float3(0.0 , 0.0 , VertexPos40_g35250.z));
				half3 VertexPosRotationAxis50_g35250 = appendResult74_g35250;
				float3 break84_g35250 = VertexPos40_g35250;
				float3 appendResult81_g35250 = (float3(break84_g35250.x , break84_g35250.y , 0.0));
				half3 VertexPosOtherAxis82_g35250 = appendResult81_g35250;
				half Motion_X216_g35167 = break143_g35167.x;
				half Angle44_g35250 = -Motion_X216_g35167;
				half Motion_Scale321_g35248 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g35248 = _MotionSpeed_32;
				float mulTime349_g35248 = _TimeParameters.x * Input_Speed62_g35248;
				float Motion_Variation330_g35248 = ( _MotionVariation_32 * v.ase_color.r );
				float Bounds_Radius121_g35167 = _MaxBoundsInfo.x;
				half Input_Amplitude58_g35248 = ( _MotionAmplitude_32 * Bounds_Radius121_g35167 * 0.1 );
				float3 appendResult345_g35248 = (float3(v.ase_color.r , ( 1.0 - v.ase_color.r ) , v.ase_color.r));
				half Global_NoiseTex_B132_g35167 = break142_g35199.b;
				half Mesh_Motion_3144_g35167 = v.ase_texcoord3.z;
				half Motion_Use322013_g35167 = _Motion_32;
				float lerpResult376_g35179 = lerp( 0.1 , 1.0 , Wind_Power369_g35179);
				half Wind_Power_323115_g35167 = lerpResult376_g35179;
				half3 Motion_Flutter263_g35167 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g35248 ) + mulTime349_g35248 + Motion_Variation330_g35248 ) ) * Input_Amplitude58_g35248 * appendResult345_g35248 ) * ( ( Global_NoiseTex_R34_g35167 + Global_NoiseTex_B132_g35167 ) * Mesh_Motion_3144_g35167 * Motion_Use322013_g35167 * Wind_Power_323115_g35167 ) );
				half Wind_Mode3167_g35167 = TVE_WindMode;
				float3 lerpResult3168_g35167 = lerp( v.vertex.xyz , ( ( VertexPosRotationAxis50_g35250 + ( VertexPosOtherAxis82_g35250 * cos( Angle44_g35250 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g35250 ) * sin( Angle44_g35250 ) ) ) + Motion_Flutter263_g35167 ) , Wind_Mode3167_g35167);
				float3 Vertex_Motion_Object833_g35167 = lerpResult3168_g35167;
				float3 appendResult2043_g35167 = (float3(Motion_X216_g35167 , 0.0 , Motion_Z190_g35167));
				float3 lerpResult3173_g35167 = lerp( v.vertex.xyz , ( ( v.vertex.xyz + appendResult2043_g35167 ) + Motion_Flutter263_g35167 ) , Wind_Mode3167_g35167);
				float3 Vertex_Motion_World1118_g35167 = lerpResult3173_g35167;
				float3 temp_output_3331_0_g35167 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g35167 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g35167 = Vertex_Motion_Object833_g35167;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g35167 = temp_output_3331_0_g35167;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g35167 = temp_output_3331_0_g35167;
				#else
				float3 staticSwitch3312_g35167 = Vertex_Motion_Object833_g35167;
				#endif
				half3 ObjectData20_g35178 = staticSwitch3312_g35167;
				half3 WorldData19_g35178 = Vertex_Motion_World1118_g35167;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35178 = WorldData19_g35178;
				#else
				float3 staticSwitch14_g35178 = ObjectData20_g35178;
				#endif
				float4x4 break19_g35194 = GetObjectToWorldMatrix();
				float3 appendResult20_g35194 = (float3(break19_g35194[ 0 ][ 3 ] , break19_g35194[ 1 ][ 3 ] , break19_g35194[ 2 ][ 3 ]));
				half3 Off19_g35195 = appendResult20_g35194;
				float4 transform68_g35194 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g35194 = (float3(v.texcoord.z , v.ase_texcoord3.w , v.texcoord.w));
				float4 transform62_g35194 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g35194 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35194 = ( (transform68_g35194).xyz - (transform62_g35194).xyz );
				half3 On20_g35195 = ObjectPositionWithPivots28_g35194;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35195 = On20_g35195;
				#else
				float3 staticSwitch14_g35195 = Off19_g35195;
				#endif
				half3 ObjectData20_g35196 = staticSwitch14_g35195;
				half3 WorldData19_g35196 = Off19_g35195;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35196 = WorldData19_g35196;
				#else
				float3 staticSwitch14_g35196 = ObjectData20_g35196;
				#endif
				float3 temp_output_42_0_g35194 = staticSwitch14_g35196;
				float temp_output_7_0_g35245 = TVE_SizeFadeEnd;
				float ObjectData20_g35193 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g35194 ) * _GlobalSizeFade ) - temp_output_7_0_g35245 ) / ( TVE_SizeFadeStart - temp_output_7_0_g35245 ) ) );
				float WorldData19_g35193 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35193 = WorldData19_g35193;
				#else
				float staticSwitch14_g35193 = ObjectData20_g35193;
				#endif
				float Vertex_SizeFade1740_g35167 = staticSwitch14_g35193;
				float4x4 break19_g35184 = GetObjectToWorldMatrix();
				float3 appendResult20_g35184 = (float3(break19_g35184[ 0 ][ 3 ] , break19_g35184[ 1 ][ 3 ] , break19_g35184[ 2 ][ 3 ]));
				half3 Off19_g35185 = appendResult20_g35184;
				float4 transform68_g35184 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35184 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
				float4 transform62_g35184 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35184 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35184 = ( (transform68_g35184).xyz - (transform62_g35184).xyz );
				half3 On20_g35185 = ObjectPositionWithPivots28_g35184;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35185 = On20_g35185;
				#else
				float3 staticSwitch14_g35185 = Off19_g35185;
				#endif
				half3 ObjectData20_g35186 = staticSwitch14_g35185;
				half3 WorldData19_g35186 = Off19_g35185;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35186 = WorldData19_g35186;
				#else
				float3 staticSwitch14_g35186 = ObjectData20_g35186;
				#endif
				float3 temp_output_42_0_g35184 = staticSwitch14_g35186;
				half3 ObjectData20_g35183 = temp_output_42_0_g35184;
				half3 WorldData19_g35183 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35183 = WorldData19_g35183;
				#else
				float3 staticSwitch14_g35183 = ObjectData20_g35183;
				#endif
				float2 temp_output_43_38_g35181 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35183).xz ) );
				half4 Legacy33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g35181, 0.0 );
				half4 Vegetation33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g35181, 0.0 );
				half4 Grass33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g35181, 0.0 );
				half4 Objects33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g35181, 0.0 );
				half4 Custom33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g35181, 0.0 );
				half4 localUSE_BUFFERS33_g35182 = USE_BUFFERS( Legacy33_g35182 , Vegetation33_g35182 , Grass33_g35182 , Objects33_g35182 , Custom33_g35182 );
				float4 break49_g35181 = localUSE_BUFFERS33_g35182;
				half Global_ExtrasTex_G305_g35167 = break49_g35181.y;
				float lerpResult346_g35167 = lerp( 1.0 , Global_ExtrasTex_G305_g35167 , _GlobalSize);
				float ObjectData20_g35192 = ( lerpResult346_g35167 * _LocalSize );
				float WorldData19_g35192 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35192 = WorldData19_g35192;
				#else
				float staticSwitch14_g35192 = ObjectData20_g35192;
				#endif
				half Vertex_Size1741_g35167 = staticSwitch14_g35192;
				float3 normalizeResult2696_g35167 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float3 break2709_g35167 = cross( normalizeResult2696_g35167 , half3(0,1,0) );
				float3 appendResult2710_g35167 = (float3(-break2709_g35167.z , 0.0 , break2709_g35167.x));
				float3 appendResult2667_g35167 = (float3(v.ase_color.r , 0.5 , v.ase_color.r));
				float3 normalizeResult2210_g35167 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float dotResult2212_g35167 = dot( normalizeResult2210_g35167 , float3(0,1,0) );
				half Mask_HView2656_g35167 = abs( dotResult2212_g35167 );
				float saferPower2652_g35167 = max( Mask_HView2656_g35167 , 0.0001 );
				half3 Grass_Coverage2661_g35167 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g35167 , 0.0 ) ).xyz * ( _PerspectivePushValue + _PerspectiveCat ) ) + ( (appendResult2667_g35167*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * v.ase_color.a * pow( saferPower2652_g35167 , _PerspectiveAngleValue ) );
				float3 Final_VertexPosition890_g35167 = ( ( staticSwitch14_g35178 * Vertex_SizeFade1740_g35167 * Vertex_Size1741_g35167 ) + Mesh_PivotsOS2291_g35167 + Grass_Coverage2661_g35167 );
				
				half2 Noise_UVs3274_g35167 = ( (ase_worldPos).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g35170 = _NoiseMinValue;
				half Noise_Mask3162_g35167 = saturate( ( ( SAMPLE_TEXTURE2D_LOD( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g35167, 0.0 ).r - temp_output_7_0_g35170 ) / ( _NoiseMaxValue - temp_output_7_0_g35170 ) ) );
				float4 lerpResult2800_g35167 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g35167);
				half3 Noise_Tint2802_g35167 = (lerpResult2800_g35167).rgb;
				float3 vertexToFrag3225_g35167 = Noise_Tint2802_g35167;
				o.ase_texcoord7.xyz = vertexToFrag3225_g35167;
				half Global_NoiseTex_H2869_g35167 = pow( abs( tex2DNode75_g35199.r ) , TVE_NoiseHighlight );
				half3 Highlight_Tint3231_g35167 = ( ( (_MotionHighlightColor).rgb * Global_NoiseTex_H2869_g35167 * Wind_Power_103106_g35167 * Wind_Mode3167_g35167 * v.ase_color.r ) + float3( 1,1,1 ) );
				float3 vertexToFrag3252_g35167 = Highlight_Tint3231_g35167;
				o.ase_texcoord9.xyz = vertexToFrag3252_g35167;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord8 = v.texcoord;
				o.ase_texcoord10 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.w = 0;
				o.ase_texcoord9.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g35167;
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

				float temp_output_7_0_g35173 = _GradientMinValue;
				float4 lerpResult2779_g35167 = lerp( _GradientColorTwo , _GradientColorOne , saturate( ( ( IN.ase_color.a - temp_output_7_0_g35173 ) / ( ( _GradientMaxValue + _GradientCat ) - temp_output_7_0_g35173 ) ) ));
				half3 Gradient_Tint2784_g35167 = (lerpResult2779_g35167).rgb;
				float3 vertexToFrag3225_g35167 = IN.ase_texcoord7.xyz;
				half2 Noise_UVs3274_g35167 = ( (WorldPosition).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g35170 = _NoiseMinValue;
				half Noise_Mask3162_g35167 = saturate( ( ( SAMPLE_TEXTURE2D( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g35167 ).r - temp_output_7_0_g35170 ) / ( _NoiseMaxValue - temp_output_7_0_g35170 ) ) );
				float4 lerpResult2800_g35167 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g35167);
				half3 Noise_Tint2802_g35167 = (lerpResult2800_g35167).rgb;
				#ifdef TVE_IS_GRASS_SHADER
				float3 staticSwitch3420_g35167 = Noise_Tint2802_g35167;
				#else
				float3 staticSwitch3420_g35167 = vertexToFrag3225_g35167;
				#endif
				half2 Main_UVs15_g35167 = ( ( IN.ase_texcoord8.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g35167 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g35167 );
				float4 temp_output_51_0_g35167 = ( _MainColor * tex2DNode29_g35167 );
				half3 Main_AlbedoRaw99_g35167 = (temp_output_51_0_g35167).rgb;
				float3 vertexToFrag3252_g35167 = IN.ase_texcoord9.xyz;
				half3 Main_AlbedoTinted2808_g35167 = ( Gradient_Tint2784_g35167 * staticSwitch3420_g35167 * Main_AlbedoRaw99_g35167 * vertexToFrag3252_g35167 );
				float4x4 break19_g35215 = GetObjectToWorldMatrix();
				float3 appendResult20_g35215 = (float3(break19_g35215[ 0 ][ 3 ] , break19_g35215[ 1 ][ 3 ] , break19_g35215[ 2 ][ 3 ]));
				half3 Off19_g35216 = appendResult20_g35215;
				float4 transform68_g35215 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord10);
				float3 appendResult95_g35215 = (float3(IN.ase_texcoord8.z , 0.0 , IN.ase_texcoord8.w));
				float4 transform62_g35215 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord10.xyz - ( appendResult95_g35215 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35215 = ( (transform68_g35215).xyz - (transform62_g35215).xyz );
				half3 On20_g35216 = ObjectPositionWithPivots28_g35215;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35216 = On20_g35216;
				#else
				float3 staticSwitch14_g35216 = Off19_g35216;
				#endif
				half3 ObjectData20_g35217 = staticSwitch14_g35216;
				half3 WorldData19_g35217 = Off19_g35216;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35217 = WorldData19_g35217;
				#else
				float3 staticSwitch14_g35217 = ObjectData20_g35217;
				#endif
				float3 temp_output_42_0_g35215 = staticSwitch14_g35217;
				half3 ObjectData20_g35221 = temp_output_42_0_g35215;
				half3 WorldData19_g35221 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35221 = WorldData19_g35221;
				#else
				float3 staticSwitch14_g35221 = ObjectData20_g35221;
				#endif
				float2 temp_output_35_38_g35214 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35221).xz ) );
				half4 Legacy33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, temp_output_35_38_g35214 );
				half4 Vegetation33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Vegetation, samplerTVE_ColorsTex_Vegetation, temp_output_35_38_g35214 );
				half4 Grass33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Grass, samplerTVE_ColorsTex_Grass, temp_output_35_38_g35214 );
				half4 Objects33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Objects, samplerTVE_ColorsTex_Objects, temp_output_35_38_g35214 );
				half4 Custom33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_User, samplerTVE_ColorsTex_User, temp_output_35_38_g35214 );
				half4 localUSE_BUFFERS33_g35220 = USE_BUFFERS( Legacy33_g35220 , Vegetation33_g35220 , Grass33_g35220 , Objects33_g35220 , Custom33_g35220 );
				float4 temp_output_45_0_g35214 = localUSE_BUFFERS33_g35220;
				half3 Global_ColorsTex_RGB1700_g35167 = (temp_output_45_0_g35214).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g35174 = 2.0;
				#else
				float staticSwitch1_g35174 = 4.594794;
				#endif
				float lerpResult2103_g35167 = lerp( 1.0 , ( 1.0 - IN.ase_color.a ) , _ColorsMaskValue);
				float3 lerpResult108_g35167 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g35167 * staticSwitch1_g35174 ) ) , ( _GlobalColors * lerpResult2103_g35167 ));
				half3 Global_Colors1954_g35167 = lerpResult108_g35167;
				float3 temp_output_123_0_g35167 = ( Main_AlbedoTinted2808_g35167 * Global_Colors1954_g35167 );
				half3 Main_AlbedoColored863_g35167 = temp_output_123_0_g35167;
				half3 Blend_Albedo265_g35167 = Main_AlbedoColored863_g35167;
				float3 lerpResult2929_g35167 = lerp( float3( 1,1,1 ) , (TVE_MainLightParams).rgb , _SubsurfaceLightValue);
				half3 Subsurface_Color1722_g35167 = ( (_SubsurfaceColor).rgb * lerpResult2929_g35167 );
				half Global_ColorsTex_A1701_g35167 = (temp_output_45_0_g35214).w;
				float lerpResult1720_g35167 = lerp( 1.0 , Global_ColorsTex_A1701_g35167 , _GlobalHealthiness);
				half Subsurface_Intensity1752_g35167 = ( ( _SubsurfaceValue * lerpResult1720_g35167 ) + _SubsurfaceCat );
				float lerpResult3219_g35167 = lerp( 1.0 , IN.ase_color.a , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g35167 = lerpResult3219_g35167;
				half3 Subsurface_Transmission884_g35167 = ( Subsurface_Color1722_g35167 * Subsurface_Intensity1752_g35167 * Subsurface_Mask1557_g35167 );
				float3 normalizeResult1983_g35167 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g35167 = dot( -TVE_MainLightDirection , normalizeResult1983_g35167 );
				float saferPower1624_g35167 = max( (dotResult785_g35167*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g35167 = 0.0;
				#else
				float staticSwitch1602_g35167 = ( pow( saferPower1624_g35167 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g35167 = staticSwitch1602_g35167;
				half3 Subsurface_Forward1691_g35167 = ( Subsurface_Transmission884_g35167 * Mask_Subsurface_View782_g35167 );
				half3 Blend_AlbedoAndSubsurface149_g35167 = ( Blend_Albedo265_g35167 + Subsurface_Forward1691_g35167 );
				half3 Global_OverlayColor1758_g35167 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g35167 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g35167 );
				float2 appendResult88_g35247 = (float2(tex2DNode117_g35167.a , tex2DNode117_g35167.g));
				float2 temp_output_90_0_g35247 = ( (appendResult88_g35247*2.0 + -1.0) * _MainNormalValue );
				float2 break93_g35247 = temp_output_90_0_g35247;
				half Main_NormalY2095_g35167 = break93_g35247.y;
				half Overlay_Contrast1405_g35167 = _OverlayContrastValue;
				half Global_OverlayIntensity154_g35167 = TVE_OverlayIntensity;
				float4x4 break19_g35184 = GetObjectToWorldMatrix();
				float3 appendResult20_g35184 = (float3(break19_g35184[ 0 ][ 3 ] , break19_g35184[ 1 ][ 3 ] , break19_g35184[ 2 ][ 3 ]));
				half3 Off19_g35185 = appendResult20_g35184;
				float4 transform68_g35184 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord10);
				float3 appendResult95_g35184 = (float3(IN.ase_texcoord8.z , 0.0 , IN.ase_texcoord8.w));
				float4 transform62_g35184 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord10.xyz - ( appendResult95_g35184 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35184 = ( (transform68_g35184).xyz - (transform62_g35184).xyz );
				half3 On20_g35185 = ObjectPositionWithPivots28_g35184;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35185 = On20_g35185;
				#else
				float3 staticSwitch14_g35185 = Off19_g35185;
				#endif
				half3 ObjectData20_g35186 = staticSwitch14_g35185;
				half3 WorldData19_g35186 = Off19_g35185;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35186 = WorldData19_g35186;
				#else
				float3 staticSwitch14_g35186 = ObjectData20_g35186;
				#endif
				float3 temp_output_42_0_g35184 = staticSwitch14_g35186;
				half3 ObjectData20_g35183 = temp_output_42_0_g35184;
				half3 WorldData19_g35183 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35183 = WorldData19_g35183;
				#else
				float3 staticSwitch14_g35183 = ObjectData20_g35183;
				#endif
				float2 temp_output_43_38_g35181 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35183).xz ) );
				half4 Legacy33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g35181 );
				half4 Vegetation33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g35181 );
				half4 Grass33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g35181 );
				half4 Objects33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g35181 );
				half4 Custom33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g35181 );
				half4 localUSE_BUFFERS33_g35182 = USE_BUFFERS( Legacy33_g35182 , Vegetation33_g35182 , Grass33_g35182 , Objects33_g35182 , Custom33_g35182 );
				float4 break49_g35181 = localUSE_BUFFERS33_g35182;
				half Global_ExtrasTex_B156_g35167 = break49_g35181.z;
				float temp_output_1025_0_g35167 = ( Global_OverlayIntensity154_g35167 * _GlobalOverlay * Global_ExtrasTex_B156_g35167 );
				float lerpResult1065_g35167 = lerp( 1.0 , IN.ase_color.r , _OverlayVariationValue);
				half Overlay_Commons1365_g35167 = ( temp_output_1025_0_g35167 * lerpResult1065_g35167 );
				half Overlay_Mask269_g35167 = saturate( ( saturate( ( IN.ase_color.a + ( Main_NormalY2095_g35167 * Overlay_Contrast1405_g35167 ) ) ) - ( 1.0 - Overlay_Commons1365_g35167 ) ) );
				float3 lerpResult336_g35167 = lerp( Blend_AlbedoAndSubsurface149_g35167 , Global_OverlayColor1758_g35167 , Overlay_Mask269_g35167);
				half3 Final_Albedo359_g35167 = lerpResult336_g35167;
				half Main_Alpha316_g35167 = (temp_output_51_0_g35167).a;
				float lerpResult354_g35167 = lerp( 1.0 , Main_Alpha316_g35167 , _render_premul);
				half Final_Premultiply355_g35167 = lerpResult354_g35167;
				float3 temp_output_410_0_g35167 = ( Final_Albedo359_g35167 * Final_Premultiply355_g35167 );
				float3 temp_cast_12 = (1.0).xxx;
				half Mesh_Occlusion318_g35167 = IN.ase_color.g;
				float saferPower1201_g35167 = max( Mesh_Occlusion318_g35167 , 0.0001 );
				float3 lerpResult2945_g35167 = lerp( (_VertexOcclusionColor).rgb , temp_cast_12 , saturate( pow( saferPower1201_g35167 , ( _VertexOcclusionValue + _OcclusionCat ) ) ));
				half3 Vertex_Occlusion648_g35167 = lerpResult2945_g35167;
				
				float3 appendResult91_g35247 = (float3(temp_output_90_0_g35247 , 1.0));
				half3 Main_Normal137_g35167 = appendResult91_g35247;
				float3 temp_output_13_0_g35176 = Main_Normal137_g35167;
				float3 switchResult12_g35176 = (((ase_vface>0)?(temp_output_13_0_g35176):(( temp_output_13_0_g35176 * _render_normals_options ))));
				half3 Blend_Normal312_g35167 = switchResult12_g35176;
				half3 Final_Normal366_g35167 = Blend_Normal312_g35167;
				
				float4 tex2DNode35_g35167 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g35167 );
				half Main_Metallic237_g35167 = ( tex2DNode35_g35167.r * _MainMetallicValue );
				half Blend_Metallic306_g35167 = Main_Metallic237_g35167;
				float lerpResult342_g35167 = lerp( Blend_Metallic306_g35167 , 0.0 , Overlay_Mask269_g35167);
				half Final_Metallic367_g35167 = lerpResult342_g35167;
				
				half Main_Smoothness227_g35167 = ( tex2DNode35_g35167.a * _MainSmoothnessValue );
				half Blend_Smoothness314_g35167 = Main_Smoothness227_g35167;
				half Global_OverlaySmoothness311_g35167 = TVE_OverlaySmoothness;
				float lerpResult343_g35167 = lerp( Blend_Smoothness314_g35167 , Global_OverlaySmoothness311_g35167 , Overlay_Mask269_g35167);
				half Final_Smoothness371_g35167 = lerpResult343_g35167;
				half Global_Wetness1016_g35167 = ( TVE_Wetness * _GlobalWetness );
				half Global_ExtrasTex_A1033_g35167 = break49_g35181.w;
				float lerpResult1037_g35167 = lerp( Final_Smoothness371_g35167 , saturate( ( Final_Smoothness371_g35167 + Global_Wetness1016_g35167 ) ) , Global_ExtrasTex_A1033_g35167);
				
				float lerpResult240_g35167 = lerp( 1.0 , tex2DNode35_g35167.g , _MainOcclusionValue);
				half Main_Occlusion247_g35167 = lerpResult240_g35167;
				half Blend_Occlusion323_g35167 = Main_Occlusion247_g35167;
				
				float localCustomAlphaClip9_g35243 = ( 0.0 );
				half Main_AlphaRaw1203_g35167 = tex2DNode29_g35167.a;
				float Mesh_Variation16_g35167 = IN.ase_color.r;
				float lerpResult2262_g35167 = lerp( 0.9 , Mesh_Variation16_g35167 , _LeavesVariationValue);
				half Global_ExtrasTex_R174_g35167 = break49_g35181.x;
				float lerpResult2624_g35167 = lerp( 1.0 , Global_ExtrasTex_R174_g35167 , _GlobalLeaves);
				half AlphaTreshold2132_g35167 = _Cutoff;
				half Mask_Leaves315_g35167 = ( ( (lerpResult2262_g35167*0.5 + 0.5) - ( 1.0 - ( lerpResult2624_g35167 * _LocalLeaves ) ) ) + AlphaTreshold2132_g35167 );
				half Alpha5_g35243 = ( Main_AlphaRaw1203_g35167 * Mask_Leaves315_g35167 );
				float Alpha9_g35243 = Alpha5_g35243;
				#if _ALPHATEST_ON
				clip(Alpha9_g35243 - _Cutoff);
				#endif
				half Final_Clip914_g35167 = localCustomAlphaClip9_g35243;
				
				float3 Albedo = ( temp_output_410_0_g35167 * Vertex_Occlusion648_g35167 );
				float3 Normal = Final_Normal366_g35167;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = Final_Metallic367_g35167;
				float Smoothness = lerpResult1037_g35167;
				float Occlusion = Blend_Occlusion323_g35167;
				float Alpha = Main_Alpha316_g35167;
				float AlphaClipThreshold = Final_Clip914_g35167;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = Subsurface_Transmission884_g35167;
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
					float shadow = _Float18;

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
			#define _TRANSMISSION_ASE 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#define TVE_PIVOT_DATA_BAKED
			#define TVE_IS_GRASS_SHADER
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


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
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NoiseTintOne;
			half4 _SubsurfaceColor;
			float4 _LocalColors;
			half4 _MotionHighlightColor;
			half4 _MainUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_asset;
			half4 _GradientColorTwo;
			half4 _NoiseTintTwo;
			half4 _GradientColorOne;
			float4 _Color;
			half3 _render_normals_options;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _PerspectivePushValue;
			half _LocalSize;
			half _GlobalSize;
			half _PerspectiveCat;
			half _GlobalSizeFade;
			half _VertexMotionMode;
			half _VertexMotionSpace;
			half _VertexCat;
			half _Motion_32;
			half _Motion_Interaction;
			half _Motion_10;
			half _vertex_pivot_mode;
			half _VertexPivotMode;
			half _IsForwardPathShader;
			half _BatchingMessage;
			float _MotionVariation_32;
			half _DetailMapsMode;
			half _DetailTypeMode;
			half _GlobalCat;
			half _VertexDataMode;
			half _GradientMinValue;
			half _IsLitShader;
			half _GradientCat;
			half _LeavesVariationValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _OcclusionCat;
			half _VertexOcclusionValue;
			half _render_premul;
			half _OverlayVariationValue;
			half _GlobalOverlay;
			half _OverlayContrastValue;
			half _SubsurfaceViewValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceCat;
			half _GlobalHealthiness;
			half _SubsurfaceValue;
			half _SubsurfaceLightValue;
			half _ColorsMaskValue;
			half _GlobalColors;
			half _NoiseMaxValue;
			half _NoiseMinValue;
			half _MoiseCat;
			half _NoiseScaleValue;
			half _ObjectDataMessage;
			half _GradientMaxValue;
			half _DetailCat;
			half _MainCat;
			float _MotionScale_20;
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
			half _InteractionVariation;
			float _ObjectOcclusionValue;
			float _GrassPerspectiveAngleValue;
			float _SubsurfaceMaxValue;
			half _GlobalSpace;
			half _DetailSpace;
			half _render_cull;
			float _Float18;
			half _IsGrassShader;
			half _Banner;
			half _render_src;
			half _IsStandardShader;
			half _render_dst;
			half _render_cutoff;
			half _render_zw;
			float _SubsurfaceMinValue;
			half _AdvancedCat;
			float _MotionScale_32;
			half _Cutoff;
			half _GlobalLeaves;
			float _MotionVariation_30;
			half _RenderMode;
			half _MotionAmplitude_20;
			half _MotionVariation_10;
			half _WorldDataMessage;
			float _MotionSpeed_10;
			half _DetailMode;
			half _RenderPriority;
			half _RenderBlend;
			half _RenderZWrite;
			half _MotionAmplitude_32;
			half _RenderCull;
			half _IsTVEShader;
			float _MotionSpeed_30;
			half _MotionAmplitude_10;
			float _MotionScale_10;
			float _MotionSpeed_20;
			half _RenderClip;
			half _InteractionAmplitude;
			float _MotionSpeed_32;
			float _MotionScale_30;
			half _RenderNormals;
			half _MainNormalValue;
			half _IsVersion;
			half _RenderingCat;
			half _VertexVariationMode;
			half _MotionVariation_20;
			half _PivotsMessage;
			half _LocalLeaves;
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
				half3 Off19_g35190 = _Vector1;
				float3 appendResult2827_g35167 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				half3 Mesh_PivotsData2831_g35167 = ( appendResult2827_g35167 * _VertexPivotMode );
				half3 On20_g35190 = Mesh_PivotsData2831_g35167;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35190 = On20_g35190;
				#else
				float3 staticSwitch14_g35190 = Off19_g35190;
				#endif
				half3 ObjectData20_g35191 = staticSwitch14_g35190;
				half3 WorldData19_g35191 = Off19_g35190;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35191 = WorldData19_g35191;
				#else
				float3 staticSwitch14_g35191 = ObjectData20_g35191;
				#endif
				#ifdef TVE_VERTEX_DATA_WORLD
				float3 staticSwitch14_g35213 = _Vector1;
				#else
				float3 staticSwitch14_g35213 = staticSwitch14_g35191;
				#endif
				half3 Mesh_PivotsOS2291_g35167 = staticSwitch14_g35213;
				float3 temp_output_2283_0_g35167 = ( v.vertex.xyz - Mesh_PivotsOS2291_g35167 );
				half3 VertexPos40_g35258 = temp_output_2283_0_g35167;
				float3 appendResult74_g35258 = (float3(VertexPos40_g35258.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g35258 = appendResult74_g35258;
				float3 break84_g35258 = VertexPos40_g35258;
				float3 appendResult81_g35258 = (float3(0.0 , break84_g35258.y , break84_g35258.z));
				half3 VertexPosOtherAxis82_g35258 = appendResult81_g35258;
				float ObjectData20_g35232 = 3.14;
				float Bounds_Height374_g35167 = _MaxBoundsInfo.y;
				float WorldData19_g35232 = ( Bounds_Height374_g35167 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35232 = WorldData19_g35232;
				#else
				float staticSwitch14_g35232 = ObjectData20_g35232;
				#endif
				float Motion_Max_Bending1133_g35167 = staticSwitch14_g35232;
				float4x4 break19_g35225 = GetObjectToWorldMatrix();
				float3 appendResult20_g35225 = (float3(break19_g35225[ 0 ][ 3 ] , break19_g35225[ 1 ][ 3 ] , break19_g35225[ 2 ][ 3 ]));
				half3 Off19_g35226 = appendResult20_g35225;
				float4 transform68_g35225 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g35225 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g35225 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g35225 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35225 = ( (transform68_g35225).xyz - (transform62_g35225).xyz );
				half3 On20_g35226 = ObjectPositionWithPivots28_g35225;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35226 = On20_g35226;
				#else
				float3 staticSwitch14_g35226 = Off19_g35226;
				#endif
				half3 ObjectData20_g35227 = staticSwitch14_g35226;
				half3 WorldData19_g35227 = Off19_g35226;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35227 = WorldData19_g35227;
				#else
				float3 staticSwitch14_g35227 = ObjectData20_g35227;
				#endif
				float3 temp_output_42_0_g35225 = staticSwitch14_g35227;
				half3 ObjectData20_g35230 = temp_output_42_0_g35225;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g35230 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35230 = WorldData19_g35230;
				#else
				float3 staticSwitch14_g35230 = ObjectData20_g35230;
				#endif
				float2 temp_output_39_38_g35223 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35230).xz ) );
				half4 Legacy33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, temp_output_39_38_g35223, 0.0 );
				half4 Vegetation33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Vegetation, samplerTVE_MotionTex_Vegetation, temp_output_39_38_g35223, 0.0 );
				half4 Grass33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Grass, samplerTVE_MotionTex_Grass, temp_output_39_38_g35223, 0.0 );
				half4 Objects33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Objects, samplerTVE_MotionTex_Objects, temp_output_39_38_g35223, 0.0 );
				half4 Custom33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_User, samplerTVE_MotionTex_User, temp_output_39_38_g35223, 0.0 );
				half4 localUSE_BUFFERS33_g35231 = USE_BUFFERS( Legacy33_g35231 , Vegetation33_g35231 , Grass33_g35231 , Objects33_g35231 , Custom33_g35231 );
				float4 break322_g35179 = localUSE_BUFFERS33_g35231;
				half Wind_Power369_g35179 = saturate( ( (break322_g35179.z*2.0 + -1.0) + TVE_WindPower ) );
				half Wind_Power_103106_g35167 = Wind_Power369_g35179;
				float3 appendResult323_g35179 = (float3(break322_g35179.x , 0.0 , break322_g35179.y));
				float3 temp_output_324_0_g35179 = (appendResult323_g35179*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g35179 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g35179 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g35167 = (temp_output_339_0_g35179).xz;
				half Motion_Use1056_g35167 = _Motion_10;
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch160_g35199 = TVE_NoiseSpeed_Grass;
				#else
				float2 staticSwitch160_g35199 = TVE_NoiseSpeed_Vegetation;
				#endif
				float4x4 break19_g35201 = GetObjectToWorldMatrix();
				float3 appendResult20_g35201 = (float3(break19_g35201[ 0 ][ 3 ] , break19_g35201[ 1 ][ 3 ] , break19_g35201[ 2 ][ 3 ]));
				half3 Off19_g35202 = appendResult20_g35201;
				float4 transform68_g35201 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35201 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35201 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35201 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35201 = ( (transform68_g35201).xyz - (transform62_g35201).xyz );
				half3 On20_g35202 = ObjectPositionWithPivots28_g35201;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35202 = On20_g35202;
				#else
				float3 staticSwitch14_g35202 = Off19_g35202;
				#endif
				half3 ObjectData20_g35203 = staticSwitch14_g35202;
				half3 WorldData19_g35203 = Off19_g35202;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35203 = WorldData19_g35203;
				#else
				float3 staticSwitch14_g35203 = ObjectData20_g35203;
				#endif
				float3 temp_output_42_0_g35201 = staticSwitch14_g35203;
				half3 ObjectData20_g35200 = temp_output_42_0_g35201;
				half3 WorldData19_g35200 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35200 = WorldData19_g35200;
				#else
				float3 staticSwitch14_g35200 = ObjectData20_g35200;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch164_g35199 = (ase_worldPos).xz;
				#else
				float2 staticSwitch164_g35199 = (staticSwitch14_g35200).xz;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float staticSwitch161_g35199 = TVE_NoiseSize_Grass;
				#else
				float staticSwitch161_g35199 = TVE_NoiseSize_Vegetation;
				#endif
				float2 panner73_g35199 = ( _TimeParameters.x * staticSwitch160_g35199 + ( staticSwitch164_g35199 * staticSwitch161_g35199 ));
				float4 tex2DNode75_g35199 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g35199, 0.0 );
				float4 saferPower77_g35199 = max( abs( tex2DNode75_g35199 ) , 0.0001 );
				float4 temp_cast_9 = (TVE_NoiseContrast).xxxx;
				float4 break142_g35199 = pow( saferPower77_g35199 , temp_cast_9 );
				half Global_NoiseTex_R34_g35167 = break142_g35199.r;
				half Input_Speed62_g35256 = _MotionSpeed_10;
				float mulTime373_g35256 = _TimeParameters.x * Input_Speed62_g35256;
				float4x4 break19_g35238 = GetObjectToWorldMatrix();
				float3 appendResult20_g35238 = (float3(break19_g35238[ 0 ][ 3 ] , break19_g35238[ 1 ][ 3 ] , break19_g35238[ 2 ][ 3 ]));
				half3 Off19_g35239 = appendResult20_g35238;
				float4 transform68_g35238 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35238 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35238 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35238 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35238 = ( (transform68_g35238).xyz - (transform62_g35238).xyz );
				half3 On20_g35239 = ObjectPositionWithPivots28_g35238;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35239 = On20_g35239;
				#else
				float3 staticSwitch14_g35239 = Off19_g35239;
				#endif
				half3 ObjectData20_g35240 = staticSwitch14_g35239;
				half3 WorldData19_g35240 = Off19_g35239;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35240 = WorldData19_g35240;
				#else
				float3 staticSwitch14_g35240 = ObjectData20_g35240;
				#endif
				float3 temp_output_42_0_g35238 = staticSwitch14_g35240;
				float3 break9_g35238 = temp_output_42_0_g35238;
				half Variation_Complex102_g35235 = frac( ( v.ase_color.r + ( break9_g35238.x + break9_g35238.z ) ) );
				float ObjectData20_g35237 = Variation_Complex102_g35235;
				half Variation_Simple105_g35235 = v.ase_color.r;
				float WorldData19_g35237 = Variation_Simple105_g35235;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35237 = WorldData19_g35237;
				#else
				float staticSwitch14_g35237 = ObjectData20_g35237;
				#endif
				half Variation3073_g35167 = staticSwitch14_g35237;
				half Motion_Variation284_g35256 = ( _MotionVariation_10 * Variation3073_g35167 );
				float2 appendResult344_g35256 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g35256 = ( _MotionScale_10 * appendResult344_g35256 );
				half2 Sine_MinusOneToOne281_g35256 = sin( ( mulTime373_g35256 + Motion_Variation284_g35256 + Motion_Scale287_g35256 ) );
				float2 temp_cast_11 = (1.0).xx;
				half Input_Turbulence327_g35256 = Global_NoiseTex_R34_g35167;
				float2 lerpResult321_g35256 = lerp( Sine_MinusOneToOne281_g35256 , temp_cast_11 , Input_Turbulence327_g35256);
				half2 Motion_Bending2258_g35167 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g35167 ) * Wind_Power_103106_g35167 * Wind_DirectionOS39_g35167 * Motion_Use1056_g35167 * Global_NoiseTex_R34_g35167 * lerpResult321_g35256 );
				half Motion_UseInteraction2097_g35167 = _Motion_Interaction;
				half Motion_InteractionMask66_g35167 = break322_g35179.w;
				float lerpResult3307_g35167 = lerp( 1.0 , Variation3073_g35167 , _InteractionVariation);
				half2 Motion_Interaction53_g35167 = ( _InteractionAmplitude * Motion_Max_Bending1133_g35167 * Motion_UseInteraction2097_g35167 * Motion_InteractionMask66_g35167 * Motion_InteractionMask66_g35167 * Wind_DirectionOS39_g35167 * lerpResult3307_g35167 );
				float2 lerpResult109_g35167 = lerp( Motion_Bending2258_g35167 , Motion_Interaction53_g35167 , Motion_InteractionMask66_g35167);
				half Mesh_Motion_182_g35167 = v.ase_texcoord3.x;
				float2 break143_g35167 = ( lerpResult109_g35167 * Mesh_Motion_182_g35167 );
				half Motion_Z190_g35167 = break143_g35167.y;
				half Angle44_g35258 = Motion_Z190_g35167;
				half3 VertexPos40_g35250 = ( VertexPosRotationAxis50_g35258 + ( VertexPosOtherAxis82_g35258 * cos( Angle44_g35258 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g35258 ) * sin( Angle44_g35258 ) ) );
				float3 appendResult74_g35250 = (float3(0.0 , 0.0 , VertexPos40_g35250.z));
				half3 VertexPosRotationAxis50_g35250 = appendResult74_g35250;
				float3 break84_g35250 = VertexPos40_g35250;
				float3 appendResult81_g35250 = (float3(break84_g35250.x , break84_g35250.y , 0.0));
				half3 VertexPosOtherAxis82_g35250 = appendResult81_g35250;
				half Motion_X216_g35167 = break143_g35167.x;
				half Angle44_g35250 = -Motion_X216_g35167;
				half Motion_Scale321_g35248 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g35248 = _MotionSpeed_32;
				float mulTime349_g35248 = _TimeParameters.x * Input_Speed62_g35248;
				float Motion_Variation330_g35248 = ( _MotionVariation_32 * v.ase_color.r );
				float Bounds_Radius121_g35167 = _MaxBoundsInfo.x;
				half Input_Amplitude58_g35248 = ( _MotionAmplitude_32 * Bounds_Radius121_g35167 * 0.1 );
				float3 appendResult345_g35248 = (float3(v.ase_color.r , ( 1.0 - v.ase_color.r ) , v.ase_color.r));
				half Global_NoiseTex_B132_g35167 = break142_g35199.b;
				half Mesh_Motion_3144_g35167 = v.ase_texcoord3.z;
				half Motion_Use322013_g35167 = _Motion_32;
				float lerpResult376_g35179 = lerp( 0.1 , 1.0 , Wind_Power369_g35179);
				half Wind_Power_323115_g35167 = lerpResult376_g35179;
				half3 Motion_Flutter263_g35167 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g35248 ) + mulTime349_g35248 + Motion_Variation330_g35248 ) ) * Input_Amplitude58_g35248 * appendResult345_g35248 ) * ( ( Global_NoiseTex_R34_g35167 + Global_NoiseTex_B132_g35167 ) * Mesh_Motion_3144_g35167 * Motion_Use322013_g35167 * Wind_Power_323115_g35167 ) );
				half Wind_Mode3167_g35167 = TVE_WindMode;
				float3 lerpResult3168_g35167 = lerp( v.vertex.xyz , ( ( VertexPosRotationAxis50_g35250 + ( VertexPosOtherAxis82_g35250 * cos( Angle44_g35250 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g35250 ) * sin( Angle44_g35250 ) ) ) + Motion_Flutter263_g35167 ) , Wind_Mode3167_g35167);
				float3 Vertex_Motion_Object833_g35167 = lerpResult3168_g35167;
				float3 appendResult2043_g35167 = (float3(Motion_X216_g35167 , 0.0 , Motion_Z190_g35167));
				float3 lerpResult3173_g35167 = lerp( v.vertex.xyz , ( ( v.vertex.xyz + appendResult2043_g35167 ) + Motion_Flutter263_g35167 ) , Wind_Mode3167_g35167);
				float3 Vertex_Motion_World1118_g35167 = lerpResult3173_g35167;
				float3 temp_output_3331_0_g35167 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g35167 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g35167 = Vertex_Motion_Object833_g35167;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g35167 = temp_output_3331_0_g35167;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g35167 = temp_output_3331_0_g35167;
				#else
				float3 staticSwitch3312_g35167 = Vertex_Motion_Object833_g35167;
				#endif
				half3 ObjectData20_g35178 = staticSwitch3312_g35167;
				half3 WorldData19_g35178 = Vertex_Motion_World1118_g35167;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35178 = WorldData19_g35178;
				#else
				float3 staticSwitch14_g35178 = ObjectData20_g35178;
				#endif
				float4x4 break19_g35194 = GetObjectToWorldMatrix();
				float3 appendResult20_g35194 = (float3(break19_g35194[ 0 ][ 3 ] , break19_g35194[ 1 ][ 3 ] , break19_g35194[ 2 ][ 3 ]));
				half3 Off19_g35195 = appendResult20_g35194;
				float4 transform68_g35194 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g35194 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g35194 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g35194 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35194 = ( (transform68_g35194).xyz - (transform62_g35194).xyz );
				half3 On20_g35195 = ObjectPositionWithPivots28_g35194;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35195 = On20_g35195;
				#else
				float3 staticSwitch14_g35195 = Off19_g35195;
				#endif
				half3 ObjectData20_g35196 = staticSwitch14_g35195;
				half3 WorldData19_g35196 = Off19_g35195;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35196 = WorldData19_g35196;
				#else
				float3 staticSwitch14_g35196 = ObjectData20_g35196;
				#endif
				float3 temp_output_42_0_g35194 = staticSwitch14_g35196;
				float temp_output_7_0_g35245 = TVE_SizeFadeEnd;
				float ObjectData20_g35193 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g35194 ) * _GlobalSizeFade ) - temp_output_7_0_g35245 ) / ( TVE_SizeFadeStart - temp_output_7_0_g35245 ) ) );
				float WorldData19_g35193 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35193 = WorldData19_g35193;
				#else
				float staticSwitch14_g35193 = ObjectData20_g35193;
				#endif
				float Vertex_SizeFade1740_g35167 = staticSwitch14_g35193;
				float4x4 break19_g35184 = GetObjectToWorldMatrix();
				float3 appendResult20_g35184 = (float3(break19_g35184[ 0 ][ 3 ] , break19_g35184[ 1 ][ 3 ] , break19_g35184[ 2 ][ 3 ]));
				half3 Off19_g35185 = appendResult20_g35184;
				float4 transform68_g35184 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35184 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35184 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35184 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35184 = ( (transform68_g35184).xyz - (transform62_g35184).xyz );
				half3 On20_g35185 = ObjectPositionWithPivots28_g35184;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35185 = On20_g35185;
				#else
				float3 staticSwitch14_g35185 = Off19_g35185;
				#endif
				half3 ObjectData20_g35186 = staticSwitch14_g35185;
				half3 WorldData19_g35186 = Off19_g35185;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35186 = WorldData19_g35186;
				#else
				float3 staticSwitch14_g35186 = ObjectData20_g35186;
				#endif
				float3 temp_output_42_0_g35184 = staticSwitch14_g35186;
				half3 ObjectData20_g35183 = temp_output_42_0_g35184;
				half3 WorldData19_g35183 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35183 = WorldData19_g35183;
				#else
				float3 staticSwitch14_g35183 = ObjectData20_g35183;
				#endif
				float2 temp_output_43_38_g35181 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35183).xz ) );
				half4 Legacy33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g35181, 0.0 );
				half4 Vegetation33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g35181, 0.0 );
				half4 Grass33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g35181, 0.0 );
				half4 Objects33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g35181, 0.0 );
				half4 Custom33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g35181, 0.0 );
				half4 localUSE_BUFFERS33_g35182 = USE_BUFFERS( Legacy33_g35182 , Vegetation33_g35182 , Grass33_g35182 , Objects33_g35182 , Custom33_g35182 );
				float4 break49_g35181 = localUSE_BUFFERS33_g35182;
				half Global_ExtrasTex_G305_g35167 = break49_g35181.y;
				float lerpResult346_g35167 = lerp( 1.0 , Global_ExtrasTex_G305_g35167 , _GlobalSize);
				float ObjectData20_g35192 = ( lerpResult346_g35167 * _LocalSize );
				float WorldData19_g35192 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35192 = WorldData19_g35192;
				#else
				float staticSwitch14_g35192 = ObjectData20_g35192;
				#endif
				half Vertex_Size1741_g35167 = staticSwitch14_g35192;
				float3 normalizeResult2696_g35167 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float3 break2709_g35167 = cross( normalizeResult2696_g35167 , half3(0,1,0) );
				float3 appendResult2710_g35167 = (float3(-break2709_g35167.z , 0.0 , break2709_g35167.x));
				float3 appendResult2667_g35167 = (float3(v.ase_color.r , 0.5 , v.ase_color.r));
				float3 normalizeResult2210_g35167 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float dotResult2212_g35167 = dot( normalizeResult2210_g35167 , float3(0,1,0) );
				half Mask_HView2656_g35167 = abs( dotResult2212_g35167 );
				float saferPower2652_g35167 = max( Mask_HView2656_g35167 , 0.0001 );
				half3 Grass_Coverage2661_g35167 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g35167 , 0.0 ) ).xyz * ( _PerspectivePushValue + _PerspectiveCat ) ) + ( (appendResult2667_g35167*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * v.ase_color.a * pow( saferPower2652_g35167 , _PerspectiveAngleValue ) );
				float3 Final_VertexPosition890_g35167 = ( ( staticSwitch14_g35178 * Vertex_SizeFade1740_g35167 * Vertex_Size1741_g35167 ) + Mesh_PivotsOS2291_g35167 + Grass_Coverage2661_g35167 );
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.vertex;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g35167;
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

				half2 Main_UVs15_g35167 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g35167 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g35167 );
				float4 temp_output_51_0_g35167 = ( _MainColor * tex2DNode29_g35167 );
				half Main_Alpha316_g35167 = (temp_output_51_0_g35167).a;
				
				float localCustomAlphaClip9_g35243 = ( 0.0 );
				half Main_AlphaRaw1203_g35167 = tex2DNode29_g35167.a;
				float Mesh_Variation16_g35167 = IN.ase_color.r;
				float lerpResult2262_g35167 = lerp( 0.9 , Mesh_Variation16_g35167 , _LeavesVariationValue);
				float4x4 break19_g35184 = GetObjectToWorldMatrix();
				float3 appendResult20_g35184 = (float3(break19_g35184[ 0 ][ 3 ] , break19_g35184[ 1 ][ 3 ] , break19_g35184[ 2 ][ 3 ]));
				half3 Off19_g35185 = appendResult20_g35184;
				float4 transform68_g35184 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord3);
				float3 appendResult95_g35184 = (float3(IN.ase_texcoord2.z , 0.0 , IN.ase_texcoord2.w));
				float4 transform62_g35184 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord3.xyz - ( appendResult95_g35184 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35184 = ( (transform68_g35184).xyz - (transform62_g35184).xyz );
				half3 On20_g35185 = ObjectPositionWithPivots28_g35184;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35185 = On20_g35185;
				#else
				float3 staticSwitch14_g35185 = Off19_g35185;
				#endif
				half3 ObjectData20_g35186 = staticSwitch14_g35185;
				half3 WorldData19_g35186 = Off19_g35185;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35186 = WorldData19_g35186;
				#else
				float3 staticSwitch14_g35186 = ObjectData20_g35186;
				#endif
				float3 temp_output_42_0_g35184 = staticSwitch14_g35186;
				half3 ObjectData20_g35183 = temp_output_42_0_g35184;
				half3 WorldData19_g35183 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35183 = WorldData19_g35183;
				#else
				float3 staticSwitch14_g35183 = ObjectData20_g35183;
				#endif
				float2 temp_output_43_38_g35181 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35183).xz ) );
				half4 Legacy33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g35181 );
				half4 Vegetation33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g35181 );
				half4 Grass33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g35181 );
				half4 Objects33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g35181 );
				half4 Custom33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g35181 );
				half4 localUSE_BUFFERS33_g35182 = USE_BUFFERS( Legacy33_g35182 , Vegetation33_g35182 , Grass33_g35182 , Objects33_g35182 , Custom33_g35182 );
				float4 break49_g35181 = localUSE_BUFFERS33_g35182;
				half Global_ExtrasTex_R174_g35167 = break49_g35181.x;
				float lerpResult2624_g35167 = lerp( 1.0 , Global_ExtrasTex_R174_g35167 , _GlobalLeaves);
				half AlphaTreshold2132_g35167 = _Cutoff;
				half Mask_Leaves315_g35167 = ( ( (lerpResult2262_g35167*0.5 + 0.5) - ( 1.0 - ( lerpResult2624_g35167 * _LocalLeaves ) ) ) + AlphaTreshold2132_g35167 );
				half Alpha5_g35243 = ( Main_AlphaRaw1203_g35167 * Mask_Leaves315_g35167 );
				float Alpha9_g35243 = Alpha5_g35243;
				#if _ALPHATEST_ON
				clip(Alpha9_g35243 - _Cutoff);
				#endif
				half Final_Clip914_g35167 = localCustomAlphaClip9_g35243;
				
				float Alpha = Main_Alpha316_g35167;
				float AlphaClipThreshold = Final_Clip914_g35167;
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
			#define _TRANSMISSION_ASE 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#define TVE_PIVOT_DATA_BAKED
			#define TVE_IS_GRASS_SHADER
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


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
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NoiseTintOne;
			half4 _SubsurfaceColor;
			float4 _LocalColors;
			half4 _MotionHighlightColor;
			half4 _MainUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_asset;
			half4 _GradientColorTwo;
			half4 _NoiseTintTwo;
			half4 _GradientColorOne;
			float4 _Color;
			half3 _render_normals_options;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _PerspectivePushValue;
			half _LocalSize;
			half _GlobalSize;
			half _PerspectiveCat;
			half _GlobalSizeFade;
			half _VertexMotionMode;
			half _VertexMotionSpace;
			half _VertexCat;
			half _Motion_32;
			half _Motion_Interaction;
			half _Motion_10;
			half _vertex_pivot_mode;
			half _VertexPivotMode;
			half _IsForwardPathShader;
			half _BatchingMessage;
			float _MotionVariation_32;
			half _DetailMapsMode;
			half _DetailTypeMode;
			half _GlobalCat;
			half _VertexDataMode;
			half _GradientMinValue;
			half _IsLitShader;
			half _GradientCat;
			half _LeavesVariationValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _OcclusionCat;
			half _VertexOcclusionValue;
			half _render_premul;
			half _OverlayVariationValue;
			half _GlobalOverlay;
			half _OverlayContrastValue;
			half _SubsurfaceViewValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceCat;
			half _GlobalHealthiness;
			half _SubsurfaceValue;
			half _SubsurfaceLightValue;
			half _ColorsMaskValue;
			half _GlobalColors;
			half _NoiseMaxValue;
			half _NoiseMinValue;
			half _MoiseCat;
			half _NoiseScaleValue;
			half _ObjectDataMessage;
			half _GradientMaxValue;
			half _DetailCat;
			half _MainCat;
			float _MotionScale_20;
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
			half _InteractionVariation;
			float _ObjectOcclusionValue;
			float _GrassPerspectiveAngleValue;
			float _SubsurfaceMaxValue;
			half _GlobalSpace;
			half _DetailSpace;
			half _render_cull;
			float _Float18;
			half _IsGrassShader;
			half _Banner;
			half _render_src;
			half _IsStandardShader;
			half _render_dst;
			half _render_cutoff;
			half _render_zw;
			float _SubsurfaceMinValue;
			half _AdvancedCat;
			float _MotionScale_32;
			half _Cutoff;
			half _GlobalLeaves;
			float _MotionVariation_30;
			half _RenderMode;
			half _MotionAmplitude_20;
			half _MotionVariation_10;
			half _WorldDataMessage;
			float _MotionSpeed_10;
			half _DetailMode;
			half _RenderPriority;
			half _RenderBlend;
			half _RenderZWrite;
			half _MotionAmplitude_32;
			half _RenderCull;
			half _IsTVEShader;
			float _MotionSpeed_30;
			half _MotionAmplitude_10;
			float _MotionScale_10;
			float _MotionSpeed_20;
			half _RenderClip;
			half _InteractionAmplitude;
			float _MotionSpeed_32;
			float _MotionScale_30;
			half _RenderNormals;
			half _MainNormalValue;
			half _IsVersion;
			half _RenderingCat;
			half _VertexVariationMode;
			half _MotionVariation_20;
			half _PivotsMessage;
			half _LocalLeaves;
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
				half3 Off19_g35190 = _Vector1;
				float3 appendResult2827_g35167 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				half3 Mesh_PivotsData2831_g35167 = ( appendResult2827_g35167 * _VertexPivotMode );
				half3 On20_g35190 = Mesh_PivotsData2831_g35167;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35190 = On20_g35190;
				#else
				float3 staticSwitch14_g35190 = Off19_g35190;
				#endif
				half3 ObjectData20_g35191 = staticSwitch14_g35190;
				half3 WorldData19_g35191 = Off19_g35190;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35191 = WorldData19_g35191;
				#else
				float3 staticSwitch14_g35191 = ObjectData20_g35191;
				#endif
				#ifdef TVE_VERTEX_DATA_WORLD
				float3 staticSwitch14_g35213 = _Vector1;
				#else
				float3 staticSwitch14_g35213 = staticSwitch14_g35191;
				#endif
				half3 Mesh_PivotsOS2291_g35167 = staticSwitch14_g35213;
				float3 temp_output_2283_0_g35167 = ( v.vertex.xyz - Mesh_PivotsOS2291_g35167 );
				half3 VertexPos40_g35258 = temp_output_2283_0_g35167;
				float3 appendResult74_g35258 = (float3(VertexPos40_g35258.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g35258 = appendResult74_g35258;
				float3 break84_g35258 = VertexPos40_g35258;
				float3 appendResult81_g35258 = (float3(0.0 , break84_g35258.y , break84_g35258.z));
				half3 VertexPosOtherAxis82_g35258 = appendResult81_g35258;
				float ObjectData20_g35232 = 3.14;
				float Bounds_Height374_g35167 = _MaxBoundsInfo.y;
				float WorldData19_g35232 = ( Bounds_Height374_g35167 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35232 = WorldData19_g35232;
				#else
				float staticSwitch14_g35232 = ObjectData20_g35232;
				#endif
				float Motion_Max_Bending1133_g35167 = staticSwitch14_g35232;
				float4x4 break19_g35225 = GetObjectToWorldMatrix();
				float3 appendResult20_g35225 = (float3(break19_g35225[ 0 ][ 3 ] , break19_g35225[ 1 ][ 3 ] , break19_g35225[ 2 ][ 3 ]));
				half3 Off19_g35226 = appendResult20_g35225;
				float4 transform68_g35225 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g35225 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g35225 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g35225 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35225 = ( (transform68_g35225).xyz - (transform62_g35225).xyz );
				half3 On20_g35226 = ObjectPositionWithPivots28_g35225;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35226 = On20_g35226;
				#else
				float3 staticSwitch14_g35226 = Off19_g35226;
				#endif
				half3 ObjectData20_g35227 = staticSwitch14_g35226;
				half3 WorldData19_g35227 = Off19_g35226;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35227 = WorldData19_g35227;
				#else
				float3 staticSwitch14_g35227 = ObjectData20_g35227;
				#endif
				float3 temp_output_42_0_g35225 = staticSwitch14_g35227;
				half3 ObjectData20_g35230 = temp_output_42_0_g35225;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g35230 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35230 = WorldData19_g35230;
				#else
				float3 staticSwitch14_g35230 = ObjectData20_g35230;
				#endif
				float2 temp_output_39_38_g35223 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35230).xz ) );
				half4 Legacy33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, temp_output_39_38_g35223, 0.0 );
				half4 Vegetation33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Vegetation, samplerTVE_MotionTex_Vegetation, temp_output_39_38_g35223, 0.0 );
				half4 Grass33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Grass, samplerTVE_MotionTex_Grass, temp_output_39_38_g35223, 0.0 );
				half4 Objects33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Objects, samplerTVE_MotionTex_Objects, temp_output_39_38_g35223, 0.0 );
				half4 Custom33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_User, samplerTVE_MotionTex_User, temp_output_39_38_g35223, 0.0 );
				half4 localUSE_BUFFERS33_g35231 = USE_BUFFERS( Legacy33_g35231 , Vegetation33_g35231 , Grass33_g35231 , Objects33_g35231 , Custom33_g35231 );
				float4 break322_g35179 = localUSE_BUFFERS33_g35231;
				half Wind_Power369_g35179 = saturate( ( (break322_g35179.z*2.0 + -1.0) + TVE_WindPower ) );
				half Wind_Power_103106_g35167 = Wind_Power369_g35179;
				float3 appendResult323_g35179 = (float3(break322_g35179.x , 0.0 , break322_g35179.y));
				float3 temp_output_324_0_g35179 = (appendResult323_g35179*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g35179 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g35179 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g35167 = (temp_output_339_0_g35179).xz;
				half Motion_Use1056_g35167 = _Motion_10;
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch160_g35199 = TVE_NoiseSpeed_Grass;
				#else
				float2 staticSwitch160_g35199 = TVE_NoiseSpeed_Vegetation;
				#endif
				float4x4 break19_g35201 = GetObjectToWorldMatrix();
				float3 appendResult20_g35201 = (float3(break19_g35201[ 0 ][ 3 ] , break19_g35201[ 1 ][ 3 ] , break19_g35201[ 2 ][ 3 ]));
				half3 Off19_g35202 = appendResult20_g35201;
				float4 transform68_g35201 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35201 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35201 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35201 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35201 = ( (transform68_g35201).xyz - (transform62_g35201).xyz );
				half3 On20_g35202 = ObjectPositionWithPivots28_g35201;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35202 = On20_g35202;
				#else
				float3 staticSwitch14_g35202 = Off19_g35202;
				#endif
				half3 ObjectData20_g35203 = staticSwitch14_g35202;
				half3 WorldData19_g35203 = Off19_g35202;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35203 = WorldData19_g35203;
				#else
				float3 staticSwitch14_g35203 = ObjectData20_g35203;
				#endif
				float3 temp_output_42_0_g35201 = staticSwitch14_g35203;
				half3 ObjectData20_g35200 = temp_output_42_0_g35201;
				half3 WorldData19_g35200 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35200 = WorldData19_g35200;
				#else
				float3 staticSwitch14_g35200 = ObjectData20_g35200;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch164_g35199 = (ase_worldPos).xz;
				#else
				float2 staticSwitch164_g35199 = (staticSwitch14_g35200).xz;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float staticSwitch161_g35199 = TVE_NoiseSize_Grass;
				#else
				float staticSwitch161_g35199 = TVE_NoiseSize_Vegetation;
				#endif
				float2 panner73_g35199 = ( _TimeParameters.x * staticSwitch160_g35199 + ( staticSwitch164_g35199 * staticSwitch161_g35199 ));
				float4 tex2DNode75_g35199 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g35199, 0.0 );
				float4 saferPower77_g35199 = max( abs( tex2DNode75_g35199 ) , 0.0001 );
				float4 temp_cast_9 = (TVE_NoiseContrast).xxxx;
				float4 break142_g35199 = pow( saferPower77_g35199 , temp_cast_9 );
				half Global_NoiseTex_R34_g35167 = break142_g35199.r;
				half Input_Speed62_g35256 = _MotionSpeed_10;
				float mulTime373_g35256 = _TimeParameters.x * Input_Speed62_g35256;
				float4x4 break19_g35238 = GetObjectToWorldMatrix();
				float3 appendResult20_g35238 = (float3(break19_g35238[ 0 ][ 3 ] , break19_g35238[ 1 ][ 3 ] , break19_g35238[ 2 ][ 3 ]));
				half3 Off19_g35239 = appendResult20_g35238;
				float4 transform68_g35238 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35238 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35238 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35238 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35238 = ( (transform68_g35238).xyz - (transform62_g35238).xyz );
				half3 On20_g35239 = ObjectPositionWithPivots28_g35238;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35239 = On20_g35239;
				#else
				float3 staticSwitch14_g35239 = Off19_g35239;
				#endif
				half3 ObjectData20_g35240 = staticSwitch14_g35239;
				half3 WorldData19_g35240 = Off19_g35239;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35240 = WorldData19_g35240;
				#else
				float3 staticSwitch14_g35240 = ObjectData20_g35240;
				#endif
				float3 temp_output_42_0_g35238 = staticSwitch14_g35240;
				float3 break9_g35238 = temp_output_42_0_g35238;
				half Variation_Complex102_g35235 = frac( ( v.ase_color.r + ( break9_g35238.x + break9_g35238.z ) ) );
				float ObjectData20_g35237 = Variation_Complex102_g35235;
				half Variation_Simple105_g35235 = v.ase_color.r;
				float WorldData19_g35237 = Variation_Simple105_g35235;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35237 = WorldData19_g35237;
				#else
				float staticSwitch14_g35237 = ObjectData20_g35237;
				#endif
				half Variation3073_g35167 = staticSwitch14_g35237;
				half Motion_Variation284_g35256 = ( _MotionVariation_10 * Variation3073_g35167 );
				float2 appendResult344_g35256 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g35256 = ( _MotionScale_10 * appendResult344_g35256 );
				half2 Sine_MinusOneToOne281_g35256 = sin( ( mulTime373_g35256 + Motion_Variation284_g35256 + Motion_Scale287_g35256 ) );
				float2 temp_cast_11 = (1.0).xx;
				half Input_Turbulence327_g35256 = Global_NoiseTex_R34_g35167;
				float2 lerpResult321_g35256 = lerp( Sine_MinusOneToOne281_g35256 , temp_cast_11 , Input_Turbulence327_g35256);
				half2 Motion_Bending2258_g35167 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g35167 ) * Wind_Power_103106_g35167 * Wind_DirectionOS39_g35167 * Motion_Use1056_g35167 * Global_NoiseTex_R34_g35167 * lerpResult321_g35256 );
				half Motion_UseInteraction2097_g35167 = _Motion_Interaction;
				half Motion_InteractionMask66_g35167 = break322_g35179.w;
				float lerpResult3307_g35167 = lerp( 1.0 , Variation3073_g35167 , _InteractionVariation);
				half2 Motion_Interaction53_g35167 = ( _InteractionAmplitude * Motion_Max_Bending1133_g35167 * Motion_UseInteraction2097_g35167 * Motion_InteractionMask66_g35167 * Motion_InteractionMask66_g35167 * Wind_DirectionOS39_g35167 * lerpResult3307_g35167 );
				float2 lerpResult109_g35167 = lerp( Motion_Bending2258_g35167 , Motion_Interaction53_g35167 , Motion_InteractionMask66_g35167);
				half Mesh_Motion_182_g35167 = v.ase_texcoord3.x;
				float2 break143_g35167 = ( lerpResult109_g35167 * Mesh_Motion_182_g35167 );
				half Motion_Z190_g35167 = break143_g35167.y;
				half Angle44_g35258 = Motion_Z190_g35167;
				half3 VertexPos40_g35250 = ( VertexPosRotationAxis50_g35258 + ( VertexPosOtherAxis82_g35258 * cos( Angle44_g35258 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g35258 ) * sin( Angle44_g35258 ) ) );
				float3 appendResult74_g35250 = (float3(0.0 , 0.0 , VertexPos40_g35250.z));
				half3 VertexPosRotationAxis50_g35250 = appendResult74_g35250;
				float3 break84_g35250 = VertexPos40_g35250;
				float3 appendResult81_g35250 = (float3(break84_g35250.x , break84_g35250.y , 0.0));
				half3 VertexPosOtherAxis82_g35250 = appendResult81_g35250;
				half Motion_X216_g35167 = break143_g35167.x;
				half Angle44_g35250 = -Motion_X216_g35167;
				half Motion_Scale321_g35248 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g35248 = _MotionSpeed_32;
				float mulTime349_g35248 = _TimeParameters.x * Input_Speed62_g35248;
				float Motion_Variation330_g35248 = ( _MotionVariation_32 * v.ase_color.r );
				float Bounds_Radius121_g35167 = _MaxBoundsInfo.x;
				half Input_Amplitude58_g35248 = ( _MotionAmplitude_32 * Bounds_Radius121_g35167 * 0.1 );
				float3 appendResult345_g35248 = (float3(v.ase_color.r , ( 1.0 - v.ase_color.r ) , v.ase_color.r));
				half Global_NoiseTex_B132_g35167 = break142_g35199.b;
				half Mesh_Motion_3144_g35167 = v.ase_texcoord3.z;
				half Motion_Use322013_g35167 = _Motion_32;
				float lerpResult376_g35179 = lerp( 0.1 , 1.0 , Wind_Power369_g35179);
				half Wind_Power_323115_g35167 = lerpResult376_g35179;
				half3 Motion_Flutter263_g35167 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g35248 ) + mulTime349_g35248 + Motion_Variation330_g35248 ) ) * Input_Amplitude58_g35248 * appendResult345_g35248 ) * ( ( Global_NoiseTex_R34_g35167 + Global_NoiseTex_B132_g35167 ) * Mesh_Motion_3144_g35167 * Motion_Use322013_g35167 * Wind_Power_323115_g35167 ) );
				half Wind_Mode3167_g35167 = TVE_WindMode;
				float3 lerpResult3168_g35167 = lerp( v.vertex.xyz , ( ( VertexPosRotationAxis50_g35250 + ( VertexPosOtherAxis82_g35250 * cos( Angle44_g35250 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g35250 ) * sin( Angle44_g35250 ) ) ) + Motion_Flutter263_g35167 ) , Wind_Mode3167_g35167);
				float3 Vertex_Motion_Object833_g35167 = lerpResult3168_g35167;
				float3 appendResult2043_g35167 = (float3(Motion_X216_g35167 , 0.0 , Motion_Z190_g35167));
				float3 lerpResult3173_g35167 = lerp( v.vertex.xyz , ( ( v.vertex.xyz + appendResult2043_g35167 ) + Motion_Flutter263_g35167 ) , Wind_Mode3167_g35167);
				float3 Vertex_Motion_World1118_g35167 = lerpResult3173_g35167;
				float3 temp_output_3331_0_g35167 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g35167 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g35167 = Vertex_Motion_Object833_g35167;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g35167 = temp_output_3331_0_g35167;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g35167 = temp_output_3331_0_g35167;
				#else
				float3 staticSwitch3312_g35167 = Vertex_Motion_Object833_g35167;
				#endif
				half3 ObjectData20_g35178 = staticSwitch3312_g35167;
				half3 WorldData19_g35178 = Vertex_Motion_World1118_g35167;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35178 = WorldData19_g35178;
				#else
				float3 staticSwitch14_g35178 = ObjectData20_g35178;
				#endif
				float4x4 break19_g35194 = GetObjectToWorldMatrix();
				float3 appendResult20_g35194 = (float3(break19_g35194[ 0 ][ 3 ] , break19_g35194[ 1 ][ 3 ] , break19_g35194[ 2 ][ 3 ]));
				half3 Off19_g35195 = appendResult20_g35194;
				float4 transform68_g35194 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g35194 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g35194 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g35194 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35194 = ( (transform68_g35194).xyz - (transform62_g35194).xyz );
				half3 On20_g35195 = ObjectPositionWithPivots28_g35194;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35195 = On20_g35195;
				#else
				float3 staticSwitch14_g35195 = Off19_g35195;
				#endif
				half3 ObjectData20_g35196 = staticSwitch14_g35195;
				half3 WorldData19_g35196 = Off19_g35195;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35196 = WorldData19_g35196;
				#else
				float3 staticSwitch14_g35196 = ObjectData20_g35196;
				#endif
				float3 temp_output_42_0_g35194 = staticSwitch14_g35196;
				float temp_output_7_0_g35245 = TVE_SizeFadeEnd;
				float ObjectData20_g35193 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g35194 ) * _GlobalSizeFade ) - temp_output_7_0_g35245 ) / ( TVE_SizeFadeStart - temp_output_7_0_g35245 ) ) );
				float WorldData19_g35193 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35193 = WorldData19_g35193;
				#else
				float staticSwitch14_g35193 = ObjectData20_g35193;
				#endif
				float Vertex_SizeFade1740_g35167 = staticSwitch14_g35193;
				float4x4 break19_g35184 = GetObjectToWorldMatrix();
				float3 appendResult20_g35184 = (float3(break19_g35184[ 0 ][ 3 ] , break19_g35184[ 1 ][ 3 ] , break19_g35184[ 2 ][ 3 ]));
				half3 Off19_g35185 = appendResult20_g35184;
				float4 transform68_g35184 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35184 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35184 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35184 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35184 = ( (transform68_g35184).xyz - (transform62_g35184).xyz );
				half3 On20_g35185 = ObjectPositionWithPivots28_g35184;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35185 = On20_g35185;
				#else
				float3 staticSwitch14_g35185 = Off19_g35185;
				#endif
				half3 ObjectData20_g35186 = staticSwitch14_g35185;
				half3 WorldData19_g35186 = Off19_g35185;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35186 = WorldData19_g35186;
				#else
				float3 staticSwitch14_g35186 = ObjectData20_g35186;
				#endif
				float3 temp_output_42_0_g35184 = staticSwitch14_g35186;
				half3 ObjectData20_g35183 = temp_output_42_0_g35184;
				half3 WorldData19_g35183 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35183 = WorldData19_g35183;
				#else
				float3 staticSwitch14_g35183 = ObjectData20_g35183;
				#endif
				float2 temp_output_43_38_g35181 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35183).xz ) );
				half4 Legacy33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g35181, 0.0 );
				half4 Vegetation33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g35181, 0.0 );
				half4 Grass33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g35181, 0.0 );
				half4 Objects33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g35181, 0.0 );
				half4 Custom33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g35181, 0.0 );
				half4 localUSE_BUFFERS33_g35182 = USE_BUFFERS( Legacy33_g35182 , Vegetation33_g35182 , Grass33_g35182 , Objects33_g35182 , Custom33_g35182 );
				float4 break49_g35181 = localUSE_BUFFERS33_g35182;
				half Global_ExtrasTex_G305_g35167 = break49_g35181.y;
				float lerpResult346_g35167 = lerp( 1.0 , Global_ExtrasTex_G305_g35167 , _GlobalSize);
				float ObjectData20_g35192 = ( lerpResult346_g35167 * _LocalSize );
				float WorldData19_g35192 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35192 = WorldData19_g35192;
				#else
				float staticSwitch14_g35192 = ObjectData20_g35192;
				#endif
				half Vertex_Size1741_g35167 = staticSwitch14_g35192;
				float3 normalizeResult2696_g35167 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float3 break2709_g35167 = cross( normalizeResult2696_g35167 , half3(0,1,0) );
				float3 appendResult2710_g35167 = (float3(-break2709_g35167.z , 0.0 , break2709_g35167.x));
				float3 appendResult2667_g35167 = (float3(v.ase_color.r , 0.5 , v.ase_color.r));
				float3 normalizeResult2210_g35167 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float dotResult2212_g35167 = dot( normalizeResult2210_g35167 , float3(0,1,0) );
				half Mask_HView2656_g35167 = abs( dotResult2212_g35167 );
				float saferPower2652_g35167 = max( Mask_HView2656_g35167 , 0.0001 );
				half3 Grass_Coverage2661_g35167 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g35167 , 0.0 ) ).xyz * ( _PerspectivePushValue + _PerspectiveCat ) ) + ( (appendResult2667_g35167*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * v.ase_color.a * pow( saferPower2652_g35167 , _PerspectiveAngleValue ) );
				float3 Final_VertexPosition890_g35167 = ( ( staticSwitch14_g35178 * Vertex_SizeFade1740_g35167 * Vertex_Size1741_g35167 ) + Mesh_PivotsOS2291_g35167 + Grass_Coverage2661_g35167 );
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.vertex;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g35167;
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

				half2 Main_UVs15_g35167 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g35167 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g35167 );
				float4 temp_output_51_0_g35167 = ( _MainColor * tex2DNode29_g35167 );
				half Main_Alpha316_g35167 = (temp_output_51_0_g35167).a;
				
				float localCustomAlphaClip9_g35243 = ( 0.0 );
				half Main_AlphaRaw1203_g35167 = tex2DNode29_g35167.a;
				float Mesh_Variation16_g35167 = IN.ase_color.r;
				float lerpResult2262_g35167 = lerp( 0.9 , Mesh_Variation16_g35167 , _LeavesVariationValue);
				float4x4 break19_g35184 = GetObjectToWorldMatrix();
				float3 appendResult20_g35184 = (float3(break19_g35184[ 0 ][ 3 ] , break19_g35184[ 1 ][ 3 ] , break19_g35184[ 2 ][ 3 ]));
				half3 Off19_g35185 = appendResult20_g35184;
				float4 transform68_g35184 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord3);
				float3 appendResult95_g35184 = (float3(IN.ase_texcoord2.z , 0.0 , IN.ase_texcoord2.w));
				float4 transform62_g35184 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord3.xyz - ( appendResult95_g35184 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35184 = ( (transform68_g35184).xyz - (transform62_g35184).xyz );
				half3 On20_g35185 = ObjectPositionWithPivots28_g35184;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35185 = On20_g35185;
				#else
				float3 staticSwitch14_g35185 = Off19_g35185;
				#endif
				half3 ObjectData20_g35186 = staticSwitch14_g35185;
				half3 WorldData19_g35186 = Off19_g35185;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35186 = WorldData19_g35186;
				#else
				float3 staticSwitch14_g35186 = ObjectData20_g35186;
				#endif
				float3 temp_output_42_0_g35184 = staticSwitch14_g35186;
				half3 ObjectData20_g35183 = temp_output_42_0_g35184;
				half3 WorldData19_g35183 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35183 = WorldData19_g35183;
				#else
				float3 staticSwitch14_g35183 = ObjectData20_g35183;
				#endif
				float2 temp_output_43_38_g35181 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35183).xz ) );
				half4 Legacy33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g35181 );
				half4 Vegetation33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g35181 );
				half4 Grass33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g35181 );
				half4 Objects33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g35181 );
				half4 Custom33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g35181 );
				half4 localUSE_BUFFERS33_g35182 = USE_BUFFERS( Legacy33_g35182 , Vegetation33_g35182 , Grass33_g35182 , Objects33_g35182 , Custom33_g35182 );
				float4 break49_g35181 = localUSE_BUFFERS33_g35182;
				half Global_ExtrasTex_R174_g35167 = break49_g35181.x;
				float lerpResult2624_g35167 = lerp( 1.0 , Global_ExtrasTex_R174_g35167 , _GlobalLeaves);
				half AlphaTreshold2132_g35167 = _Cutoff;
				half Mask_Leaves315_g35167 = ( ( (lerpResult2262_g35167*0.5 + 0.5) - ( 1.0 - ( lerpResult2624_g35167 * _LocalLeaves ) ) ) + AlphaTreshold2132_g35167 );
				half Alpha5_g35243 = ( Main_AlphaRaw1203_g35167 * Mask_Leaves315_g35167 );
				float Alpha9_g35243 = Alpha5_g35243;
				#if _ALPHATEST_ON
				clip(Alpha9_g35243 - _Cutoff);
				#endif
				half Final_Clip914_g35167 = localCustomAlphaClip9_g35243;
				
				float Alpha = Main_Alpha316_g35167;
				float AlphaClipThreshold = Final_Clip914_g35167;

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
			#define _TRANSMISSION_ASE 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#define TVE_PIVOT_DATA_BAKED
			#define TVE_IS_GRASS_SHADER
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


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
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NoiseTintOne;
			half4 _SubsurfaceColor;
			float4 _LocalColors;
			half4 _MotionHighlightColor;
			half4 _MainUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_asset;
			half4 _GradientColorTwo;
			half4 _NoiseTintTwo;
			half4 _GradientColorOne;
			float4 _Color;
			half3 _render_normals_options;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _PerspectivePushValue;
			half _LocalSize;
			half _GlobalSize;
			half _PerspectiveCat;
			half _GlobalSizeFade;
			half _VertexMotionMode;
			half _VertexMotionSpace;
			half _VertexCat;
			half _Motion_32;
			half _Motion_Interaction;
			half _Motion_10;
			half _vertex_pivot_mode;
			half _VertexPivotMode;
			half _IsForwardPathShader;
			half _BatchingMessage;
			float _MotionVariation_32;
			half _DetailMapsMode;
			half _DetailTypeMode;
			half _GlobalCat;
			half _VertexDataMode;
			half _GradientMinValue;
			half _IsLitShader;
			half _GradientCat;
			half _LeavesVariationValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _OcclusionCat;
			half _VertexOcclusionValue;
			half _render_premul;
			half _OverlayVariationValue;
			half _GlobalOverlay;
			half _OverlayContrastValue;
			half _SubsurfaceViewValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceCat;
			half _GlobalHealthiness;
			half _SubsurfaceValue;
			half _SubsurfaceLightValue;
			half _ColorsMaskValue;
			half _GlobalColors;
			half _NoiseMaxValue;
			half _NoiseMinValue;
			half _MoiseCat;
			half _NoiseScaleValue;
			half _ObjectDataMessage;
			half _GradientMaxValue;
			half _DetailCat;
			half _MainCat;
			float _MotionScale_20;
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
			half _InteractionVariation;
			float _ObjectOcclusionValue;
			float _GrassPerspectiveAngleValue;
			float _SubsurfaceMaxValue;
			half _GlobalSpace;
			half _DetailSpace;
			half _render_cull;
			float _Float18;
			half _IsGrassShader;
			half _Banner;
			half _render_src;
			half _IsStandardShader;
			half _render_dst;
			half _render_cutoff;
			half _render_zw;
			float _SubsurfaceMinValue;
			half _AdvancedCat;
			float _MotionScale_32;
			half _Cutoff;
			half _GlobalLeaves;
			float _MotionVariation_30;
			half _RenderMode;
			half _MotionAmplitude_20;
			half _MotionVariation_10;
			half _WorldDataMessage;
			float _MotionSpeed_10;
			half _DetailMode;
			half _RenderPriority;
			half _RenderBlend;
			half _RenderZWrite;
			half _MotionAmplitude_32;
			half _RenderCull;
			half _IsTVEShader;
			float _MotionSpeed_30;
			half _MotionAmplitude_10;
			float _MotionScale_10;
			float _MotionSpeed_20;
			half _RenderClip;
			half _InteractionAmplitude;
			float _MotionSpeed_32;
			float _MotionScale_30;
			half _RenderNormals;
			half _MainNormalValue;
			half _IsVersion;
			half _RenderingCat;
			half _VertexVariationMode;
			half _MotionVariation_20;
			half _PivotsMessage;
			half _LocalLeaves;
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
			TEXTURE2D(_NoiseTex);
			SAMPLER(sampler_NoiseTex);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half TVE_NoiseHighlight;
			TEXTURE2D(TVE_ColorsTex);
			SAMPLER(samplerTVE_ColorsTex);
			TEXTURE2D(TVE_ColorsTex_Vegetation);
			SAMPLER(samplerTVE_ColorsTex_Vegetation);
			TEXTURE2D(TVE_ColorsTex_Grass);
			SAMPLER(samplerTVE_ColorsTex_Grass);
			TEXTURE2D(TVE_ColorsTex_Objects);
			SAMPLER(samplerTVE_ColorsTex_Objects);
			TEXTURE2D(TVE_ColorsTex_User);
			SAMPLER(samplerTVE_ColorsTex_User);
			float4 TVE_MainLightParams;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			TEXTURE2D(_MainNormalTex);
			SAMPLER(sampler_MainNormalTex);
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
				half3 Off19_g35190 = _Vector1;
				float3 appendResult2827_g35167 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				half3 Mesh_PivotsData2831_g35167 = ( appendResult2827_g35167 * _VertexPivotMode );
				half3 On20_g35190 = Mesh_PivotsData2831_g35167;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35190 = On20_g35190;
				#else
				float3 staticSwitch14_g35190 = Off19_g35190;
				#endif
				half3 ObjectData20_g35191 = staticSwitch14_g35190;
				half3 WorldData19_g35191 = Off19_g35190;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35191 = WorldData19_g35191;
				#else
				float3 staticSwitch14_g35191 = ObjectData20_g35191;
				#endif
				#ifdef TVE_VERTEX_DATA_WORLD
				float3 staticSwitch14_g35213 = _Vector1;
				#else
				float3 staticSwitch14_g35213 = staticSwitch14_g35191;
				#endif
				half3 Mesh_PivotsOS2291_g35167 = staticSwitch14_g35213;
				float3 temp_output_2283_0_g35167 = ( v.vertex.xyz - Mesh_PivotsOS2291_g35167 );
				half3 VertexPos40_g35258 = temp_output_2283_0_g35167;
				float3 appendResult74_g35258 = (float3(VertexPos40_g35258.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g35258 = appendResult74_g35258;
				float3 break84_g35258 = VertexPos40_g35258;
				float3 appendResult81_g35258 = (float3(0.0 , break84_g35258.y , break84_g35258.z));
				half3 VertexPosOtherAxis82_g35258 = appendResult81_g35258;
				float ObjectData20_g35232 = 3.14;
				float Bounds_Height374_g35167 = _MaxBoundsInfo.y;
				float WorldData19_g35232 = ( Bounds_Height374_g35167 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35232 = WorldData19_g35232;
				#else
				float staticSwitch14_g35232 = ObjectData20_g35232;
				#endif
				float Motion_Max_Bending1133_g35167 = staticSwitch14_g35232;
				float4x4 break19_g35225 = GetObjectToWorldMatrix();
				float3 appendResult20_g35225 = (float3(break19_g35225[ 0 ][ 3 ] , break19_g35225[ 1 ][ 3 ] , break19_g35225[ 2 ][ 3 ]));
				half3 Off19_g35226 = appendResult20_g35225;
				float4 transform68_g35225 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g35225 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g35225 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g35225 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35225 = ( (transform68_g35225).xyz - (transform62_g35225).xyz );
				half3 On20_g35226 = ObjectPositionWithPivots28_g35225;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35226 = On20_g35226;
				#else
				float3 staticSwitch14_g35226 = Off19_g35226;
				#endif
				half3 ObjectData20_g35227 = staticSwitch14_g35226;
				half3 WorldData19_g35227 = Off19_g35226;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35227 = WorldData19_g35227;
				#else
				float3 staticSwitch14_g35227 = ObjectData20_g35227;
				#endif
				float3 temp_output_42_0_g35225 = staticSwitch14_g35227;
				half3 ObjectData20_g35230 = temp_output_42_0_g35225;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g35230 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35230 = WorldData19_g35230;
				#else
				float3 staticSwitch14_g35230 = ObjectData20_g35230;
				#endif
				float2 temp_output_39_38_g35223 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35230).xz ) );
				half4 Legacy33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, temp_output_39_38_g35223, 0.0 );
				half4 Vegetation33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Vegetation, samplerTVE_MotionTex_Vegetation, temp_output_39_38_g35223, 0.0 );
				half4 Grass33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Grass, samplerTVE_MotionTex_Grass, temp_output_39_38_g35223, 0.0 );
				half4 Objects33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Objects, samplerTVE_MotionTex_Objects, temp_output_39_38_g35223, 0.0 );
				half4 Custom33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_User, samplerTVE_MotionTex_User, temp_output_39_38_g35223, 0.0 );
				half4 localUSE_BUFFERS33_g35231 = USE_BUFFERS( Legacy33_g35231 , Vegetation33_g35231 , Grass33_g35231 , Objects33_g35231 , Custom33_g35231 );
				float4 break322_g35179 = localUSE_BUFFERS33_g35231;
				half Wind_Power369_g35179 = saturate( ( (break322_g35179.z*2.0 + -1.0) + TVE_WindPower ) );
				half Wind_Power_103106_g35167 = Wind_Power369_g35179;
				float3 appendResult323_g35179 = (float3(break322_g35179.x , 0.0 , break322_g35179.y));
				float3 temp_output_324_0_g35179 = (appendResult323_g35179*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g35179 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g35179 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g35167 = (temp_output_339_0_g35179).xz;
				half Motion_Use1056_g35167 = _Motion_10;
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch160_g35199 = TVE_NoiseSpeed_Grass;
				#else
				float2 staticSwitch160_g35199 = TVE_NoiseSpeed_Vegetation;
				#endif
				float4x4 break19_g35201 = GetObjectToWorldMatrix();
				float3 appendResult20_g35201 = (float3(break19_g35201[ 0 ][ 3 ] , break19_g35201[ 1 ][ 3 ] , break19_g35201[ 2 ][ 3 ]));
				half3 Off19_g35202 = appendResult20_g35201;
				float4 transform68_g35201 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35201 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35201 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35201 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35201 = ( (transform68_g35201).xyz - (transform62_g35201).xyz );
				half3 On20_g35202 = ObjectPositionWithPivots28_g35201;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35202 = On20_g35202;
				#else
				float3 staticSwitch14_g35202 = Off19_g35202;
				#endif
				half3 ObjectData20_g35203 = staticSwitch14_g35202;
				half3 WorldData19_g35203 = Off19_g35202;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35203 = WorldData19_g35203;
				#else
				float3 staticSwitch14_g35203 = ObjectData20_g35203;
				#endif
				float3 temp_output_42_0_g35201 = staticSwitch14_g35203;
				half3 ObjectData20_g35200 = temp_output_42_0_g35201;
				half3 WorldData19_g35200 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35200 = WorldData19_g35200;
				#else
				float3 staticSwitch14_g35200 = ObjectData20_g35200;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch164_g35199 = (ase_worldPos).xz;
				#else
				float2 staticSwitch164_g35199 = (staticSwitch14_g35200).xz;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float staticSwitch161_g35199 = TVE_NoiseSize_Grass;
				#else
				float staticSwitch161_g35199 = TVE_NoiseSize_Vegetation;
				#endif
				float2 panner73_g35199 = ( _TimeParameters.x * staticSwitch160_g35199 + ( staticSwitch164_g35199 * staticSwitch161_g35199 ));
				float4 tex2DNode75_g35199 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g35199, 0.0 );
				float4 saferPower77_g35199 = max( abs( tex2DNode75_g35199 ) , 0.0001 );
				float4 temp_cast_9 = (TVE_NoiseContrast).xxxx;
				float4 break142_g35199 = pow( saferPower77_g35199 , temp_cast_9 );
				half Global_NoiseTex_R34_g35167 = break142_g35199.r;
				half Input_Speed62_g35256 = _MotionSpeed_10;
				float mulTime373_g35256 = _TimeParameters.x * Input_Speed62_g35256;
				float4x4 break19_g35238 = GetObjectToWorldMatrix();
				float3 appendResult20_g35238 = (float3(break19_g35238[ 0 ][ 3 ] , break19_g35238[ 1 ][ 3 ] , break19_g35238[ 2 ][ 3 ]));
				half3 Off19_g35239 = appendResult20_g35238;
				float4 transform68_g35238 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35238 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35238 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35238 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35238 = ( (transform68_g35238).xyz - (transform62_g35238).xyz );
				half3 On20_g35239 = ObjectPositionWithPivots28_g35238;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35239 = On20_g35239;
				#else
				float3 staticSwitch14_g35239 = Off19_g35239;
				#endif
				half3 ObjectData20_g35240 = staticSwitch14_g35239;
				half3 WorldData19_g35240 = Off19_g35239;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35240 = WorldData19_g35240;
				#else
				float3 staticSwitch14_g35240 = ObjectData20_g35240;
				#endif
				float3 temp_output_42_0_g35238 = staticSwitch14_g35240;
				float3 break9_g35238 = temp_output_42_0_g35238;
				half Variation_Complex102_g35235 = frac( ( v.ase_color.r + ( break9_g35238.x + break9_g35238.z ) ) );
				float ObjectData20_g35237 = Variation_Complex102_g35235;
				half Variation_Simple105_g35235 = v.ase_color.r;
				float WorldData19_g35237 = Variation_Simple105_g35235;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35237 = WorldData19_g35237;
				#else
				float staticSwitch14_g35237 = ObjectData20_g35237;
				#endif
				half Variation3073_g35167 = staticSwitch14_g35237;
				half Motion_Variation284_g35256 = ( _MotionVariation_10 * Variation3073_g35167 );
				float2 appendResult344_g35256 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g35256 = ( _MotionScale_10 * appendResult344_g35256 );
				half2 Sine_MinusOneToOne281_g35256 = sin( ( mulTime373_g35256 + Motion_Variation284_g35256 + Motion_Scale287_g35256 ) );
				float2 temp_cast_11 = (1.0).xx;
				half Input_Turbulence327_g35256 = Global_NoiseTex_R34_g35167;
				float2 lerpResult321_g35256 = lerp( Sine_MinusOneToOne281_g35256 , temp_cast_11 , Input_Turbulence327_g35256);
				half2 Motion_Bending2258_g35167 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g35167 ) * Wind_Power_103106_g35167 * Wind_DirectionOS39_g35167 * Motion_Use1056_g35167 * Global_NoiseTex_R34_g35167 * lerpResult321_g35256 );
				half Motion_UseInteraction2097_g35167 = _Motion_Interaction;
				half Motion_InteractionMask66_g35167 = break322_g35179.w;
				float lerpResult3307_g35167 = lerp( 1.0 , Variation3073_g35167 , _InteractionVariation);
				half2 Motion_Interaction53_g35167 = ( _InteractionAmplitude * Motion_Max_Bending1133_g35167 * Motion_UseInteraction2097_g35167 * Motion_InteractionMask66_g35167 * Motion_InteractionMask66_g35167 * Wind_DirectionOS39_g35167 * lerpResult3307_g35167 );
				float2 lerpResult109_g35167 = lerp( Motion_Bending2258_g35167 , Motion_Interaction53_g35167 , Motion_InteractionMask66_g35167);
				half Mesh_Motion_182_g35167 = v.ase_texcoord3.x;
				float2 break143_g35167 = ( lerpResult109_g35167 * Mesh_Motion_182_g35167 );
				half Motion_Z190_g35167 = break143_g35167.y;
				half Angle44_g35258 = Motion_Z190_g35167;
				half3 VertexPos40_g35250 = ( VertexPosRotationAxis50_g35258 + ( VertexPosOtherAxis82_g35258 * cos( Angle44_g35258 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g35258 ) * sin( Angle44_g35258 ) ) );
				float3 appendResult74_g35250 = (float3(0.0 , 0.0 , VertexPos40_g35250.z));
				half3 VertexPosRotationAxis50_g35250 = appendResult74_g35250;
				float3 break84_g35250 = VertexPos40_g35250;
				float3 appendResult81_g35250 = (float3(break84_g35250.x , break84_g35250.y , 0.0));
				half3 VertexPosOtherAxis82_g35250 = appendResult81_g35250;
				half Motion_X216_g35167 = break143_g35167.x;
				half Angle44_g35250 = -Motion_X216_g35167;
				half Motion_Scale321_g35248 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g35248 = _MotionSpeed_32;
				float mulTime349_g35248 = _TimeParameters.x * Input_Speed62_g35248;
				float Motion_Variation330_g35248 = ( _MotionVariation_32 * v.ase_color.r );
				float Bounds_Radius121_g35167 = _MaxBoundsInfo.x;
				half Input_Amplitude58_g35248 = ( _MotionAmplitude_32 * Bounds_Radius121_g35167 * 0.1 );
				float3 appendResult345_g35248 = (float3(v.ase_color.r , ( 1.0 - v.ase_color.r ) , v.ase_color.r));
				half Global_NoiseTex_B132_g35167 = break142_g35199.b;
				half Mesh_Motion_3144_g35167 = v.ase_texcoord3.z;
				half Motion_Use322013_g35167 = _Motion_32;
				float lerpResult376_g35179 = lerp( 0.1 , 1.0 , Wind_Power369_g35179);
				half Wind_Power_323115_g35167 = lerpResult376_g35179;
				half3 Motion_Flutter263_g35167 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g35248 ) + mulTime349_g35248 + Motion_Variation330_g35248 ) ) * Input_Amplitude58_g35248 * appendResult345_g35248 ) * ( ( Global_NoiseTex_R34_g35167 + Global_NoiseTex_B132_g35167 ) * Mesh_Motion_3144_g35167 * Motion_Use322013_g35167 * Wind_Power_323115_g35167 ) );
				half Wind_Mode3167_g35167 = TVE_WindMode;
				float3 lerpResult3168_g35167 = lerp( v.vertex.xyz , ( ( VertexPosRotationAxis50_g35250 + ( VertexPosOtherAxis82_g35250 * cos( Angle44_g35250 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g35250 ) * sin( Angle44_g35250 ) ) ) + Motion_Flutter263_g35167 ) , Wind_Mode3167_g35167);
				float3 Vertex_Motion_Object833_g35167 = lerpResult3168_g35167;
				float3 appendResult2043_g35167 = (float3(Motion_X216_g35167 , 0.0 , Motion_Z190_g35167));
				float3 lerpResult3173_g35167 = lerp( v.vertex.xyz , ( ( v.vertex.xyz + appendResult2043_g35167 ) + Motion_Flutter263_g35167 ) , Wind_Mode3167_g35167);
				float3 Vertex_Motion_World1118_g35167 = lerpResult3173_g35167;
				float3 temp_output_3331_0_g35167 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g35167 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g35167 = Vertex_Motion_Object833_g35167;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g35167 = temp_output_3331_0_g35167;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g35167 = temp_output_3331_0_g35167;
				#else
				float3 staticSwitch3312_g35167 = Vertex_Motion_Object833_g35167;
				#endif
				half3 ObjectData20_g35178 = staticSwitch3312_g35167;
				half3 WorldData19_g35178 = Vertex_Motion_World1118_g35167;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35178 = WorldData19_g35178;
				#else
				float3 staticSwitch14_g35178 = ObjectData20_g35178;
				#endif
				float4x4 break19_g35194 = GetObjectToWorldMatrix();
				float3 appendResult20_g35194 = (float3(break19_g35194[ 0 ][ 3 ] , break19_g35194[ 1 ][ 3 ] , break19_g35194[ 2 ][ 3 ]));
				half3 Off19_g35195 = appendResult20_g35194;
				float4 transform68_g35194 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g35194 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g35194 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g35194 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35194 = ( (transform68_g35194).xyz - (transform62_g35194).xyz );
				half3 On20_g35195 = ObjectPositionWithPivots28_g35194;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35195 = On20_g35195;
				#else
				float3 staticSwitch14_g35195 = Off19_g35195;
				#endif
				half3 ObjectData20_g35196 = staticSwitch14_g35195;
				half3 WorldData19_g35196 = Off19_g35195;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35196 = WorldData19_g35196;
				#else
				float3 staticSwitch14_g35196 = ObjectData20_g35196;
				#endif
				float3 temp_output_42_0_g35194 = staticSwitch14_g35196;
				float temp_output_7_0_g35245 = TVE_SizeFadeEnd;
				float ObjectData20_g35193 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g35194 ) * _GlobalSizeFade ) - temp_output_7_0_g35245 ) / ( TVE_SizeFadeStart - temp_output_7_0_g35245 ) ) );
				float WorldData19_g35193 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35193 = WorldData19_g35193;
				#else
				float staticSwitch14_g35193 = ObjectData20_g35193;
				#endif
				float Vertex_SizeFade1740_g35167 = staticSwitch14_g35193;
				float4x4 break19_g35184 = GetObjectToWorldMatrix();
				float3 appendResult20_g35184 = (float3(break19_g35184[ 0 ][ 3 ] , break19_g35184[ 1 ][ 3 ] , break19_g35184[ 2 ][ 3 ]));
				half3 Off19_g35185 = appendResult20_g35184;
				float4 transform68_g35184 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35184 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35184 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35184 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35184 = ( (transform68_g35184).xyz - (transform62_g35184).xyz );
				half3 On20_g35185 = ObjectPositionWithPivots28_g35184;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35185 = On20_g35185;
				#else
				float3 staticSwitch14_g35185 = Off19_g35185;
				#endif
				half3 ObjectData20_g35186 = staticSwitch14_g35185;
				half3 WorldData19_g35186 = Off19_g35185;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35186 = WorldData19_g35186;
				#else
				float3 staticSwitch14_g35186 = ObjectData20_g35186;
				#endif
				float3 temp_output_42_0_g35184 = staticSwitch14_g35186;
				half3 ObjectData20_g35183 = temp_output_42_0_g35184;
				half3 WorldData19_g35183 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35183 = WorldData19_g35183;
				#else
				float3 staticSwitch14_g35183 = ObjectData20_g35183;
				#endif
				float2 temp_output_43_38_g35181 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35183).xz ) );
				half4 Legacy33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g35181, 0.0 );
				half4 Vegetation33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g35181, 0.0 );
				half4 Grass33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g35181, 0.0 );
				half4 Objects33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g35181, 0.0 );
				half4 Custom33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g35181, 0.0 );
				half4 localUSE_BUFFERS33_g35182 = USE_BUFFERS( Legacy33_g35182 , Vegetation33_g35182 , Grass33_g35182 , Objects33_g35182 , Custom33_g35182 );
				float4 break49_g35181 = localUSE_BUFFERS33_g35182;
				half Global_ExtrasTex_G305_g35167 = break49_g35181.y;
				float lerpResult346_g35167 = lerp( 1.0 , Global_ExtrasTex_G305_g35167 , _GlobalSize);
				float ObjectData20_g35192 = ( lerpResult346_g35167 * _LocalSize );
				float WorldData19_g35192 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35192 = WorldData19_g35192;
				#else
				float staticSwitch14_g35192 = ObjectData20_g35192;
				#endif
				half Vertex_Size1741_g35167 = staticSwitch14_g35192;
				float3 normalizeResult2696_g35167 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float3 break2709_g35167 = cross( normalizeResult2696_g35167 , half3(0,1,0) );
				float3 appendResult2710_g35167 = (float3(-break2709_g35167.z , 0.0 , break2709_g35167.x));
				float3 appendResult2667_g35167 = (float3(v.ase_color.r , 0.5 , v.ase_color.r));
				float3 normalizeResult2210_g35167 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float dotResult2212_g35167 = dot( normalizeResult2210_g35167 , float3(0,1,0) );
				half Mask_HView2656_g35167 = abs( dotResult2212_g35167 );
				float saferPower2652_g35167 = max( Mask_HView2656_g35167 , 0.0001 );
				half3 Grass_Coverage2661_g35167 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g35167 , 0.0 ) ).xyz * ( _PerspectivePushValue + _PerspectiveCat ) ) + ( (appendResult2667_g35167*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * v.ase_color.a * pow( saferPower2652_g35167 , _PerspectiveAngleValue ) );
				float3 Final_VertexPosition890_g35167 = ( ( staticSwitch14_g35178 * Vertex_SizeFade1740_g35167 * Vertex_Size1741_g35167 ) + Mesh_PivotsOS2291_g35167 + Grass_Coverage2661_g35167 );
				
				half2 Noise_UVs3274_g35167 = ( (ase_worldPos).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g35170 = _NoiseMinValue;
				half Noise_Mask3162_g35167 = saturate( ( ( SAMPLE_TEXTURE2D_LOD( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g35167, 0.0 ).r - temp_output_7_0_g35170 ) / ( _NoiseMaxValue - temp_output_7_0_g35170 ) ) );
				float4 lerpResult2800_g35167 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g35167);
				half3 Noise_Tint2802_g35167 = (lerpResult2800_g35167).rgb;
				float3 vertexToFrag3225_g35167 = Noise_Tint2802_g35167;
				o.ase_texcoord2.xyz = vertexToFrag3225_g35167;
				half Global_NoiseTex_H2869_g35167 = pow( abs( tex2DNode75_g35199.r ) , TVE_NoiseHighlight );
				half3 Highlight_Tint3231_g35167 = ( ( (_MotionHighlightColor).rgb * Global_NoiseTex_H2869_g35167 * Wind_Power_103106_g35167 * Wind_Mode3167_g35167 * v.ase_color.r ) + float3( 1,1,1 ) );
				float3 vertexToFrag3252_g35167 = Highlight_Tint3231_g35167;
				o.ase_texcoord4.xyz = vertexToFrag3252_g35167;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord;
				o.ase_texcoord5 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord4.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g35167;
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

				float temp_output_7_0_g35173 = _GradientMinValue;
				float4 lerpResult2779_g35167 = lerp( _GradientColorTwo , _GradientColorOne , saturate( ( ( IN.ase_color.a - temp_output_7_0_g35173 ) / ( ( _GradientMaxValue + _GradientCat ) - temp_output_7_0_g35173 ) ) ));
				half3 Gradient_Tint2784_g35167 = (lerpResult2779_g35167).rgb;
				float3 vertexToFrag3225_g35167 = IN.ase_texcoord2.xyz;
				half2 Noise_UVs3274_g35167 = ( (WorldPosition).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g35170 = _NoiseMinValue;
				half Noise_Mask3162_g35167 = saturate( ( ( SAMPLE_TEXTURE2D( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g35167 ).r - temp_output_7_0_g35170 ) / ( _NoiseMaxValue - temp_output_7_0_g35170 ) ) );
				float4 lerpResult2800_g35167 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g35167);
				half3 Noise_Tint2802_g35167 = (lerpResult2800_g35167).rgb;
				#ifdef TVE_IS_GRASS_SHADER
				float3 staticSwitch3420_g35167 = Noise_Tint2802_g35167;
				#else
				float3 staticSwitch3420_g35167 = vertexToFrag3225_g35167;
				#endif
				half2 Main_UVs15_g35167 = ( ( IN.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g35167 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g35167 );
				float4 temp_output_51_0_g35167 = ( _MainColor * tex2DNode29_g35167 );
				half3 Main_AlbedoRaw99_g35167 = (temp_output_51_0_g35167).rgb;
				float3 vertexToFrag3252_g35167 = IN.ase_texcoord4.xyz;
				half3 Main_AlbedoTinted2808_g35167 = ( Gradient_Tint2784_g35167 * staticSwitch3420_g35167 * Main_AlbedoRaw99_g35167 * vertexToFrag3252_g35167 );
				float4x4 break19_g35215 = GetObjectToWorldMatrix();
				float3 appendResult20_g35215 = (float3(break19_g35215[ 0 ][ 3 ] , break19_g35215[ 1 ][ 3 ] , break19_g35215[ 2 ][ 3 ]));
				half3 Off19_g35216 = appendResult20_g35215;
				float4 transform68_g35215 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord5);
				float3 appendResult95_g35215 = (float3(IN.ase_texcoord3.z , 0.0 , IN.ase_texcoord3.w));
				float4 transform62_g35215 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord5.xyz - ( appendResult95_g35215 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35215 = ( (transform68_g35215).xyz - (transform62_g35215).xyz );
				half3 On20_g35216 = ObjectPositionWithPivots28_g35215;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35216 = On20_g35216;
				#else
				float3 staticSwitch14_g35216 = Off19_g35216;
				#endif
				half3 ObjectData20_g35217 = staticSwitch14_g35216;
				half3 WorldData19_g35217 = Off19_g35216;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35217 = WorldData19_g35217;
				#else
				float3 staticSwitch14_g35217 = ObjectData20_g35217;
				#endif
				float3 temp_output_42_0_g35215 = staticSwitch14_g35217;
				half3 ObjectData20_g35221 = temp_output_42_0_g35215;
				half3 WorldData19_g35221 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35221 = WorldData19_g35221;
				#else
				float3 staticSwitch14_g35221 = ObjectData20_g35221;
				#endif
				float2 temp_output_35_38_g35214 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35221).xz ) );
				half4 Legacy33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, temp_output_35_38_g35214 );
				half4 Vegetation33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Vegetation, samplerTVE_ColorsTex_Vegetation, temp_output_35_38_g35214 );
				half4 Grass33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Grass, samplerTVE_ColorsTex_Grass, temp_output_35_38_g35214 );
				half4 Objects33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Objects, samplerTVE_ColorsTex_Objects, temp_output_35_38_g35214 );
				half4 Custom33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_User, samplerTVE_ColorsTex_User, temp_output_35_38_g35214 );
				half4 localUSE_BUFFERS33_g35220 = USE_BUFFERS( Legacy33_g35220 , Vegetation33_g35220 , Grass33_g35220 , Objects33_g35220 , Custom33_g35220 );
				float4 temp_output_45_0_g35214 = localUSE_BUFFERS33_g35220;
				half3 Global_ColorsTex_RGB1700_g35167 = (temp_output_45_0_g35214).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g35174 = 2.0;
				#else
				float staticSwitch1_g35174 = 4.594794;
				#endif
				float lerpResult2103_g35167 = lerp( 1.0 , ( 1.0 - IN.ase_color.a ) , _ColorsMaskValue);
				float3 lerpResult108_g35167 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g35167 * staticSwitch1_g35174 ) ) , ( _GlobalColors * lerpResult2103_g35167 ));
				half3 Global_Colors1954_g35167 = lerpResult108_g35167;
				float3 temp_output_123_0_g35167 = ( Main_AlbedoTinted2808_g35167 * Global_Colors1954_g35167 );
				half3 Main_AlbedoColored863_g35167 = temp_output_123_0_g35167;
				half3 Blend_Albedo265_g35167 = Main_AlbedoColored863_g35167;
				float3 lerpResult2929_g35167 = lerp( float3( 1,1,1 ) , (TVE_MainLightParams).rgb , _SubsurfaceLightValue);
				half3 Subsurface_Color1722_g35167 = ( (_SubsurfaceColor).rgb * lerpResult2929_g35167 );
				half Global_ColorsTex_A1701_g35167 = (temp_output_45_0_g35214).w;
				float lerpResult1720_g35167 = lerp( 1.0 , Global_ColorsTex_A1701_g35167 , _GlobalHealthiness);
				half Subsurface_Intensity1752_g35167 = ( ( _SubsurfaceValue * lerpResult1720_g35167 ) + _SubsurfaceCat );
				float lerpResult3219_g35167 = lerp( 1.0 , IN.ase_color.a , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g35167 = lerpResult3219_g35167;
				half3 Subsurface_Transmission884_g35167 = ( Subsurface_Color1722_g35167 * Subsurface_Intensity1752_g35167 * Subsurface_Mask1557_g35167 );
				float3 normalizeResult1983_g35167 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g35167 = dot( -TVE_MainLightDirection , normalizeResult1983_g35167 );
				float saferPower1624_g35167 = max( (dotResult785_g35167*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g35167 = 0.0;
				#else
				float staticSwitch1602_g35167 = ( pow( saferPower1624_g35167 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g35167 = staticSwitch1602_g35167;
				half3 Subsurface_Forward1691_g35167 = ( Subsurface_Transmission884_g35167 * Mask_Subsurface_View782_g35167 );
				half3 Blend_AlbedoAndSubsurface149_g35167 = ( Blend_Albedo265_g35167 + Subsurface_Forward1691_g35167 );
				half3 Global_OverlayColor1758_g35167 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g35167 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g35167 );
				float2 appendResult88_g35247 = (float2(tex2DNode117_g35167.a , tex2DNode117_g35167.g));
				float2 temp_output_90_0_g35247 = ( (appendResult88_g35247*2.0 + -1.0) * _MainNormalValue );
				float2 break93_g35247 = temp_output_90_0_g35247;
				half Main_NormalY2095_g35167 = break93_g35247.y;
				half Overlay_Contrast1405_g35167 = _OverlayContrastValue;
				half Global_OverlayIntensity154_g35167 = TVE_OverlayIntensity;
				float4x4 break19_g35184 = GetObjectToWorldMatrix();
				float3 appendResult20_g35184 = (float3(break19_g35184[ 0 ][ 3 ] , break19_g35184[ 1 ][ 3 ] , break19_g35184[ 2 ][ 3 ]));
				half3 Off19_g35185 = appendResult20_g35184;
				float4 transform68_g35184 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord5);
				float3 appendResult95_g35184 = (float3(IN.ase_texcoord3.z , 0.0 , IN.ase_texcoord3.w));
				float4 transform62_g35184 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord5.xyz - ( appendResult95_g35184 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35184 = ( (transform68_g35184).xyz - (transform62_g35184).xyz );
				half3 On20_g35185 = ObjectPositionWithPivots28_g35184;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35185 = On20_g35185;
				#else
				float3 staticSwitch14_g35185 = Off19_g35185;
				#endif
				half3 ObjectData20_g35186 = staticSwitch14_g35185;
				half3 WorldData19_g35186 = Off19_g35185;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35186 = WorldData19_g35186;
				#else
				float3 staticSwitch14_g35186 = ObjectData20_g35186;
				#endif
				float3 temp_output_42_0_g35184 = staticSwitch14_g35186;
				half3 ObjectData20_g35183 = temp_output_42_0_g35184;
				half3 WorldData19_g35183 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35183 = WorldData19_g35183;
				#else
				float3 staticSwitch14_g35183 = ObjectData20_g35183;
				#endif
				float2 temp_output_43_38_g35181 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35183).xz ) );
				half4 Legacy33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g35181 );
				half4 Vegetation33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g35181 );
				half4 Grass33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g35181 );
				half4 Objects33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g35181 );
				half4 Custom33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g35181 );
				half4 localUSE_BUFFERS33_g35182 = USE_BUFFERS( Legacy33_g35182 , Vegetation33_g35182 , Grass33_g35182 , Objects33_g35182 , Custom33_g35182 );
				float4 break49_g35181 = localUSE_BUFFERS33_g35182;
				half Global_ExtrasTex_B156_g35167 = break49_g35181.z;
				float temp_output_1025_0_g35167 = ( Global_OverlayIntensity154_g35167 * _GlobalOverlay * Global_ExtrasTex_B156_g35167 );
				float lerpResult1065_g35167 = lerp( 1.0 , IN.ase_color.r , _OverlayVariationValue);
				half Overlay_Commons1365_g35167 = ( temp_output_1025_0_g35167 * lerpResult1065_g35167 );
				half Overlay_Mask269_g35167 = saturate( ( saturate( ( IN.ase_color.a + ( Main_NormalY2095_g35167 * Overlay_Contrast1405_g35167 ) ) ) - ( 1.0 - Overlay_Commons1365_g35167 ) ) );
				float3 lerpResult336_g35167 = lerp( Blend_AlbedoAndSubsurface149_g35167 , Global_OverlayColor1758_g35167 , Overlay_Mask269_g35167);
				half3 Final_Albedo359_g35167 = lerpResult336_g35167;
				half Main_Alpha316_g35167 = (temp_output_51_0_g35167).a;
				float lerpResult354_g35167 = lerp( 1.0 , Main_Alpha316_g35167 , _render_premul);
				half Final_Premultiply355_g35167 = lerpResult354_g35167;
				float3 temp_output_410_0_g35167 = ( Final_Albedo359_g35167 * Final_Premultiply355_g35167 );
				float3 temp_cast_12 = (1.0).xxx;
				half Mesh_Occlusion318_g35167 = IN.ase_color.g;
				float saferPower1201_g35167 = max( Mesh_Occlusion318_g35167 , 0.0001 );
				float3 lerpResult2945_g35167 = lerp( (_VertexOcclusionColor).rgb , temp_cast_12 , saturate( pow( saferPower1201_g35167 , ( _VertexOcclusionValue + _OcclusionCat ) ) ));
				half3 Vertex_Occlusion648_g35167 = lerpResult2945_g35167;
				
				float localCustomAlphaClip9_g35243 = ( 0.0 );
				half Main_AlphaRaw1203_g35167 = tex2DNode29_g35167.a;
				float Mesh_Variation16_g35167 = IN.ase_color.r;
				float lerpResult2262_g35167 = lerp( 0.9 , Mesh_Variation16_g35167 , _LeavesVariationValue);
				half Global_ExtrasTex_R174_g35167 = break49_g35181.x;
				float lerpResult2624_g35167 = lerp( 1.0 , Global_ExtrasTex_R174_g35167 , _GlobalLeaves);
				half AlphaTreshold2132_g35167 = _Cutoff;
				half Mask_Leaves315_g35167 = ( ( (lerpResult2262_g35167*0.5 + 0.5) - ( 1.0 - ( lerpResult2624_g35167 * _LocalLeaves ) ) ) + AlphaTreshold2132_g35167 );
				half Alpha5_g35243 = ( Main_AlphaRaw1203_g35167 * Mask_Leaves315_g35167 );
				float Alpha9_g35243 = Alpha5_g35243;
				#if _ALPHATEST_ON
				clip(Alpha9_g35243 - _Cutoff);
				#endif
				half Final_Clip914_g35167 = localCustomAlphaClip9_g35243;
				
				
				float3 Albedo = ( temp_output_410_0_g35167 * Vertex_Occlusion648_g35167 );
				float3 Emission = 0;
				float Alpha = Main_Alpha316_g35167;
				float AlphaClipThreshold = Final_Clip914_g35167;

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
			#define _TRANSMISSION_ASE 1
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
			
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#define TVE_PIVOT_DATA_BAKED
			#define TVE_IS_GRASS_SHADER
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

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
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NoiseTintOne;
			half4 _SubsurfaceColor;
			float4 _LocalColors;
			half4 _MotionHighlightColor;
			half4 _MainUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_asset;
			half4 _GradientColorTwo;
			half4 _NoiseTintTwo;
			half4 _GradientColorOne;
			float4 _Color;
			half3 _render_normals_options;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _PerspectivePushValue;
			half _LocalSize;
			half _GlobalSize;
			half _PerspectiveCat;
			half _GlobalSizeFade;
			half _VertexMotionMode;
			half _VertexMotionSpace;
			half _VertexCat;
			half _Motion_32;
			half _Motion_Interaction;
			half _Motion_10;
			half _vertex_pivot_mode;
			half _VertexPivotMode;
			half _IsForwardPathShader;
			half _BatchingMessage;
			float _MotionVariation_32;
			half _DetailMapsMode;
			half _DetailTypeMode;
			half _GlobalCat;
			half _VertexDataMode;
			half _GradientMinValue;
			half _IsLitShader;
			half _GradientCat;
			half _LeavesVariationValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _OcclusionCat;
			half _VertexOcclusionValue;
			half _render_premul;
			half _OverlayVariationValue;
			half _GlobalOverlay;
			half _OverlayContrastValue;
			half _SubsurfaceViewValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceMaskValue;
			half _SubsurfaceCat;
			half _GlobalHealthiness;
			half _SubsurfaceValue;
			half _SubsurfaceLightValue;
			half _ColorsMaskValue;
			half _GlobalColors;
			half _NoiseMaxValue;
			half _NoiseMinValue;
			half _MoiseCat;
			half _NoiseScaleValue;
			half _ObjectDataMessage;
			half _GradientMaxValue;
			half _DetailCat;
			half _MainCat;
			float _MotionScale_20;
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
			half _InteractionVariation;
			float _ObjectOcclusionValue;
			float _GrassPerspectiveAngleValue;
			float _SubsurfaceMaxValue;
			half _GlobalSpace;
			half _DetailSpace;
			half _render_cull;
			float _Float18;
			half _IsGrassShader;
			half _Banner;
			half _render_src;
			half _IsStandardShader;
			half _render_dst;
			half _render_cutoff;
			half _render_zw;
			float _SubsurfaceMinValue;
			half _AdvancedCat;
			float _MotionScale_32;
			half _Cutoff;
			half _GlobalLeaves;
			float _MotionVariation_30;
			half _RenderMode;
			half _MotionAmplitude_20;
			half _MotionVariation_10;
			half _WorldDataMessage;
			float _MotionSpeed_10;
			half _DetailMode;
			half _RenderPriority;
			half _RenderBlend;
			half _RenderZWrite;
			half _MotionAmplitude_32;
			half _RenderCull;
			half _IsTVEShader;
			float _MotionSpeed_30;
			half _MotionAmplitude_10;
			float _MotionScale_10;
			float _MotionSpeed_20;
			half _RenderClip;
			half _InteractionAmplitude;
			float _MotionSpeed_32;
			float _MotionScale_30;
			half _RenderNormals;
			half _MainNormalValue;
			half _IsVersion;
			half _RenderingCat;
			half _VertexVariationMode;
			half _MotionVariation_20;
			half _PivotsMessage;
			half _LocalLeaves;
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
			TEXTURE2D(_NoiseTex);
			SAMPLER(sampler_NoiseTex);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half TVE_NoiseHighlight;
			TEXTURE2D(TVE_ColorsTex);
			SAMPLER(samplerTVE_ColorsTex);
			TEXTURE2D(TVE_ColorsTex_Vegetation);
			SAMPLER(samplerTVE_ColorsTex_Vegetation);
			TEXTURE2D(TVE_ColorsTex_Grass);
			SAMPLER(samplerTVE_ColorsTex_Grass);
			TEXTURE2D(TVE_ColorsTex_Objects);
			SAMPLER(samplerTVE_ColorsTex_Objects);
			TEXTURE2D(TVE_ColorsTex_User);
			SAMPLER(samplerTVE_ColorsTex_User);
			float4 TVE_MainLightParams;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			TEXTURE2D(_MainNormalTex);
			SAMPLER(sampler_MainNormalTex);
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
				half3 Off19_g35190 = _Vector1;
				float3 appendResult2827_g35167 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				half3 Mesh_PivotsData2831_g35167 = ( appendResult2827_g35167 * _VertexPivotMode );
				half3 On20_g35190 = Mesh_PivotsData2831_g35167;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35190 = On20_g35190;
				#else
				float3 staticSwitch14_g35190 = Off19_g35190;
				#endif
				half3 ObjectData20_g35191 = staticSwitch14_g35190;
				half3 WorldData19_g35191 = Off19_g35190;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35191 = WorldData19_g35191;
				#else
				float3 staticSwitch14_g35191 = ObjectData20_g35191;
				#endif
				#ifdef TVE_VERTEX_DATA_WORLD
				float3 staticSwitch14_g35213 = _Vector1;
				#else
				float3 staticSwitch14_g35213 = staticSwitch14_g35191;
				#endif
				half3 Mesh_PivotsOS2291_g35167 = staticSwitch14_g35213;
				float3 temp_output_2283_0_g35167 = ( v.vertex.xyz - Mesh_PivotsOS2291_g35167 );
				half3 VertexPos40_g35258 = temp_output_2283_0_g35167;
				float3 appendResult74_g35258 = (float3(VertexPos40_g35258.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g35258 = appendResult74_g35258;
				float3 break84_g35258 = VertexPos40_g35258;
				float3 appendResult81_g35258 = (float3(0.0 , break84_g35258.y , break84_g35258.z));
				half3 VertexPosOtherAxis82_g35258 = appendResult81_g35258;
				float ObjectData20_g35232 = 3.14;
				float Bounds_Height374_g35167 = _MaxBoundsInfo.y;
				float WorldData19_g35232 = ( Bounds_Height374_g35167 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35232 = WorldData19_g35232;
				#else
				float staticSwitch14_g35232 = ObjectData20_g35232;
				#endif
				float Motion_Max_Bending1133_g35167 = staticSwitch14_g35232;
				float4x4 break19_g35225 = GetObjectToWorldMatrix();
				float3 appendResult20_g35225 = (float3(break19_g35225[ 0 ][ 3 ] , break19_g35225[ 1 ][ 3 ] , break19_g35225[ 2 ][ 3 ]));
				half3 Off19_g35226 = appendResult20_g35225;
				float4 transform68_g35225 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g35225 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g35225 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g35225 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35225 = ( (transform68_g35225).xyz - (transform62_g35225).xyz );
				half3 On20_g35226 = ObjectPositionWithPivots28_g35225;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35226 = On20_g35226;
				#else
				float3 staticSwitch14_g35226 = Off19_g35226;
				#endif
				half3 ObjectData20_g35227 = staticSwitch14_g35226;
				half3 WorldData19_g35227 = Off19_g35226;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35227 = WorldData19_g35227;
				#else
				float3 staticSwitch14_g35227 = ObjectData20_g35227;
				#endif
				float3 temp_output_42_0_g35225 = staticSwitch14_g35227;
				half3 ObjectData20_g35230 = temp_output_42_0_g35225;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g35230 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35230 = WorldData19_g35230;
				#else
				float3 staticSwitch14_g35230 = ObjectData20_g35230;
				#endif
				float2 temp_output_39_38_g35223 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35230).xz ) );
				half4 Legacy33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, temp_output_39_38_g35223, 0.0 );
				half4 Vegetation33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Vegetation, samplerTVE_MotionTex_Vegetation, temp_output_39_38_g35223, 0.0 );
				half4 Grass33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Grass, samplerTVE_MotionTex_Grass, temp_output_39_38_g35223, 0.0 );
				half4 Objects33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_Objects, samplerTVE_MotionTex_Objects, temp_output_39_38_g35223, 0.0 );
				half4 Custom33_g35231 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex_User, samplerTVE_MotionTex_User, temp_output_39_38_g35223, 0.0 );
				half4 localUSE_BUFFERS33_g35231 = USE_BUFFERS( Legacy33_g35231 , Vegetation33_g35231 , Grass33_g35231 , Objects33_g35231 , Custom33_g35231 );
				float4 break322_g35179 = localUSE_BUFFERS33_g35231;
				half Wind_Power369_g35179 = saturate( ( (break322_g35179.z*2.0 + -1.0) + TVE_WindPower ) );
				half Wind_Power_103106_g35167 = Wind_Power369_g35179;
				float3 appendResult323_g35179 = (float3(break322_g35179.x , 0.0 , break322_g35179.y));
				float3 temp_output_324_0_g35179 = (appendResult323_g35179*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g35179 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g35179 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g35167 = (temp_output_339_0_g35179).xz;
				half Motion_Use1056_g35167 = _Motion_10;
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch160_g35199 = TVE_NoiseSpeed_Grass;
				#else
				float2 staticSwitch160_g35199 = TVE_NoiseSpeed_Vegetation;
				#endif
				float4x4 break19_g35201 = GetObjectToWorldMatrix();
				float3 appendResult20_g35201 = (float3(break19_g35201[ 0 ][ 3 ] , break19_g35201[ 1 ][ 3 ] , break19_g35201[ 2 ][ 3 ]));
				half3 Off19_g35202 = appendResult20_g35201;
				float4 transform68_g35201 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35201 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35201 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35201 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35201 = ( (transform68_g35201).xyz - (transform62_g35201).xyz );
				half3 On20_g35202 = ObjectPositionWithPivots28_g35201;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35202 = On20_g35202;
				#else
				float3 staticSwitch14_g35202 = Off19_g35202;
				#endif
				half3 ObjectData20_g35203 = staticSwitch14_g35202;
				half3 WorldData19_g35203 = Off19_g35202;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35203 = WorldData19_g35203;
				#else
				float3 staticSwitch14_g35203 = ObjectData20_g35203;
				#endif
				float3 temp_output_42_0_g35201 = staticSwitch14_g35203;
				half3 ObjectData20_g35200 = temp_output_42_0_g35201;
				half3 WorldData19_g35200 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35200 = WorldData19_g35200;
				#else
				float3 staticSwitch14_g35200 = ObjectData20_g35200;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float2 staticSwitch164_g35199 = (ase_worldPos).xz;
				#else
				float2 staticSwitch164_g35199 = (staticSwitch14_g35200).xz;
				#endif
				#ifdef TVE_IS_GRASS_SHADER
				float staticSwitch161_g35199 = TVE_NoiseSize_Grass;
				#else
				float staticSwitch161_g35199 = TVE_NoiseSize_Vegetation;
				#endif
				float2 panner73_g35199 = ( _TimeParameters.x * staticSwitch160_g35199 + ( staticSwitch164_g35199 * staticSwitch161_g35199 ));
				float4 tex2DNode75_g35199 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g35199, 0.0 );
				float4 saferPower77_g35199 = max( abs( tex2DNode75_g35199 ) , 0.0001 );
				float4 temp_cast_9 = (TVE_NoiseContrast).xxxx;
				float4 break142_g35199 = pow( saferPower77_g35199 , temp_cast_9 );
				half Global_NoiseTex_R34_g35167 = break142_g35199.r;
				half Input_Speed62_g35256 = _MotionSpeed_10;
				float mulTime373_g35256 = _TimeParameters.x * Input_Speed62_g35256;
				float4x4 break19_g35238 = GetObjectToWorldMatrix();
				float3 appendResult20_g35238 = (float3(break19_g35238[ 0 ][ 3 ] , break19_g35238[ 1 ][ 3 ] , break19_g35238[ 2 ][ 3 ]));
				half3 Off19_g35239 = appendResult20_g35238;
				float4 transform68_g35238 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35238 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35238 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35238 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35238 = ( (transform68_g35238).xyz - (transform62_g35238).xyz );
				half3 On20_g35239 = ObjectPositionWithPivots28_g35238;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35239 = On20_g35239;
				#else
				float3 staticSwitch14_g35239 = Off19_g35239;
				#endif
				half3 ObjectData20_g35240 = staticSwitch14_g35239;
				half3 WorldData19_g35240 = Off19_g35239;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35240 = WorldData19_g35240;
				#else
				float3 staticSwitch14_g35240 = ObjectData20_g35240;
				#endif
				float3 temp_output_42_0_g35238 = staticSwitch14_g35240;
				float3 break9_g35238 = temp_output_42_0_g35238;
				half Variation_Complex102_g35235 = frac( ( v.ase_color.r + ( break9_g35238.x + break9_g35238.z ) ) );
				float ObjectData20_g35237 = Variation_Complex102_g35235;
				half Variation_Simple105_g35235 = v.ase_color.r;
				float WorldData19_g35237 = Variation_Simple105_g35235;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35237 = WorldData19_g35237;
				#else
				float staticSwitch14_g35237 = ObjectData20_g35237;
				#endif
				half Variation3073_g35167 = staticSwitch14_g35237;
				half Motion_Variation284_g35256 = ( _MotionVariation_10 * Variation3073_g35167 );
				float2 appendResult344_g35256 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g35256 = ( _MotionScale_10 * appendResult344_g35256 );
				half2 Sine_MinusOneToOne281_g35256 = sin( ( mulTime373_g35256 + Motion_Variation284_g35256 + Motion_Scale287_g35256 ) );
				float2 temp_cast_11 = (1.0).xx;
				half Input_Turbulence327_g35256 = Global_NoiseTex_R34_g35167;
				float2 lerpResult321_g35256 = lerp( Sine_MinusOneToOne281_g35256 , temp_cast_11 , Input_Turbulence327_g35256);
				half2 Motion_Bending2258_g35167 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g35167 ) * Wind_Power_103106_g35167 * Wind_DirectionOS39_g35167 * Motion_Use1056_g35167 * Global_NoiseTex_R34_g35167 * lerpResult321_g35256 );
				half Motion_UseInteraction2097_g35167 = _Motion_Interaction;
				half Motion_InteractionMask66_g35167 = break322_g35179.w;
				float lerpResult3307_g35167 = lerp( 1.0 , Variation3073_g35167 , _InteractionVariation);
				half2 Motion_Interaction53_g35167 = ( _InteractionAmplitude * Motion_Max_Bending1133_g35167 * Motion_UseInteraction2097_g35167 * Motion_InteractionMask66_g35167 * Motion_InteractionMask66_g35167 * Wind_DirectionOS39_g35167 * lerpResult3307_g35167 );
				float2 lerpResult109_g35167 = lerp( Motion_Bending2258_g35167 , Motion_Interaction53_g35167 , Motion_InteractionMask66_g35167);
				half Mesh_Motion_182_g35167 = v.ase_texcoord3.x;
				float2 break143_g35167 = ( lerpResult109_g35167 * Mesh_Motion_182_g35167 );
				half Motion_Z190_g35167 = break143_g35167.y;
				half Angle44_g35258 = Motion_Z190_g35167;
				half3 VertexPos40_g35250 = ( VertexPosRotationAxis50_g35258 + ( VertexPosOtherAxis82_g35258 * cos( Angle44_g35258 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g35258 ) * sin( Angle44_g35258 ) ) );
				float3 appendResult74_g35250 = (float3(0.0 , 0.0 , VertexPos40_g35250.z));
				half3 VertexPosRotationAxis50_g35250 = appendResult74_g35250;
				float3 break84_g35250 = VertexPos40_g35250;
				float3 appendResult81_g35250 = (float3(break84_g35250.x , break84_g35250.y , 0.0));
				half3 VertexPosOtherAxis82_g35250 = appendResult81_g35250;
				half Motion_X216_g35167 = break143_g35167.x;
				half Angle44_g35250 = -Motion_X216_g35167;
				half Motion_Scale321_g35248 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g35248 = _MotionSpeed_32;
				float mulTime349_g35248 = _TimeParameters.x * Input_Speed62_g35248;
				float Motion_Variation330_g35248 = ( _MotionVariation_32 * v.ase_color.r );
				float Bounds_Radius121_g35167 = _MaxBoundsInfo.x;
				half Input_Amplitude58_g35248 = ( _MotionAmplitude_32 * Bounds_Radius121_g35167 * 0.1 );
				float3 appendResult345_g35248 = (float3(v.ase_color.r , ( 1.0 - v.ase_color.r ) , v.ase_color.r));
				half Global_NoiseTex_B132_g35167 = break142_g35199.b;
				half Mesh_Motion_3144_g35167 = v.ase_texcoord3.z;
				half Motion_Use322013_g35167 = _Motion_32;
				float lerpResult376_g35179 = lerp( 0.1 , 1.0 , Wind_Power369_g35179);
				half Wind_Power_323115_g35167 = lerpResult376_g35179;
				half3 Motion_Flutter263_g35167 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g35248 ) + mulTime349_g35248 + Motion_Variation330_g35248 ) ) * Input_Amplitude58_g35248 * appendResult345_g35248 ) * ( ( Global_NoiseTex_R34_g35167 + Global_NoiseTex_B132_g35167 ) * Mesh_Motion_3144_g35167 * Motion_Use322013_g35167 * Wind_Power_323115_g35167 ) );
				half Wind_Mode3167_g35167 = TVE_WindMode;
				float3 lerpResult3168_g35167 = lerp( v.vertex.xyz , ( ( VertexPosRotationAxis50_g35250 + ( VertexPosOtherAxis82_g35250 * cos( Angle44_g35250 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g35250 ) * sin( Angle44_g35250 ) ) ) + Motion_Flutter263_g35167 ) , Wind_Mode3167_g35167);
				float3 Vertex_Motion_Object833_g35167 = lerpResult3168_g35167;
				float3 appendResult2043_g35167 = (float3(Motion_X216_g35167 , 0.0 , Motion_Z190_g35167));
				float3 lerpResult3173_g35167 = lerp( v.vertex.xyz , ( ( v.vertex.xyz + appendResult2043_g35167 ) + Motion_Flutter263_g35167 ) , Wind_Mode3167_g35167);
				float3 Vertex_Motion_World1118_g35167 = lerpResult3173_g35167;
				float3 temp_output_3331_0_g35167 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g35167 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g35167 = Vertex_Motion_Object833_g35167;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g35167 = temp_output_3331_0_g35167;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g35167 = temp_output_3331_0_g35167;
				#else
				float3 staticSwitch3312_g35167 = Vertex_Motion_Object833_g35167;
				#endif
				half3 ObjectData20_g35178 = staticSwitch3312_g35167;
				half3 WorldData19_g35178 = Vertex_Motion_World1118_g35167;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35178 = WorldData19_g35178;
				#else
				float3 staticSwitch14_g35178 = ObjectData20_g35178;
				#endif
				float4x4 break19_g35194 = GetObjectToWorldMatrix();
				float3 appendResult20_g35194 = (float3(break19_g35194[ 0 ][ 3 ] , break19_g35194[ 1 ][ 3 ] , break19_g35194[ 2 ][ 3 ]));
				half3 Off19_g35195 = appendResult20_g35194;
				float4 transform68_g35194 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult93_g35194 = (float3(v.ase_texcoord.z , v.ase_texcoord3.w , v.ase_texcoord.w));
				float4 transform62_g35194 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult93_g35194 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35194 = ( (transform68_g35194).xyz - (transform62_g35194).xyz );
				half3 On20_g35195 = ObjectPositionWithPivots28_g35194;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35195 = On20_g35195;
				#else
				float3 staticSwitch14_g35195 = Off19_g35195;
				#endif
				half3 ObjectData20_g35196 = staticSwitch14_g35195;
				half3 WorldData19_g35196 = Off19_g35195;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35196 = WorldData19_g35196;
				#else
				float3 staticSwitch14_g35196 = ObjectData20_g35196;
				#endif
				float3 temp_output_42_0_g35194 = staticSwitch14_g35196;
				float temp_output_7_0_g35245 = TVE_SizeFadeEnd;
				float ObjectData20_g35193 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g35194 ) * _GlobalSizeFade ) - temp_output_7_0_g35245 ) / ( TVE_SizeFadeStart - temp_output_7_0_g35245 ) ) );
				float WorldData19_g35193 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35193 = WorldData19_g35193;
				#else
				float staticSwitch14_g35193 = ObjectData20_g35193;
				#endif
				float Vertex_SizeFade1740_g35167 = staticSwitch14_g35193;
				float4x4 break19_g35184 = GetObjectToWorldMatrix();
				float3 appendResult20_g35184 = (float3(break19_g35184[ 0 ][ 3 ] , break19_g35184[ 1 ][ 3 ] , break19_g35184[ 2 ][ 3 ]));
				half3 Off19_g35185 = appendResult20_g35184;
				float4 transform68_g35184 = mul(GetObjectToWorldMatrix(),v.vertex);
				float3 appendResult95_g35184 = (float3(v.ase_texcoord.z , 0.0 , v.ase_texcoord.w));
				float4 transform62_g35184 = mul(GetObjectToWorldMatrix(),float4( ( v.vertex.xyz - ( appendResult95_g35184 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35184 = ( (transform68_g35184).xyz - (transform62_g35184).xyz );
				half3 On20_g35185 = ObjectPositionWithPivots28_g35184;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35185 = On20_g35185;
				#else
				float3 staticSwitch14_g35185 = Off19_g35185;
				#endif
				half3 ObjectData20_g35186 = staticSwitch14_g35185;
				half3 WorldData19_g35186 = Off19_g35185;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35186 = WorldData19_g35186;
				#else
				float3 staticSwitch14_g35186 = ObjectData20_g35186;
				#endif
				float3 temp_output_42_0_g35184 = staticSwitch14_g35186;
				half3 ObjectData20_g35183 = temp_output_42_0_g35184;
				half3 WorldData19_g35183 = ase_worldPos;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35183 = WorldData19_g35183;
				#else
				float3 staticSwitch14_g35183 = ObjectData20_g35183;
				#endif
				float2 temp_output_43_38_g35181 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35183).xz ) );
				half4 Legacy33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g35181, 0.0 );
				half4 Vegetation33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g35181, 0.0 );
				half4 Grass33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g35181, 0.0 );
				half4 Objects33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g35181, 0.0 );
				half4 Custom33_g35182 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g35181, 0.0 );
				half4 localUSE_BUFFERS33_g35182 = USE_BUFFERS( Legacy33_g35182 , Vegetation33_g35182 , Grass33_g35182 , Objects33_g35182 , Custom33_g35182 );
				float4 break49_g35181 = localUSE_BUFFERS33_g35182;
				half Global_ExtrasTex_G305_g35167 = break49_g35181.y;
				float lerpResult346_g35167 = lerp( 1.0 , Global_ExtrasTex_G305_g35167 , _GlobalSize);
				float ObjectData20_g35192 = ( lerpResult346_g35167 * _LocalSize );
				float WorldData19_g35192 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g35192 = WorldData19_g35192;
				#else
				float staticSwitch14_g35192 = ObjectData20_g35192;
				#endif
				half Vertex_Size1741_g35167 = staticSwitch14_g35192;
				float3 normalizeResult2696_g35167 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float3 break2709_g35167 = cross( normalizeResult2696_g35167 , half3(0,1,0) );
				float3 appendResult2710_g35167 = (float3(-break2709_g35167.z , 0.0 , break2709_g35167.x));
				float3 appendResult2667_g35167 = (float3(v.ase_color.r , 0.5 , v.ase_color.r));
				float3 normalizeResult2210_g35167 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
				float dotResult2212_g35167 = dot( normalizeResult2210_g35167 , float3(0,1,0) );
				half Mask_HView2656_g35167 = abs( dotResult2212_g35167 );
				float saferPower2652_g35167 = max( Mask_HView2656_g35167 , 0.0001 );
				half3 Grass_Coverage2661_g35167 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g35167 , 0.0 ) ).xyz * ( _PerspectivePushValue + _PerspectiveCat ) ) + ( (appendResult2667_g35167*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * v.ase_color.a * pow( saferPower2652_g35167 , _PerspectiveAngleValue ) );
				float3 Final_VertexPosition890_g35167 = ( ( staticSwitch14_g35178 * Vertex_SizeFade1740_g35167 * Vertex_Size1741_g35167 ) + Mesh_PivotsOS2291_g35167 + Grass_Coverage2661_g35167 );
				
				half2 Noise_UVs3274_g35167 = ( (ase_worldPos).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g35170 = _NoiseMinValue;
				half Noise_Mask3162_g35167 = saturate( ( ( SAMPLE_TEXTURE2D_LOD( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g35167, 0.0 ).r - temp_output_7_0_g35170 ) / ( _NoiseMaxValue - temp_output_7_0_g35170 ) ) );
				float4 lerpResult2800_g35167 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g35167);
				half3 Noise_Tint2802_g35167 = (lerpResult2800_g35167).rgb;
				float3 vertexToFrag3225_g35167 = Noise_Tint2802_g35167;
				o.ase_texcoord2.xyz = vertexToFrag3225_g35167;
				half Global_NoiseTex_H2869_g35167 = pow( abs( tex2DNode75_g35199.r ) , TVE_NoiseHighlight );
				half3 Highlight_Tint3231_g35167 = ( ( (_MotionHighlightColor).rgb * Global_NoiseTex_H2869_g35167 * Wind_Power_103106_g35167 * Wind_Mode3167_g35167 * v.ase_color.r ) + float3( 1,1,1 ) );
				float3 vertexToFrag3252_g35167 = Highlight_Tint3231_g35167;
				o.ase_texcoord4.xyz = vertexToFrag3252_g35167;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord;
				o.ase_texcoord5 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord4.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g35167;
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

				float temp_output_7_0_g35173 = _GradientMinValue;
				float4 lerpResult2779_g35167 = lerp( _GradientColorTwo , _GradientColorOne , saturate( ( ( IN.ase_color.a - temp_output_7_0_g35173 ) / ( ( _GradientMaxValue + _GradientCat ) - temp_output_7_0_g35173 ) ) ));
				half3 Gradient_Tint2784_g35167 = (lerpResult2779_g35167).rgb;
				float3 vertexToFrag3225_g35167 = IN.ase_texcoord2.xyz;
				half2 Noise_UVs3274_g35167 = ( (WorldPosition).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g35170 = _NoiseMinValue;
				half Noise_Mask3162_g35167 = saturate( ( ( SAMPLE_TEXTURE2D( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g35167 ).r - temp_output_7_0_g35170 ) / ( _NoiseMaxValue - temp_output_7_0_g35170 ) ) );
				float4 lerpResult2800_g35167 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g35167);
				half3 Noise_Tint2802_g35167 = (lerpResult2800_g35167).rgb;
				#ifdef TVE_IS_GRASS_SHADER
				float3 staticSwitch3420_g35167 = Noise_Tint2802_g35167;
				#else
				float3 staticSwitch3420_g35167 = vertexToFrag3225_g35167;
				#endif
				half2 Main_UVs15_g35167 = ( ( IN.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g35167 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g35167 );
				float4 temp_output_51_0_g35167 = ( _MainColor * tex2DNode29_g35167 );
				half3 Main_AlbedoRaw99_g35167 = (temp_output_51_0_g35167).rgb;
				float3 vertexToFrag3252_g35167 = IN.ase_texcoord4.xyz;
				half3 Main_AlbedoTinted2808_g35167 = ( Gradient_Tint2784_g35167 * staticSwitch3420_g35167 * Main_AlbedoRaw99_g35167 * vertexToFrag3252_g35167 );
				float4x4 break19_g35215 = GetObjectToWorldMatrix();
				float3 appendResult20_g35215 = (float3(break19_g35215[ 0 ][ 3 ] , break19_g35215[ 1 ][ 3 ] , break19_g35215[ 2 ][ 3 ]));
				half3 Off19_g35216 = appendResult20_g35215;
				float4 transform68_g35215 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord5);
				float3 appendResult95_g35215 = (float3(IN.ase_texcoord3.z , 0.0 , IN.ase_texcoord3.w));
				float4 transform62_g35215 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord5.xyz - ( appendResult95_g35215 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35215 = ( (transform68_g35215).xyz - (transform62_g35215).xyz );
				half3 On20_g35216 = ObjectPositionWithPivots28_g35215;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35216 = On20_g35216;
				#else
				float3 staticSwitch14_g35216 = Off19_g35216;
				#endif
				half3 ObjectData20_g35217 = staticSwitch14_g35216;
				half3 WorldData19_g35217 = Off19_g35216;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35217 = WorldData19_g35217;
				#else
				float3 staticSwitch14_g35217 = ObjectData20_g35217;
				#endif
				float3 temp_output_42_0_g35215 = staticSwitch14_g35217;
				half3 ObjectData20_g35221 = temp_output_42_0_g35215;
				half3 WorldData19_g35221 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35221 = WorldData19_g35221;
				#else
				float3 staticSwitch14_g35221 = ObjectData20_g35221;
				#endif
				float2 temp_output_35_38_g35214 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35221).xz ) );
				half4 Legacy33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, temp_output_35_38_g35214 );
				half4 Vegetation33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Vegetation, samplerTVE_ColorsTex_Vegetation, temp_output_35_38_g35214 );
				half4 Grass33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Grass, samplerTVE_ColorsTex_Grass, temp_output_35_38_g35214 );
				half4 Objects33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Objects, samplerTVE_ColorsTex_Objects, temp_output_35_38_g35214 );
				half4 Custom33_g35220 = SAMPLE_TEXTURE2D( TVE_ColorsTex_User, samplerTVE_ColorsTex_User, temp_output_35_38_g35214 );
				half4 localUSE_BUFFERS33_g35220 = USE_BUFFERS( Legacy33_g35220 , Vegetation33_g35220 , Grass33_g35220 , Objects33_g35220 , Custom33_g35220 );
				float4 temp_output_45_0_g35214 = localUSE_BUFFERS33_g35220;
				half3 Global_ColorsTex_RGB1700_g35167 = (temp_output_45_0_g35214).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g35174 = 2.0;
				#else
				float staticSwitch1_g35174 = 4.594794;
				#endif
				float lerpResult2103_g35167 = lerp( 1.0 , ( 1.0 - IN.ase_color.a ) , _ColorsMaskValue);
				float3 lerpResult108_g35167 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g35167 * staticSwitch1_g35174 ) ) , ( _GlobalColors * lerpResult2103_g35167 ));
				half3 Global_Colors1954_g35167 = lerpResult108_g35167;
				float3 temp_output_123_0_g35167 = ( Main_AlbedoTinted2808_g35167 * Global_Colors1954_g35167 );
				half3 Main_AlbedoColored863_g35167 = temp_output_123_0_g35167;
				half3 Blend_Albedo265_g35167 = Main_AlbedoColored863_g35167;
				float3 lerpResult2929_g35167 = lerp( float3( 1,1,1 ) , (TVE_MainLightParams).rgb , _SubsurfaceLightValue);
				half3 Subsurface_Color1722_g35167 = ( (_SubsurfaceColor).rgb * lerpResult2929_g35167 );
				half Global_ColorsTex_A1701_g35167 = (temp_output_45_0_g35214).w;
				float lerpResult1720_g35167 = lerp( 1.0 , Global_ColorsTex_A1701_g35167 , _GlobalHealthiness);
				half Subsurface_Intensity1752_g35167 = ( ( _SubsurfaceValue * lerpResult1720_g35167 ) + _SubsurfaceCat );
				float lerpResult3219_g35167 = lerp( 1.0 , IN.ase_color.a , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g35167 = lerpResult3219_g35167;
				half3 Subsurface_Transmission884_g35167 = ( Subsurface_Color1722_g35167 * Subsurface_Intensity1752_g35167 * Subsurface_Mask1557_g35167 );
				float3 normalizeResult1983_g35167 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g35167 = dot( -TVE_MainLightDirection , normalizeResult1983_g35167 );
				float saferPower1624_g35167 = max( (dotResult785_g35167*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g35167 = 0.0;
				#else
				float staticSwitch1602_g35167 = ( pow( saferPower1624_g35167 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g35167 = staticSwitch1602_g35167;
				half3 Subsurface_Forward1691_g35167 = ( Subsurface_Transmission884_g35167 * Mask_Subsurface_View782_g35167 );
				half3 Blend_AlbedoAndSubsurface149_g35167 = ( Blend_Albedo265_g35167 + Subsurface_Forward1691_g35167 );
				half3 Global_OverlayColor1758_g35167 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g35167 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g35167 );
				float2 appendResult88_g35247 = (float2(tex2DNode117_g35167.a , tex2DNode117_g35167.g));
				float2 temp_output_90_0_g35247 = ( (appendResult88_g35247*2.0 + -1.0) * _MainNormalValue );
				float2 break93_g35247 = temp_output_90_0_g35247;
				half Main_NormalY2095_g35167 = break93_g35247.y;
				half Overlay_Contrast1405_g35167 = _OverlayContrastValue;
				half Global_OverlayIntensity154_g35167 = TVE_OverlayIntensity;
				float4x4 break19_g35184 = GetObjectToWorldMatrix();
				float3 appendResult20_g35184 = (float3(break19_g35184[ 0 ][ 3 ] , break19_g35184[ 1 ][ 3 ] , break19_g35184[ 2 ][ 3 ]));
				half3 Off19_g35185 = appendResult20_g35184;
				float4 transform68_g35184 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord5);
				float3 appendResult95_g35184 = (float3(IN.ase_texcoord3.z , 0.0 , IN.ase_texcoord3.w));
				float4 transform62_g35184 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord5.xyz - ( appendResult95_g35184 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g35184 = ( (transform68_g35184).xyz - (transform62_g35184).xyz );
				half3 On20_g35185 = ObjectPositionWithPivots28_g35184;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g35185 = On20_g35185;
				#else
				float3 staticSwitch14_g35185 = Off19_g35185;
				#endif
				half3 ObjectData20_g35186 = staticSwitch14_g35185;
				half3 WorldData19_g35186 = Off19_g35185;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35186 = WorldData19_g35186;
				#else
				float3 staticSwitch14_g35186 = ObjectData20_g35186;
				#endif
				float3 temp_output_42_0_g35184 = staticSwitch14_g35186;
				half3 ObjectData20_g35183 = temp_output_42_0_g35184;
				half3 WorldData19_g35183 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g35183 = WorldData19_g35183;
				#else
				float3 staticSwitch14_g35183 = ObjectData20_g35183;
				#endif
				float2 temp_output_43_38_g35181 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g35183).xz ) );
				half4 Legacy33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, temp_output_43_38_g35181 );
				half4 Vegetation33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Vegetation, samplerTVE_ExtrasTex_Vegetation, temp_output_43_38_g35181 );
				half4 Grass33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Grass, samplerTVE_ExtrasTex_Grass, temp_output_43_38_g35181 );
				half4 Objects33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_Objects, samplerTVE_ExtrasTex_Objects, temp_output_43_38_g35181 );
				half4 Custom33_g35182 = SAMPLE_TEXTURE2D( TVE_ExtrasTex_User, samplerTVE_ExtrasTex_User, temp_output_43_38_g35181 );
				half4 localUSE_BUFFERS33_g35182 = USE_BUFFERS( Legacy33_g35182 , Vegetation33_g35182 , Grass33_g35182 , Objects33_g35182 , Custom33_g35182 );
				float4 break49_g35181 = localUSE_BUFFERS33_g35182;
				half Global_ExtrasTex_B156_g35167 = break49_g35181.z;
				float temp_output_1025_0_g35167 = ( Global_OverlayIntensity154_g35167 * _GlobalOverlay * Global_ExtrasTex_B156_g35167 );
				float lerpResult1065_g35167 = lerp( 1.0 , IN.ase_color.r , _OverlayVariationValue);
				half Overlay_Commons1365_g35167 = ( temp_output_1025_0_g35167 * lerpResult1065_g35167 );
				half Overlay_Mask269_g35167 = saturate( ( saturate( ( IN.ase_color.a + ( Main_NormalY2095_g35167 * Overlay_Contrast1405_g35167 ) ) ) - ( 1.0 - Overlay_Commons1365_g35167 ) ) );
				float3 lerpResult336_g35167 = lerp( Blend_AlbedoAndSubsurface149_g35167 , Global_OverlayColor1758_g35167 , Overlay_Mask269_g35167);
				half3 Final_Albedo359_g35167 = lerpResult336_g35167;
				half Main_Alpha316_g35167 = (temp_output_51_0_g35167).a;
				float lerpResult354_g35167 = lerp( 1.0 , Main_Alpha316_g35167 , _render_premul);
				half Final_Premultiply355_g35167 = lerpResult354_g35167;
				float3 temp_output_410_0_g35167 = ( Final_Albedo359_g35167 * Final_Premultiply355_g35167 );
				float3 temp_cast_12 = (1.0).xxx;
				half Mesh_Occlusion318_g35167 = IN.ase_color.g;
				float saferPower1201_g35167 = max( Mesh_Occlusion318_g35167 , 0.0001 );
				float3 lerpResult2945_g35167 = lerp( (_VertexOcclusionColor).rgb , temp_cast_12 , saturate( pow( saferPower1201_g35167 , ( _VertexOcclusionValue + _OcclusionCat ) ) ));
				half3 Vertex_Occlusion648_g35167 = lerpResult2945_g35167;
				
				float localCustomAlphaClip9_g35243 = ( 0.0 );
				half Main_AlphaRaw1203_g35167 = tex2DNode29_g35167.a;
				float Mesh_Variation16_g35167 = IN.ase_color.r;
				float lerpResult2262_g35167 = lerp( 0.9 , Mesh_Variation16_g35167 , _LeavesVariationValue);
				half Global_ExtrasTex_R174_g35167 = break49_g35181.x;
				float lerpResult2624_g35167 = lerp( 1.0 , Global_ExtrasTex_R174_g35167 , _GlobalLeaves);
				half AlphaTreshold2132_g35167 = _Cutoff;
				half Mask_Leaves315_g35167 = ( ( (lerpResult2262_g35167*0.5 + 0.5) - ( 1.0 - ( lerpResult2624_g35167 * _LocalLeaves ) ) ) + AlphaTreshold2132_g35167 );
				half Alpha5_g35243 = ( Main_AlphaRaw1203_g35167 * Mask_Leaves315_g35167 );
				float Alpha9_g35243 = Alpha5_g35243;
				#if _ALPHATEST_ON
				clip(Alpha9_g35243 - _Cutoff);
				#endif
				half Final_Clip914_g35167 = localCustomAlphaClip9_g35243;
				
				
				float3 Albedo = ( temp_output_410_0_g35167 * Vertex_Occlusion648_g35167 );
				float Alpha = Main_Alpha316_g35167;
				float AlphaClipThreshold = Final_Clip914_g35167;

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
1927;7;1906;1015;2900.349;866.923;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;271;-1552,-896;Half;False;Property;_IsLitShader;_IsLitShader;208;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;530;-1376,-896;Half;False;Property;_IsForwardPathShader;_IsForwardPathShader;207;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;901;-2176,-384;Inherit;False;Base Shader;1;;35167;856f7164d1c579d43a5cf4968a75ca43;50,1300,1,1298,1,1271,1,1708,1,1962,1,1712,1,1964,1,1969,1,1719,1,893,1,1745,1,1742,1,1718,1,1717,1,1715,1,1714,1,916,0,1949,1,1762,0,1763,0,1776,1,1646,1,1690,0,1757,0,3221,2,1981,0,2807,1,2953,1,3243,1,2172,0,2658,1,1734,0,1737,0,1733,0,1736,0,1968,0,1966,0,1735,0,878,0,1550,0,860,1,2750,1,2260,1,2261,1,2054,0,2032,0,2036,0,2060,0,2062,1,2039,1;0;15;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-769.2701;Half;False;Property;_render_cull;_render_cull;211;1;[HideInInspector];Create;True;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;891;-1152,-768;Inherit;False;Property;_Float18;Float 7;204;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;168;-1984,-896;Half;False;Property;_IsGrassShader;_IsGrassShader;205;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Grass Subsurface Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;713;-2176,256;Inherit;False;Use TVE_IS_GRASS_SHADER;-1;;35166;921559c53826c0142ba6e27dd03eaef2;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-1792,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;206;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1536,-768;Half;False;Property;_render_dst;_render_dst;212;1;[HideInInspector];Create;True;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-768;Half;False;Property;_render_cutoff;_render_cutoff;209;1;[HideInInspector];Create;True;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;735;-2176,320;Inherit;False;Use TVE_PIVOT_DATA_BAKED;-1;;35165;8da5867b3f9f1834693af40d3eff73f4;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;213;1;[HideInInspector];Create;True;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1728,-768;Half;False;Property;_render_src;_render_src;210;1;[HideInInspector];Create;True;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;897;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;True;1;True;17;True;3;False;-1;True;False;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;893;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;2;BOXOPHOBIC/The Vegetation Engine/Vegetation/Grass Subsurface Lit;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;17;False;False;False;False;False;False;False;False;True;0;False;-1;True;2;True;10;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;17;True;3;False;-1;True;False;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;36;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;1;  Transmission Shadow;0.5,True,891;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;1;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;0;0;6;False;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;895;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;894;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;896;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;892;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1024.392;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;408;-2176,128;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
WireConnection;893;0;901;0
WireConnection;893;1;901;528
WireConnection;893;3;901;529
WireConnection;893;4;901;530
WireConnection;893;5;901;531
WireConnection;893;6;901;532
WireConnection;893;7;901;653
WireConnection;893;14;901;1230
WireConnection;893;8;901;534
ASEEND*/
//CHKSM=D8636D28407E4D3D18923F2585095939867FDC73
