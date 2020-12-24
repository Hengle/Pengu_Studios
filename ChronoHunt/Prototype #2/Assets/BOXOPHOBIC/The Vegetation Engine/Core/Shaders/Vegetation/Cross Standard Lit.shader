// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Vegetation/Cross Standard Lit"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][StyledBanner(Cross Standard Lit)]_Banner("Banner", Float) = 0
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
		_GlobalColors("Global Colors", Range( 0 , 1)) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalHealthiness("Global Healthiness", Range( 0 , 1)) = 1
		_GlobalSize("Global Size", Range( 0 , 1)) = 1
		_GlobalSizeFade("Global Size Fade", Range( 0 , 1)) = 0
		[StyledSpace(10)]_GlobalSpace("# Global Space", Float) = 0
		[HideInInspector][HDR]_LocalColors("Local Colors", Color) = (1,1,1,1)
		[HideInInspector]_LocalSize("Local Size", Range( 0 , 1)) = 1
		_ColorsMaskValue("Colors Use Mask", Range( 0 , 1)) = 0
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
		[Space(10)]_MainMaskMinValue("Main Mask Min", Range( 0 , 1)) = 0
		_MainMaskMaxValue("Main Mask Max", Range( 0 , 1)) = 1
		[StyledCategory(Detail Settings)]_DetailCat("[ Detail Cat ]", Float) = 0
		[Enum(Off,0,Overlay,1,Replace,2)]_DetailMode("Detail Mode", Float) = 0
		[Enum(Vertex Paint,0,Projection,1)]_DetailTypeMode("Detail Type", Float) = 0
		[Enum(Standard,0,Packed,1)]_DetailMapsMode("Detail Maps", Float) = 0
		[StyledSpace(10)]_DetailSpace("# Detail Space", Float) = 0
		[StyledCategory(Subsurface Settings)]_SubsurfaceCat("[ Subsurface Cat ]", Float) = 0
		[HideInInspector][ASEDiffusionProfile(_SubsurfaceDiffusion)]_SubsurfaceDiffusion_asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (0.3315085,0.490566,0,1)
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 1
		_SubsurfaceViewValue("Subsurface View", Range( 0 , 8)) = 1
		_SubsurfaceAngleValue("Subsurface Angle", Range( 0 , 16)) = 8
		_SubsurfaceLightValue("Subsurface Use Light", Range( 0 , 1)) = 1
		_SubsurfaceMaskValue("Subsurface Use Mask", Range( 0 , 1)) = 1
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
		[StyledCategory(Billboard Settings)]_BillboardCat("[ Billboard Cat ]", Float) = 0
		_BillboardFadeHValue("Billboard Fade Horizontal", Range( 0 , 4)) = 0
		_BillboardFadeVValue("Billboard Fade Verical", Range( 0 , 4)) = 0
		[StyledCategory(Vertex Settings)]_VertexCat("[ Vertex Cat ]", Float) = 0
		[StyledMessage(Info, This motion type allows for high quality bending motion and interaction. The motion and global elements are calculated per instance., _VertexMotionMode, 0 , 2, 0)]_ObjectDataMessage("# Object Data Message", Float) = 0
		[StyledMessage(Info, This motion type allows for simpler and cheaper translation motion and interaction. The motion is calculated in world space but the global elements are calculated per instance., _VertexMotionMode, 1 , 2, 0)]_WorldDataMessage("# World Data Message", Float) = 0
		[StyledMessage(Info, The Baked pivots feature allows for using per mesh element interaction and elements influence. This feature requires pre baked pivots on prefab conversion. Useful for latge grass meshes., _VertexPivotMode, 1 , 0, 0)]_PivotsMessage("# Pivots Message", Float) = 0
		[Enum(High Quality,0,Low Quality,1)][Space(10)]_VertexMotionMode("Vertex Motion", Float) = 0
		[StyledSpace(10)]_VertexMotionSpace("# Vertex Motion Space", Float) = 0
		_Motion_10("Motion Bending", Range( 0 , 1)) = 1
		_Motion_Interaction("Motion Interaction", Range( 0 , 1)) = 1
		[HideInInspector]_MotionAmplitude_10("Primary Bending", Float) = 2
		[HideInInspector]_MotionSpeed_10("Primary Speed", Float) = 6
		[HideInInspector]_MotionScale_10("Primary Elasticity", Float) = 1
		[HideInInspector]_MotionVariation_10("Primary Variation", Float) = 3
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
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsLitShader("_IsLitShader", Float) = 1
		[HideInInspector]_IsAnyPathShader("_IsAnyPathShader", Float) = 1
		[HideInInspector]_IsCrossShader("_IsCrossShader", Float) = 1
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#define TVE_IS_VEGETATION_SHADER
			  
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NoiseTintOne;
			float4 _Color;
			half4 _MainColor;
			half4 _MainUVs;
			float4 _LocalColors;
			half4 _GradientColorOne;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			half4 _GradientColorTwo;
			half4 _NoiseTintTwo;
			half3 _render_normals_options;
			half _GradientCat;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _LocalSize;
			half _GlobalSizeFade;
			half _VertexDataMode;
			half _VertexMotionMode;
			half _VertexMotionSpace;
			half _VertexCat;
			half _InteractionVariation;
			half _Motion_Interaction;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _Motion_10;
			half _GlobalSize;
			half _IsLitShader;
			half _NoiseMaxValue;
			half _MoiseCat;
			half _BillboardFadeHValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _render_premul;
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
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _GlobalColors;
			half _vertex_pivot_mode;
			half _NoiseMinValue;
			half _NoiseScaleValue;
			half _MotionAmplitude_10;
			half _ObjectDataMessage;
			half _BatchingMessage;
			half _MainCat;
			half _DetailMode;
			half _DetailMapsMode;
			half _GlobalCat;
			half _RenderMode;
			half _VertexVariationMode;
			half _RenderPriority;
			half _IsVersion;
			half _IsTVEShader;
			half _RenderingCat;
			half _RenderCull;
			half _Cutoff;
			half _MainNormalValue;
			half _render_zw;
			half _Banner;
			half _render_cull;
			half _render_cutoff;
			half _render_dst;
			half _render_src;
			half _IsCrossShader;
			half _IsStandardShader;
			half _IsAnyPathShader;
			half _RenderClip;
			half _RenderNormals;
			half _RenderBlend;
			half _RenderZWrite;
			half _BillboardFadeVValue;
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
			float _render_normals;
			half _GlobalSpace;
			half _DetailSpace;
			half _PivotsMessage;
			half _DetailTypeMode;
			half _AdvancedCat;
			half _DetailCat;
			float _OverlayContrast;
			half _BillboardCat;
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
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_MainMaskTex);
			float4 TVE_MainLightParams;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			TEXTURE2D(_MainNormalTex);
			SAMPLER(sampler_MainNormalTex);
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
				half3 Mesh_PivotsOS2291_g32434 = _Vector1;
				float3 temp_output_2283_0_g32434 = ( v.vertex.xyz - Mesh_PivotsOS2291_g32434 );
				half3 VertexPos40_g32740 = temp_output_2283_0_g32434;
				float3 appendResult74_g32740 = (float3(VertexPos40_g32740.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g32740 = appendResult74_g32740;
				float3 break84_g32740 = VertexPos40_g32740;
				float3 appendResult81_g32740 = (float3(0.0 , break84_g32740.y , break84_g32740.z));
				half3 VertexPosOtherAxis82_g32740 = appendResult81_g32740;
				float ObjectData20_g32815 = 3.14;
				float Bounds_Height374_g32434 = _MaxBoundsInfo.y;
				float WorldData19_g32815 = ( Bounds_Height374_g32434 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32815 = WorldData19_g32815;
				#else
				float staticSwitch14_g32815 = ObjectData20_g32815;
				#endif
				float Motion_Max_Bending1133_g32434 = staticSwitch14_g32815;
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
				half Wind_Power_103106_g32434 = Wind_Power369_g32778;
				float3 appendResult323_g32778 = (float3(break322_g32778.x , 0.0 , break322_g32778.y));
				float3 temp_output_324_0_g32778 = (appendResult323_g32778*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g32778 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g32778 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g32434 = (temp_output_339_0_g32778).xz;
				half Motion_Use1056_g32434 = _Motion_10;
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
				float4 temp_cast_9 = (TVE_NoiseContrast).xxxx;
				float4 break142_g32799 = pow( saferPower77_g32799 , temp_cast_9 );
				half Global_NoiseTex_R34_g32434 = break142_g32799.r;
				half Input_Speed62_g32735 = _MotionSpeed_10;
				float mulTime373_g32735 = _TimeParameters.x * Input_Speed62_g32735;
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
				half Variation3073_g32434 = staticSwitch14_g32762;
				half Motion_Variation284_g32735 = ( _MotionVariation_10 * Variation3073_g32434 );
				float2 appendResult344_g32735 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g32735 = ( _MotionScale_10 * appendResult344_g32735 );
				half2 Sine_MinusOneToOne281_g32735 = sin( ( mulTime373_g32735 + Motion_Variation284_g32735 + Motion_Scale287_g32735 ) );
				float2 temp_cast_11 = (1.0).xx;
				half Input_Turbulence327_g32735 = Global_NoiseTex_R34_g32434;
				float2 lerpResult321_g32735 = lerp( Sine_MinusOneToOne281_g32735 , temp_cast_11 , Input_Turbulence327_g32735);
				half2 Motion_Bending2258_g32434 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g32434 ) * Wind_Power_103106_g32434 * Wind_DirectionOS39_g32434 * Motion_Use1056_g32434 * Global_NoiseTex_R34_g32434 * lerpResult321_g32735 );
				half Motion_UseInteraction2097_g32434 = _Motion_Interaction;
				half Motion_InteractionMask66_g32434 = break322_g32778.w;
				float lerpResult3307_g32434 = lerp( 1.0 , Variation3073_g32434 , _InteractionVariation);
				half2 Motion_Interaction53_g32434 = ( _InteractionAmplitude * Motion_Max_Bending1133_g32434 * Motion_UseInteraction2097_g32434 * Motion_InteractionMask66_g32434 * Motion_InteractionMask66_g32434 * Wind_DirectionOS39_g32434 * lerpResult3307_g32434 );
				float2 lerpResult109_g32434 = lerp( Motion_Bending2258_g32434 , Motion_Interaction53_g32434 , Motion_InteractionMask66_g32434);
				half Mesh_Motion_182_g32434 = v.ase_texcoord3.x;
				float2 break143_g32434 = ( lerpResult109_g32434 * Mesh_Motion_182_g32434 );
				half Motion_Z190_g32434 = break143_g32434.y;
				half Angle44_g32740 = Motion_Z190_g32434;
				half3 VertexPos40_g32723 = ( VertexPosRotationAxis50_g32740 + ( VertexPosOtherAxis82_g32740 * cos( Angle44_g32740 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g32740 ) * sin( Angle44_g32740 ) ) );
				float3 appendResult74_g32723 = (float3(0.0 , 0.0 , VertexPos40_g32723.z));
				half3 VertexPosRotationAxis50_g32723 = appendResult74_g32723;
				float3 break84_g32723 = VertexPos40_g32723;
				float3 appendResult81_g32723 = (float3(break84_g32723.x , break84_g32723.y , 0.0));
				half3 VertexPosOtherAxis82_g32723 = appendResult81_g32723;
				half Motion_X216_g32434 = break143_g32434.x;
				half Angle44_g32723 = -Motion_X216_g32434;
				half Wind_Mode3167_g32434 = TVE_WindMode;
				float3 lerpResult3168_g32434 = lerp( v.vertex.xyz , ( VertexPosRotationAxis50_g32723 + ( VertexPosOtherAxis82_g32723 * cos( Angle44_g32723 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g32723 ) * sin( Angle44_g32723 ) ) ) , Wind_Mode3167_g32434);
				float3 Vertex_Motion_Object833_g32434 = lerpResult3168_g32434;
				float3 temp_output_3474_0_g32434 = ( v.vertex.xyz - Mesh_PivotsOS2291_g32434 );
				float3 appendResult2043_g32434 = (float3(Motion_X216_g32434 , 0.0 , Motion_Z190_g32434));
				float3 lerpResult3173_g32434 = lerp( v.vertex.xyz , ( temp_output_3474_0_g32434 + appendResult2043_g32434 ) , Wind_Mode3167_g32434);
				float3 Vertex_Motion_World1118_g32434 = lerpResult3173_g32434;
				float3 temp_output_3331_0_g32434 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g32434 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g32434 = Vertex_Motion_Object833_g32434;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g32434 = temp_output_3331_0_g32434;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g32434 = temp_output_3331_0_g32434;
				#else
				float3 staticSwitch3312_g32434 = Vertex_Motion_Object833_g32434;
				#endif
				half3 ObjectData20_g32782 = staticSwitch3312_g32434;
				half3 WorldData19_g32782 = Vertex_Motion_World1118_g32434;
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
				float Vertex_SizeFade1740_g32434 = staticSwitch14_g32780;
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
				half Global_ExtrasTex_G305_g32434 = break49_g32746.y;
				float lerpResult346_g32434 = lerp( 1.0 , Global_ExtrasTex_G305_g32434 , _GlobalSize);
				float ObjectData20_g32781 = ( lerpResult346_g32434 * _LocalSize );
				float WorldData19_g32781 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32781 = WorldData19_g32781;
				#else
				float staticSwitch14_g32781 = ObjectData20_g32781;
				#endif
				half Vertex_Size1741_g32434 = staticSwitch14_g32781;
				half3 Grass_Coverage2661_g32434 = half3(0,0,0);
				float3 Final_VertexPosition890_g32434 = ( ( staticSwitch14_g32782 * Vertex_SizeFade1740_g32434 * Vertex_Size1741_g32434 ) + Mesh_PivotsOS2291_g32434 + Grass_Coverage2661_g32434 );
				
				half2 Noise_UVs3274_g32434 = ( (ase_worldPos).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g32755 = _NoiseMinValue;
				half Noise_Mask3162_g32434 = saturate( ( ( SAMPLE_TEXTURE2D_LOD( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g32434, 0.0 ).r - temp_output_7_0_g32755 ) / ( _NoiseMaxValue - temp_output_7_0_g32755 ) ) );
				float4 lerpResult2800_g32434 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g32434);
				half3 Noise_Tint2802_g32434 = (lerpResult2800_g32434).rgb;
				float3 vertexToFrag3225_g32434 = Noise_Tint2802_g32434;
				o.ase_texcoord7.xyz = vertexToFrag3225_g32434;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord8 = v.texcoord;
				o.ase_texcoord9 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g32434;
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

				float temp_output_7_0_g32742 = _GradientMinValue;
				float4 lerpResult2779_g32434 = lerp( _GradientColorTwo , _GradientColorOne , saturate( ( ( IN.ase_color.a - temp_output_7_0_g32742 ) / ( ( _GradientMaxValue + _GradientCat ) - temp_output_7_0_g32742 ) ) ));
				half3 Gradient_Tint2784_g32434 = (lerpResult2779_g32434).rgb;
				float3 vertexToFrag3225_g32434 = IN.ase_texcoord7.xyz;
				half2 Noise_UVs3274_g32434 = ( (WorldPosition).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g32755 = _NoiseMinValue;
				half Noise_Mask3162_g32434 = saturate( ( ( SAMPLE_TEXTURE2D( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g32434 ).r - temp_output_7_0_g32755 ) / ( _NoiseMaxValue - temp_output_7_0_g32755 ) ) );
				float4 lerpResult2800_g32434 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g32434);
				half3 Noise_Tint2802_g32434 = (lerpResult2800_g32434).rgb;
				#ifdef TVE_IS_GRASS_SHADER
				float3 staticSwitch3420_g32434 = Noise_Tint2802_g32434;
				#else
				float3 staticSwitch3420_g32434 = vertexToFrag3225_g32434;
				#endif
				half2 Main_UVs15_g32434 = ( ( IN.ase_texcoord8.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g32434 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g32434 );
				float4 temp_output_51_0_g32434 = ( _MainColor * tex2DNode29_g32434 );
				half3 Main_AlbedoRaw99_g32434 = (temp_output_51_0_g32434).rgb;
				half3 Main_AlbedoTinted2808_g32434 = ( Gradient_Tint2784_g32434 * staticSwitch3420_g32434 * Main_AlbedoRaw99_g32434 * float3(1,1,1) );
				float4x4 break19_g32784 = GetObjectToWorldMatrix();
				float3 appendResult20_g32784 = (float3(break19_g32784[ 0 ][ 3 ] , break19_g32784[ 1 ][ 3 ] , break19_g32784[ 2 ][ 3 ]));
				half3 Off19_g32785 = appendResult20_g32784;
				float4 transform68_g32784 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord9);
				float3 appendResult95_g32784 = (float3(IN.ase_texcoord8.z , 0.0 , IN.ase_texcoord8.w));
				float4 transform62_g32784 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord9.xyz - ( appendResult95_g32784 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32784 = ( (transform68_g32784).xyz - (transform62_g32784).xyz );
				half3 On20_g32785 = ObjectPositionWithPivots28_g32784;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32785 = On20_g32785;
				#else
				float3 staticSwitch14_g32785 = Off19_g32785;
				#endif
				half3 ObjectData20_g32786 = staticSwitch14_g32785;
				half3 WorldData19_g32786 = Off19_g32785;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32786 = WorldData19_g32786;
				#else
				float3 staticSwitch14_g32786 = ObjectData20_g32786;
				#endif
				float3 temp_output_42_0_g32784 = staticSwitch14_g32786;
				half3 ObjectData20_g32790 = temp_output_42_0_g32784;
				half3 WorldData19_g32790 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32790 = WorldData19_g32790;
				#else
				float3 staticSwitch14_g32790 = ObjectData20_g32790;
				#endif
				float2 temp_output_35_38_g32783 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32790).xz ) );
				half4 Legacy33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, temp_output_35_38_g32783 );
				half4 Vegetation33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Vegetation, samplerTVE_ColorsTex_Vegetation, temp_output_35_38_g32783 );
				half4 Grass33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Grass, samplerTVE_ColorsTex_Grass, temp_output_35_38_g32783 );
				half4 Objects33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Objects, samplerTVE_ColorsTex_Objects, temp_output_35_38_g32783 );
				half4 Custom33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_User, samplerTVE_ColorsTex_User, temp_output_35_38_g32783 );
				half4 localUSE_BUFFERS33_g32789 = USE_BUFFERS( Legacy33_g32789 , Vegetation33_g32789 , Grass33_g32789 , Objects33_g32789 , Custom33_g32789 );
				float4 temp_output_45_0_g32783 = localUSE_BUFFERS33_g32789;
				half3 Global_ColorsTex_RGB1700_g32434 = (temp_output_45_0_g32783).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g32768 = 2.0;
				#else
				float staticSwitch1_g32768 = 4.594794;
				#endif
				float4 tex2DNode35_g32434 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g32434 );
				half Main_Mask_Raw57_g32434 = tex2DNode35_g32434.b;
				float temp_output_7_0_g32814 = _MainMaskMinValue;
				half Main_Mask_Remap3201_g32434 = saturate( ( ( Main_Mask_Raw57_g32434 - temp_output_7_0_g32814 ) / ( _MainMaskMaxValue - temp_output_7_0_g32814 ) ) );
				float lerpResult2105_g32434 = lerp( 1.0 , Main_Mask_Remap3201_g32434 , _ColorsMaskValue);
				float3 lerpResult108_g32434 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g32434 * staticSwitch1_g32768 ) ) , ( _GlobalColors * lerpResult2105_g32434 ));
				half3 Global_Colors1954_g32434 = lerpResult108_g32434;
				float3 temp_output_123_0_g32434 = ( Main_AlbedoTinted2808_g32434 * Global_Colors1954_g32434 );
				half3 Main_AlbedoColored863_g32434 = temp_output_123_0_g32434;
				half3 Blend_Albedo265_g32434 = Main_AlbedoColored863_g32434;
				float3 lerpResult2929_g32434 = lerp( float3( 1,1,1 ) , (TVE_MainLightParams).rgb , _SubsurfaceLightValue);
				half3 Subsurface_Color1722_g32434 = ( (_SubsurfaceColor).rgb * lerpResult2929_g32434 );
				half Global_ColorsTex_A1701_g32434 = (temp_output_45_0_g32783).w;
				float lerpResult1720_g32434 = lerp( 1.0 , Global_ColorsTex_A1701_g32434 , _GlobalHealthiness);
				half Subsurface_Intensity1752_g32434 = ( ( _SubsurfaceValue * lerpResult1720_g32434 ) + _SubsurfaceCat );
				float lerpResult3210_g32434 = lerp( 1.0 , Main_Mask_Remap3201_g32434 , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g32434 = lerpResult3210_g32434;
				half3 Subsurface_Transmission884_g32434 = ( Subsurface_Color1722_g32434 * Subsurface_Intensity1752_g32434 * Subsurface_Mask1557_g32434 );
				float3 normalizeResult1983_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g32434 = dot( -TVE_MainLightDirection , normalizeResult1983_g32434 );
				float saferPower1624_g32434 = max( (dotResult785_g32434*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g32434 = 0.0;
				#else
				float staticSwitch1602_g32434 = ( pow( saferPower1624_g32434 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g32434 = staticSwitch1602_g32434;
				half3 Subsurface_Deferred1693_g32434 = ( Subsurface_Transmission884_g32434 * Mask_Subsurface_View782_g32434 );
				half3 Blend_AlbedoAndSubsurface149_g32434 = ( Blend_Albedo265_g32434 + Subsurface_Deferred1693_g32434 );
				half3 Global_OverlayColor1758_g32434 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g32434 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g32434 );
				float2 appendResult88_g32731 = (float2(tex2DNode117_g32434.a , tex2DNode117_g32434.g));
				float2 temp_output_90_0_g32731 = ( (appendResult88_g32731*2.0 + -1.0) * _MainNormalValue );
				float2 break93_g32731 = temp_output_90_0_g32731;
				half Main_NormalY2095_g32434 = break93_g32731.y;
				half Overlay_Contrast1405_g32434 = _OverlayContrastValue;
				half Global_OverlayIntensity154_g32434 = TVE_OverlayIntensity;
				float4x4 break19_g32749 = GetObjectToWorldMatrix();
				float3 appendResult20_g32749 = (float3(break19_g32749[ 0 ][ 3 ] , break19_g32749[ 1 ][ 3 ] , break19_g32749[ 2 ][ 3 ]));
				half3 Off19_g32750 = appendResult20_g32749;
				float4 transform68_g32749 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord9);
				float3 appendResult95_g32749 = (float3(IN.ase_texcoord8.z , 0.0 , IN.ase_texcoord8.w));
				float4 transform62_g32749 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord9.xyz - ( appendResult95_g32749 * _vertex_pivot_mode ) ) , 0.0 ));
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
				half Global_ExtrasTex_B156_g32434 = break49_g32746.z;
				float temp_output_1025_0_g32434 = ( Global_OverlayIntensity154_g32434 * _GlobalOverlay * Global_ExtrasTex_B156_g32434 );
				half Overlay_Commons1365_g32434 = temp_output_1025_0_g32434;
				half Overlay_Mask269_g32434 = saturate( ( saturate( ( IN.ase_color.a + ( Main_NormalY2095_g32434 * Overlay_Contrast1405_g32434 ) ) ) - ( 1.0 - Overlay_Commons1365_g32434 ) ) );
				float3 lerpResult336_g32434 = lerp( Blend_AlbedoAndSubsurface149_g32434 , Global_OverlayColor1758_g32434 , Overlay_Mask269_g32434);
				half3 Final_Albedo359_g32434 = lerpResult336_g32434;
				half Main_Alpha316_g32434 = (temp_output_51_0_g32434).a;
				float lerpResult354_g32434 = lerp( 1.0 , Main_Alpha316_g32434 , _render_premul);
				half Final_Premultiply355_g32434 = lerpResult354_g32434;
				float3 temp_output_410_0_g32434 = ( Final_Albedo359_g32434 * Final_Premultiply355_g32434 );
				
				float3 appendResult91_g32731 = (float3(temp_output_90_0_g32731 , 1.0));
				half3 Main_Normal137_g32434 = appendResult91_g32731;
				float3 temp_output_13_0_g32745 = Main_Normal137_g32434;
				float3 switchResult12_g32745 = (((ase_vface>0)?(temp_output_13_0_g32745):(( temp_output_13_0_g32745 * _render_normals_options ))));
				half3 Blend_Normal312_g32434 = switchResult12_g32745;
				half3 Final_Normal366_g32434 = Blend_Normal312_g32434;
				
				half Main_Metallic237_g32434 = ( tex2DNode35_g32434.r * _MainMetallicValue );
				half Blend_Metallic306_g32434 = Main_Metallic237_g32434;
				float lerpResult342_g32434 = lerp( Blend_Metallic306_g32434 , 0.0 , Overlay_Mask269_g32434);
				half Final_Metallic367_g32434 = lerpResult342_g32434;
				
				half Main_Smoothness227_g32434 = ( tex2DNode35_g32434.a * _MainSmoothnessValue );
				half Blend_Smoothness314_g32434 = Main_Smoothness227_g32434;
				half Global_OverlaySmoothness311_g32434 = TVE_OverlaySmoothness;
				float lerpResult343_g32434 = lerp( Blend_Smoothness314_g32434 , Global_OverlaySmoothness311_g32434 , Overlay_Mask269_g32434);
				half Final_Smoothness371_g32434 = lerpResult343_g32434;
				half Global_Wetness1016_g32434 = ( TVE_Wetness * _GlobalWetness );
				half Global_ExtrasTex_A1033_g32434 = break49_g32746.w;
				float lerpResult1037_g32434 = lerp( Final_Smoothness371_g32434 , saturate( ( Final_Smoothness371_g32434 + Global_Wetness1016_g32434 ) ) , Global_ExtrasTex_A1033_g32434);
				
				float lerpResult240_g32434 = lerp( 1.0 , tex2DNode35_g32434.g , _MainOcclusionValue);
				half Main_Occlusion247_g32434 = lerpResult240_g32434;
				half Blend_Occlusion323_g32434 = Main_Occlusion247_g32434;
				
				float localCustomAlphaClip9_g32759 = ( 0.0 );
				half Main_AlphaRaw1203_g32434 = tex2DNode29_g32434.a;
				float3 normalizeResult2169_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal2274_g32434 = half3(0.001,0.001,1);
				float3 worldNormal2274_g32434 = float3(dot(tanToWorld0,tanNormal2274_g32434), dot(tanToWorld1,tanNormal2274_g32434), dot(tanToWorld2,tanNormal2274_g32434));
				float dotResult2161_g32434 = dot( normalizeResult2169_g32434 , worldNormal2274_g32434 );
				float3 normalizeResult2210_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult2212_g32434 = dot( normalizeResult2210_g32434 , float3(0,1,0) );
				half Mask_HView2656_g32434 = abs( dotResult2212_g32434 );
				float lerpResult2221_g32434 = lerp( _BillboardFadeHValue , _BillboardFadeVValue , Mask_HView2656_g32434);
				half Billboard_Fade2175_g32434 = ( pow( ( dotResult2161_g32434 * dotResult2161_g32434 ) , lerpResult2221_g32434 ) + _BillboardCat );
				half Alpha5_g32759 = ( Main_AlphaRaw1203_g32434 * Billboard_Fade2175_g32434 );
				float Alpha9_g32759 = Alpha5_g32759;
				#if _ALPHATEST_ON
				clip(Alpha9_g32759 - _Cutoff);
				#endif
				half Final_Clip914_g32434 = localCustomAlphaClip9_g32759;
				
				float3 Albedo = temp_output_410_0_g32434;
				float3 Normal = Final_Normal366_g32434;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = Final_Metallic367_g32434;
				float Smoothness = lerpResult1037_g32434;
				float Occlusion = Blend_Occlusion323_g32434;
				float Alpha = Main_Alpha316_g32434;
				float AlphaClipThreshold = Final_Clip914_g32434;
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#define TVE_IS_VEGETATION_SHADER
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NoiseTintOne;
			float4 _Color;
			half4 _MainColor;
			half4 _MainUVs;
			float4 _LocalColors;
			half4 _GradientColorOne;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			half4 _GradientColorTwo;
			half4 _NoiseTintTwo;
			half3 _render_normals_options;
			half _GradientCat;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _LocalSize;
			half _GlobalSizeFade;
			half _VertexDataMode;
			half _VertexMotionMode;
			half _VertexMotionSpace;
			half _VertexCat;
			half _InteractionVariation;
			half _Motion_Interaction;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _Motion_10;
			half _GlobalSize;
			half _IsLitShader;
			half _NoiseMaxValue;
			half _MoiseCat;
			half _BillboardFadeHValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _render_premul;
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
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _GlobalColors;
			half _vertex_pivot_mode;
			half _NoiseMinValue;
			half _NoiseScaleValue;
			half _MotionAmplitude_10;
			half _ObjectDataMessage;
			half _BatchingMessage;
			half _MainCat;
			half _DetailMode;
			half _DetailMapsMode;
			half _GlobalCat;
			half _RenderMode;
			half _VertexVariationMode;
			half _RenderPriority;
			half _IsVersion;
			half _IsTVEShader;
			half _RenderingCat;
			half _RenderCull;
			half _Cutoff;
			half _MainNormalValue;
			half _render_zw;
			half _Banner;
			half _render_cull;
			half _render_cutoff;
			half _render_dst;
			half _render_src;
			half _IsCrossShader;
			half _IsStandardShader;
			half _IsAnyPathShader;
			half _RenderClip;
			half _RenderNormals;
			half _RenderBlend;
			half _RenderZWrite;
			half _BillboardFadeVValue;
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
			float _render_normals;
			half _GlobalSpace;
			half _DetailSpace;
			half _PivotsMessage;
			half _DetailTypeMode;
			half _AdvancedCat;
			half _DetailCat;
			float _OverlayContrast;
			half _BillboardCat;
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
				half3 Mesh_PivotsOS2291_g32434 = _Vector1;
				float3 temp_output_2283_0_g32434 = ( v.vertex.xyz - Mesh_PivotsOS2291_g32434 );
				half3 VertexPos40_g32740 = temp_output_2283_0_g32434;
				float3 appendResult74_g32740 = (float3(VertexPos40_g32740.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g32740 = appendResult74_g32740;
				float3 break84_g32740 = VertexPos40_g32740;
				float3 appendResult81_g32740 = (float3(0.0 , break84_g32740.y , break84_g32740.z));
				half3 VertexPosOtherAxis82_g32740 = appendResult81_g32740;
				float ObjectData20_g32815 = 3.14;
				float Bounds_Height374_g32434 = _MaxBoundsInfo.y;
				float WorldData19_g32815 = ( Bounds_Height374_g32434 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32815 = WorldData19_g32815;
				#else
				float staticSwitch14_g32815 = ObjectData20_g32815;
				#endif
				float Motion_Max_Bending1133_g32434 = staticSwitch14_g32815;
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
				half Wind_Power_103106_g32434 = Wind_Power369_g32778;
				float3 appendResult323_g32778 = (float3(break322_g32778.x , 0.0 , break322_g32778.y));
				float3 temp_output_324_0_g32778 = (appendResult323_g32778*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g32778 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g32778 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g32434 = (temp_output_339_0_g32778).xz;
				half Motion_Use1056_g32434 = _Motion_10;
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
				float4 temp_cast_9 = (TVE_NoiseContrast).xxxx;
				float4 break142_g32799 = pow( saferPower77_g32799 , temp_cast_9 );
				half Global_NoiseTex_R34_g32434 = break142_g32799.r;
				half Input_Speed62_g32735 = _MotionSpeed_10;
				float mulTime373_g32735 = _TimeParameters.x * Input_Speed62_g32735;
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
				half Variation3073_g32434 = staticSwitch14_g32762;
				half Motion_Variation284_g32735 = ( _MotionVariation_10 * Variation3073_g32434 );
				float2 appendResult344_g32735 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g32735 = ( _MotionScale_10 * appendResult344_g32735 );
				half2 Sine_MinusOneToOne281_g32735 = sin( ( mulTime373_g32735 + Motion_Variation284_g32735 + Motion_Scale287_g32735 ) );
				float2 temp_cast_11 = (1.0).xx;
				half Input_Turbulence327_g32735 = Global_NoiseTex_R34_g32434;
				float2 lerpResult321_g32735 = lerp( Sine_MinusOneToOne281_g32735 , temp_cast_11 , Input_Turbulence327_g32735);
				half2 Motion_Bending2258_g32434 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g32434 ) * Wind_Power_103106_g32434 * Wind_DirectionOS39_g32434 * Motion_Use1056_g32434 * Global_NoiseTex_R34_g32434 * lerpResult321_g32735 );
				half Motion_UseInteraction2097_g32434 = _Motion_Interaction;
				half Motion_InteractionMask66_g32434 = break322_g32778.w;
				float lerpResult3307_g32434 = lerp( 1.0 , Variation3073_g32434 , _InteractionVariation);
				half2 Motion_Interaction53_g32434 = ( _InteractionAmplitude * Motion_Max_Bending1133_g32434 * Motion_UseInteraction2097_g32434 * Motion_InteractionMask66_g32434 * Motion_InteractionMask66_g32434 * Wind_DirectionOS39_g32434 * lerpResult3307_g32434 );
				float2 lerpResult109_g32434 = lerp( Motion_Bending2258_g32434 , Motion_Interaction53_g32434 , Motion_InteractionMask66_g32434);
				half Mesh_Motion_182_g32434 = v.ase_texcoord3.x;
				float2 break143_g32434 = ( lerpResult109_g32434 * Mesh_Motion_182_g32434 );
				half Motion_Z190_g32434 = break143_g32434.y;
				half Angle44_g32740 = Motion_Z190_g32434;
				half3 VertexPos40_g32723 = ( VertexPosRotationAxis50_g32740 + ( VertexPosOtherAxis82_g32740 * cos( Angle44_g32740 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g32740 ) * sin( Angle44_g32740 ) ) );
				float3 appendResult74_g32723 = (float3(0.0 , 0.0 , VertexPos40_g32723.z));
				half3 VertexPosRotationAxis50_g32723 = appendResult74_g32723;
				float3 break84_g32723 = VertexPos40_g32723;
				float3 appendResult81_g32723 = (float3(break84_g32723.x , break84_g32723.y , 0.0));
				half3 VertexPosOtherAxis82_g32723 = appendResult81_g32723;
				half Motion_X216_g32434 = break143_g32434.x;
				half Angle44_g32723 = -Motion_X216_g32434;
				half Wind_Mode3167_g32434 = TVE_WindMode;
				float3 lerpResult3168_g32434 = lerp( v.vertex.xyz , ( VertexPosRotationAxis50_g32723 + ( VertexPosOtherAxis82_g32723 * cos( Angle44_g32723 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g32723 ) * sin( Angle44_g32723 ) ) ) , Wind_Mode3167_g32434);
				float3 Vertex_Motion_Object833_g32434 = lerpResult3168_g32434;
				float3 temp_output_3474_0_g32434 = ( v.vertex.xyz - Mesh_PivotsOS2291_g32434 );
				float3 appendResult2043_g32434 = (float3(Motion_X216_g32434 , 0.0 , Motion_Z190_g32434));
				float3 lerpResult3173_g32434 = lerp( v.vertex.xyz , ( temp_output_3474_0_g32434 + appendResult2043_g32434 ) , Wind_Mode3167_g32434);
				float3 Vertex_Motion_World1118_g32434 = lerpResult3173_g32434;
				float3 temp_output_3331_0_g32434 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g32434 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g32434 = Vertex_Motion_Object833_g32434;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g32434 = temp_output_3331_0_g32434;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g32434 = temp_output_3331_0_g32434;
				#else
				float3 staticSwitch3312_g32434 = Vertex_Motion_Object833_g32434;
				#endif
				half3 ObjectData20_g32782 = staticSwitch3312_g32434;
				half3 WorldData19_g32782 = Vertex_Motion_World1118_g32434;
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
				float Vertex_SizeFade1740_g32434 = staticSwitch14_g32780;
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
				half Global_ExtrasTex_G305_g32434 = break49_g32746.y;
				float lerpResult346_g32434 = lerp( 1.0 , Global_ExtrasTex_G305_g32434 , _GlobalSize);
				float ObjectData20_g32781 = ( lerpResult346_g32434 * _LocalSize );
				float WorldData19_g32781 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32781 = WorldData19_g32781;
				#else
				float staticSwitch14_g32781 = ObjectData20_g32781;
				#endif
				half Vertex_Size1741_g32434 = staticSwitch14_g32781;
				half3 Grass_Coverage2661_g32434 = half3(0,0,0);
				float3 Final_VertexPosition890_g32434 = ( ( staticSwitch14_g32782 * Vertex_SizeFade1740_g32434 * Vertex_Size1741_g32434 ) + Mesh_PivotsOS2291_g32434 + Grass_Coverage2661_g32434 );
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2 = v.ase_texcoord;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g32434;
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

				half2 Main_UVs15_g32434 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g32434 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g32434 );
				float4 temp_output_51_0_g32434 = ( _MainColor * tex2DNode29_g32434 );
				half Main_Alpha316_g32434 = (temp_output_51_0_g32434).a;
				
				float localCustomAlphaClip9_g32759 = ( 0.0 );
				half Main_AlphaRaw1203_g32434 = tex2DNode29_g32434.a;
				float3 normalizeResult2169_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal2274_g32434 = half3(0.001,0.001,1);
				float3 worldNormal2274_g32434 = float3(dot(tanToWorld0,tanNormal2274_g32434), dot(tanToWorld1,tanNormal2274_g32434), dot(tanToWorld2,tanNormal2274_g32434));
				float dotResult2161_g32434 = dot( normalizeResult2169_g32434 , worldNormal2274_g32434 );
				float3 normalizeResult2210_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult2212_g32434 = dot( normalizeResult2210_g32434 , float3(0,1,0) );
				half Mask_HView2656_g32434 = abs( dotResult2212_g32434 );
				float lerpResult2221_g32434 = lerp( _BillboardFadeHValue , _BillboardFadeVValue , Mask_HView2656_g32434);
				half Billboard_Fade2175_g32434 = ( pow( ( dotResult2161_g32434 * dotResult2161_g32434 ) , lerpResult2221_g32434 ) + _BillboardCat );
				half Alpha5_g32759 = ( Main_AlphaRaw1203_g32434 * Billboard_Fade2175_g32434 );
				float Alpha9_g32759 = Alpha5_g32759;
				#if _ALPHATEST_ON
				clip(Alpha9_g32759 - _Cutoff);
				#endif
				half Final_Clip914_g32434 = localCustomAlphaClip9_g32759;
				
				float Alpha = Main_Alpha316_g32434;
				float AlphaClipThreshold = Final_Clip914_g32434;
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#define TVE_IS_VEGETATION_SHADER
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NoiseTintOne;
			float4 _Color;
			half4 _MainColor;
			half4 _MainUVs;
			float4 _LocalColors;
			half4 _GradientColorOne;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			half4 _GradientColorTwo;
			half4 _NoiseTintTwo;
			half3 _render_normals_options;
			half _GradientCat;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _LocalSize;
			half _GlobalSizeFade;
			half _VertexDataMode;
			half _VertexMotionMode;
			half _VertexMotionSpace;
			half _VertexCat;
			half _InteractionVariation;
			half _Motion_Interaction;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _Motion_10;
			half _GlobalSize;
			half _IsLitShader;
			half _NoiseMaxValue;
			half _MoiseCat;
			half _BillboardFadeHValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _render_premul;
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
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _GlobalColors;
			half _vertex_pivot_mode;
			half _NoiseMinValue;
			half _NoiseScaleValue;
			half _MotionAmplitude_10;
			half _ObjectDataMessage;
			half _BatchingMessage;
			half _MainCat;
			half _DetailMode;
			half _DetailMapsMode;
			half _GlobalCat;
			half _RenderMode;
			half _VertexVariationMode;
			half _RenderPriority;
			half _IsVersion;
			half _IsTVEShader;
			half _RenderingCat;
			half _RenderCull;
			half _Cutoff;
			half _MainNormalValue;
			half _render_zw;
			half _Banner;
			half _render_cull;
			half _render_cutoff;
			half _render_dst;
			half _render_src;
			half _IsCrossShader;
			half _IsStandardShader;
			half _IsAnyPathShader;
			half _RenderClip;
			half _RenderNormals;
			half _RenderBlend;
			half _RenderZWrite;
			half _BillboardFadeVValue;
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
			float _render_normals;
			half _GlobalSpace;
			half _DetailSpace;
			half _PivotsMessage;
			half _DetailTypeMode;
			half _AdvancedCat;
			half _DetailCat;
			float _OverlayContrast;
			half _BillboardCat;
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
				half3 Mesh_PivotsOS2291_g32434 = _Vector1;
				float3 temp_output_2283_0_g32434 = ( v.vertex.xyz - Mesh_PivotsOS2291_g32434 );
				half3 VertexPos40_g32740 = temp_output_2283_0_g32434;
				float3 appendResult74_g32740 = (float3(VertexPos40_g32740.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g32740 = appendResult74_g32740;
				float3 break84_g32740 = VertexPos40_g32740;
				float3 appendResult81_g32740 = (float3(0.0 , break84_g32740.y , break84_g32740.z));
				half3 VertexPosOtherAxis82_g32740 = appendResult81_g32740;
				float ObjectData20_g32815 = 3.14;
				float Bounds_Height374_g32434 = _MaxBoundsInfo.y;
				float WorldData19_g32815 = ( Bounds_Height374_g32434 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32815 = WorldData19_g32815;
				#else
				float staticSwitch14_g32815 = ObjectData20_g32815;
				#endif
				float Motion_Max_Bending1133_g32434 = staticSwitch14_g32815;
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
				half Wind_Power_103106_g32434 = Wind_Power369_g32778;
				float3 appendResult323_g32778 = (float3(break322_g32778.x , 0.0 , break322_g32778.y));
				float3 temp_output_324_0_g32778 = (appendResult323_g32778*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g32778 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g32778 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g32434 = (temp_output_339_0_g32778).xz;
				half Motion_Use1056_g32434 = _Motion_10;
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
				float4 temp_cast_9 = (TVE_NoiseContrast).xxxx;
				float4 break142_g32799 = pow( saferPower77_g32799 , temp_cast_9 );
				half Global_NoiseTex_R34_g32434 = break142_g32799.r;
				half Input_Speed62_g32735 = _MotionSpeed_10;
				float mulTime373_g32735 = _TimeParameters.x * Input_Speed62_g32735;
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
				half Variation3073_g32434 = staticSwitch14_g32762;
				half Motion_Variation284_g32735 = ( _MotionVariation_10 * Variation3073_g32434 );
				float2 appendResult344_g32735 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g32735 = ( _MotionScale_10 * appendResult344_g32735 );
				half2 Sine_MinusOneToOne281_g32735 = sin( ( mulTime373_g32735 + Motion_Variation284_g32735 + Motion_Scale287_g32735 ) );
				float2 temp_cast_11 = (1.0).xx;
				half Input_Turbulence327_g32735 = Global_NoiseTex_R34_g32434;
				float2 lerpResult321_g32735 = lerp( Sine_MinusOneToOne281_g32735 , temp_cast_11 , Input_Turbulence327_g32735);
				half2 Motion_Bending2258_g32434 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g32434 ) * Wind_Power_103106_g32434 * Wind_DirectionOS39_g32434 * Motion_Use1056_g32434 * Global_NoiseTex_R34_g32434 * lerpResult321_g32735 );
				half Motion_UseInteraction2097_g32434 = _Motion_Interaction;
				half Motion_InteractionMask66_g32434 = break322_g32778.w;
				float lerpResult3307_g32434 = lerp( 1.0 , Variation3073_g32434 , _InteractionVariation);
				half2 Motion_Interaction53_g32434 = ( _InteractionAmplitude * Motion_Max_Bending1133_g32434 * Motion_UseInteraction2097_g32434 * Motion_InteractionMask66_g32434 * Motion_InteractionMask66_g32434 * Wind_DirectionOS39_g32434 * lerpResult3307_g32434 );
				float2 lerpResult109_g32434 = lerp( Motion_Bending2258_g32434 , Motion_Interaction53_g32434 , Motion_InteractionMask66_g32434);
				half Mesh_Motion_182_g32434 = v.ase_texcoord3.x;
				float2 break143_g32434 = ( lerpResult109_g32434 * Mesh_Motion_182_g32434 );
				half Motion_Z190_g32434 = break143_g32434.y;
				half Angle44_g32740 = Motion_Z190_g32434;
				half3 VertexPos40_g32723 = ( VertexPosRotationAxis50_g32740 + ( VertexPosOtherAxis82_g32740 * cos( Angle44_g32740 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g32740 ) * sin( Angle44_g32740 ) ) );
				float3 appendResult74_g32723 = (float3(0.0 , 0.0 , VertexPos40_g32723.z));
				half3 VertexPosRotationAxis50_g32723 = appendResult74_g32723;
				float3 break84_g32723 = VertexPos40_g32723;
				float3 appendResult81_g32723 = (float3(break84_g32723.x , break84_g32723.y , 0.0));
				half3 VertexPosOtherAxis82_g32723 = appendResult81_g32723;
				half Motion_X216_g32434 = break143_g32434.x;
				half Angle44_g32723 = -Motion_X216_g32434;
				half Wind_Mode3167_g32434 = TVE_WindMode;
				float3 lerpResult3168_g32434 = lerp( v.vertex.xyz , ( VertexPosRotationAxis50_g32723 + ( VertexPosOtherAxis82_g32723 * cos( Angle44_g32723 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g32723 ) * sin( Angle44_g32723 ) ) ) , Wind_Mode3167_g32434);
				float3 Vertex_Motion_Object833_g32434 = lerpResult3168_g32434;
				float3 temp_output_3474_0_g32434 = ( v.vertex.xyz - Mesh_PivotsOS2291_g32434 );
				float3 appendResult2043_g32434 = (float3(Motion_X216_g32434 , 0.0 , Motion_Z190_g32434));
				float3 lerpResult3173_g32434 = lerp( v.vertex.xyz , ( temp_output_3474_0_g32434 + appendResult2043_g32434 ) , Wind_Mode3167_g32434);
				float3 Vertex_Motion_World1118_g32434 = lerpResult3173_g32434;
				float3 temp_output_3331_0_g32434 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g32434 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g32434 = Vertex_Motion_Object833_g32434;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g32434 = temp_output_3331_0_g32434;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g32434 = temp_output_3331_0_g32434;
				#else
				float3 staticSwitch3312_g32434 = Vertex_Motion_Object833_g32434;
				#endif
				half3 ObjectData20_g32782 = staticSwitch3312_g32434;
				half3 WorldData19_g32782 = Vertex_Motion_World1118_g32434;
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
				float Vertex_SizeFade1740_g32434 = staticSwitch14_g32780;
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
				half Global_ExtrasTex_G305_g32434 = break49_g32746.y;
				float lerpResult346_g32434 = lerp( 1.0 , Global_ExtrasTex_G305_g32434 , _GlobalSize);
				float ObjectData20_g32781 = ( lerpResult346_g32434 * _LocalSize );
				float WorldData19_g32781 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32781 = WorldData19_g32781;
				#else
				float staticSwitch14_g32781 = ObjectData20_g32781;
				#endif
				half Vertex_Size1741_g32434 = staticSwitch14_g32781;
				half3 Grass_Coverage2661_g32434 = half3(0,0,0);
				float3 Final_VertexPosition890_g32434 = ( ( staticSwitch14_g32782 * Vertex_SizeFade1740_g32434 * Vertex_Size1741_g32434 ) + Mesh_PivotsOS2291_g32434 + Grass_Coverage2661_g32434 );
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2 = v.ase_texcoord;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g32434;
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

				half2 Main_UVs15_g32434 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g32434 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g32434 );
				float4 temp_output_51_0_g32434 = ( _MainColor * tex2DNode29_g32434 );
				half Main_Alpha316_g32434 = (temp_output_51_0_g32434).a;
				
				float localCustomAlphaClip9_g32759 = ( 0.0 );
				half Main_AlphaRaw1203_g32434 = tex2DNode29_g32434.a;
				float3 normalizeResult2169_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal2274_g32434 = half3(0.001,0.001,1);
				float3 worldNormal2274_g32434 = float3(dot(tanToWorld0,tanNormal2274_g32434), dot(tanToWorld1,tanNormal2274_g32434), dot(tanToWorld2,tanNormal2274_g32434));
				float dotResult2161_g32434 = dot( normalizeResult2169_g32434 , worldNormal2274_g32434 );
				float3 normalizeResult2210_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult2212_g32434 = dot( normalizeResult2210_g32434 , float3(0,1,0) );
				half Mask_HView2656_g32434 = abs( dotResult2212_g32434 );
				float lerpResult2221_g32434 = lerp( _BillboardFadeHValue , _BillboardFadeVValue , Mask_HView2656_g32434);
				half Billboard_Fade2175_g32434 = ( pow( ( dotResult2161_g32434 * dotResult2161_g32434 ) , lerpResult2221_g32434 ) + _BillboardCat );
				half Alpha5_g32759 = ( Main_AlphaRaw1203_g32434 * Billboard_Fade2175_g32434 );
				float Alpha9_g32759 = Alpha5_g32759;
				#if _ALPHATEST_ON
				clip(Alpha9_g32759 - _Cutoff);
				#endif
				half Final_Clip914_g32434 = localCustomAlphaClip9_g32759;
				
				float Alpha = Main_Alpha316_g32434;
				float AlphaClipThreshold = Final_Clip914_g32434;

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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#define TVE_IS_VEGETATION_SHADER
			  
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
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NoiseTintOne;
			float4 _Color;
			half4 _MainColor;
			half4 _MainUVs;
			float4 _LocalColors;
			half4 _GradientColorOne;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			half4 _GradientColorTwo;
			half4 _NoiseTintTwo;
			half3 _render_normals_options;
			half _GradientCat;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _LocalSize;
			half _GlobalSizeFade;
			half _VertexDataMode;
			half _VertexMotionMode;
			half _VertexMotionSpace;
			half _VertexCat;
			half _InteractionVariation;
			half _Motion_Interaction;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _Motion_10;
			half _GlobalSize;
			half _IsLitShader;
			half _NoiseMaxValue;
			half _MoiseCat;
			half _BillboardFadeHValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _render_premul;
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
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _GlobalColors;
			half _vertex_pivot_mode;
			half _NoiseMinValue;
			half _NoiseScaleValue;
			half _MotionAmplitude_10;
			half _ObjectDataMessage;
			half _BatchingMessage;
			half _MainCat;
			half _DetailMode;
			half _DetailMapsMode;
			half _GlobalCat;
			half _RenderMode;
			half _VertexVariationMode;
			half _RenderPriority;
			half _IsVersion;
			half _IsTVEShader;
			half _RenderingCat;
			half _RenderCull;
			half _Cutoff;
			half _MainNormalValue;
			half _render_zw;
			half _Banner;
			half _render_cull;
			half _render_cutoff;
			half _render_dst;
			half _render_src;
			half _IsCrossShader;
			half _IsStandardShader;
			half _IsAnyPathShader;
			half _RenderClip;
			half _RenderNormals;
			half _RenderBlend;
			half _RenderZWrite;
			half _BillboardFadeVValue;
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
			float _render_normals;
			half _GlobalSpace;
			half _DetailSpace;
			half _PivotsMessage;
			half _DetailTypeMode;
			half _AdvancedCat;
			half _DetailCat;
			float _OverlayContrast;
			half _BillboardCat;
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
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_MainMaskTex);
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
				half3 Mesh_PivotsOS2291_g32434 = _Vector1;
				float3 temp_output_2283_0_g32434 = ( v.vertex.xyz - Mesh_PivotsOS2291_g32434 );
				half3 VertexPos40_g32740 = temp_output_2283_0_g32434;
				float3 appendResult74_g32740 = (float3(VertexPos40_g32740.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g32740 = appendResult74_g32740;
				float3 break84_g32740 = VertexPos40_g32740;
				float3 appendResult81_g32740 = (float3(0.0 , break84_g32740.y , break84_g32740.z));
				half3 VertexPosOtherAxis82_g32740 = appendResult81_g32740;
				float ObjectData20_g32815 = 3.14;
				float Bounds_Height374_g32434 = _MaxBoundsInfo.y;
				float WorldData19_g32815 = ( Bounds_Height374_g32434 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32815 = WorldData19_g32815;
				#else
				float staticSwitch14_g32815 = ObjectData20_g32815;
				#endif
				float Motion_Max_Bending1133_g32434 = staticSwitch14_g32815;
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
				half Wind_Power_103106_g32434 = Wind_Power369_g32778;
				float3 appendResult323_g32778 = (float3(break322_g32778.x , 0.0 , break322_g32778.y));
				float3 temp_output_324_0_g32778 = (appendResult323_g32778*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g32778 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g32778 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g32434 = (temp_output_339_0_g32778).xz;
				half Motion_Use1056_g32434 = _Motion_10;
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
				float4 temp_cast_9 = (TVE_NoiseContrast).xxxx;
				float4 break142_g32799 = pow( saferPower77_g32799 , temp_cast_9 );
				half Global_NoiseTex_R34_g32434 = break142_g32799.r;
				half Input_Speed62_g32735 = _MotionSpeed_10;
				float mulTime373_g32735 = _TimeParameters.x * Input_Speed62_g32735;
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
				half Variation3073_g32434 = staticSwitch14_g32762;
				half Motion_Variation284_g32735 = ( _MotionVariation_10 * Variation3073_g32434 );
				float2 appendResult344_g32735 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g32735 = ( _MotionScale_10 * appendResult344_g32735 );
				half2 Sine_MinusOneToOne281_g32735 = sin( ( mulTime373_g32735 + Motion_Variation284_g32735 + Motion_Scale287_g32735 ) );
				float2 temp_cast_11 = (1.0).xx;
				half Input_Turbulence327_g32735 = Global_NoiseTex_R34_g32434;
				float2 lerpResult321_g32735 = lerp( Sine_MinusOneToOne281_g32735 , temp_cast_11 , Input_Turbulence327_g32735);
				half2 Motion_Bending2258_g32434 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g32434 ) * Wind_Power_103106_g32434 * Wind_DirectionOS39_g32434 * Motion_Use1056_g32434 * Global_NoiseTex_R34_g32434 * lerpResult321_g32735 );
				half Motion_UseInteraction2097_g32434 = _Motion_Interaction;
				half Motion_InteractionMask66_g32434 = break322_g32778.w;
				float lerpResult3307_g32434 = lerp( 1.0 , Variation3073_g32434 , _InteractionVariation);
				half2 Motion_Interaction53_g32434 = ( _InteractionAmplitude * Motion_Max_Bending1133_g32434 * Motion_UseInteraction2097_g32434 * Motion_InteractionMask66_g32434 * Motion_InteractionMask66_g32434 * Wind_DirectionOS39_g32434 * lerpResult3307_g32434 );
				float2 lerpResult109_g32434 = lerp( Motion_Bending2258_g32434 , Motion_Interaction53_g32434 , Motion_InteractionMask66_g32434);
				half Mesh_Motion_182_g32434 = v.ase_texcoord3.x;
				float2 break143_g32434 = ( lerpResult109_g32434 * Mesh_Motion_182_g32434 );
				half Motion_Z190_g32434 = break143_g32434.y;
				half Angle44_g32740 = Motion_Z190_g32434;
				half3 VertexPos40_g32723 = ( VertexPosRotationAxis50_g32740 + ( VertexPosOtherAxis82_g32740 * cos( Angle44_g32740 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g32740 ) * sin( Angle44_g32740 ) ) );
				float3 appendResult74_g32723 = (float3(0.0 , 0.0 , VertexPos40_g32723.z));
				half3 VertexPosRotationAxis50_g32723 = appendResult74_g32723;
				float3 break84_g32723 = VertexPos40_g32723;
				float3 appendResult81_g32723 = (float3(break84_g32723.x , break84_g32723.y , 0.0));
				half3 VertexPosOtherAxis82_g32723 = appendResult81_g32723;
				half Motion_X216_g32434 = break143_g32434.x;
				half Angle44_g32723 = -Motion_X216_g32434;
				half Wind_Mode3167_g32434 = TVE_WindMode;
				float3 lerpResult3168_g32434 = lerp( v.vertex.xyz , ( VertexPosRotationAxis50_g32723 + ( VertexPosOtherAxis82_g32723 * cos( Angle44_g32723 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g32723 ) * sin( Angle44_g32723 ) ) ) , Wind_Mode3167_g32434);
				float3 Vertex_Motion_Object833_g32434 = lerpResult3168_g32434;
				float3 temp_output_3474_0_g32434 = ( v.vertex.xyz - Mesh_PivotsOS2291_g32434 );
				float3 appendResult2043_g32434 = (float3(Motion_X216_g32434 , 0.0 , Motion_Z190_g32434));
				float3 lerpResult3173_g32434 = lerp( v.vertex.xyz , ( temp_output_3474_0_g32434 + appendResult2043_g32434 ) , Wind_Mode3167_g32434);
				float3 Vertex_Motion_World1118_g32434 = lerpResult3173_g32434;
				float3 temp_output_3331_0_g32434 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g32434 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g32434 = Vertex_Motion_Object833_g32434;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g32434 = temp_output_3331_0_g32434;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g32434 = temp_output_3331_0_g32434;
				#else
				float3 staticSwitch3312_g32434 = Vertex_Motion_Object833_g32434;
				#endif
				half3 ObjectData20_g32782 = staticSwitch3312_g32434;
				half3 WorldData19_g32782 = Vertex_Motion_World1118_g32434;
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
				float Vertex_SizeFade1740_g32434 = staticSwitch14_g32780;
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
				half Global_ExtrasTex_G305_g32434 = break49_g32746.y;
				float lerpResult346_g32434 = lerp( 1.0 , Global_ExtrasTex_G305_g32434 , _GlobalSize);
				float ObjectData20_g32781 = ( lerpResult346_g32434 * _LocalSize );
				float WorldData19_g32781 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32781 = WorldData19_g32781;
				#else
				float staticSwitch14_g32781 = ObjectData20_g32781;
				#endif
				half Vertex_Size1741_g32434 = staticSwitch14_g32781;
				half3 Grass_Coverage2661_g32434 = half3(0,0,0);
				float3 Final_VertexPosition890_g32434 = ( ( staticSwitch14_g32782 * Vertex_SizeFade1740_g32434 * Vertex_Size1741_g32434 ) + Mesh_PivotsOS2291_g32434 + Grass_Coverage2661_g32434 );
				
				half2 Noise_UVs3274_g32434 = ( (ase_worldPos).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g32755 = _NoiseMinValue;
				half Noise_Mask3162_g32434 = saturate( ( ( SAMPLE_TEXTURE2D_LOD( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g32434, 0.0 ).r - temp_output_7_0_g32755 ) / ( _NoiseMaxValue - temp_output_7_0_g32755 ) ) );
				float4 lerpResult2800_g32434 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g32434);
				half3 Noise_Tint2802_g32434 = (lerpResult2800_g32434).rgb;
				float3 vertexToFrag3225_g32434 = Noise_Tint2802_g32434;
				o.ase_texcoord2.xyz = vertexToFrag3225_g32434;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord;
				o.ase_texcoord4 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g32434;
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

				float temp_output_7_0_g32742 = _GradientMinValue;
				float4 lerpResult2779_g32434 = lerp( _GradientColorTwo , _GradientColorOne , saturate( ( ( IN.ase_color.a - temp_output_7_0_g32742 ) / ( ( _GradientMaxValue + _GradientCat ) - temp_output_7_0_g32742 ) ) ));
				half3 Gradient_Tint2784_g32434 = (lerpResult2779_g32434).rgb;
				float3 vertexToFrag3225_g32434 = IN.ase_texcoord2.xyz;
				half2 Noise_UVs3274_g32434 = ( (WorldPosition).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g32755 = _NoiseMinValue;
				half Noise_Mask3162_g32434 = saturate( ( ( SAMPLE_TEXTURE2D( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g32434 ).r - temp_output_7_0_g32755 ) / ( _NoiseMaxValue - temp_output_7_0_g32755 ) ) );
				float4 lerpResult2800_g32434 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g32434);
				half3 Noise_Tint2802_g32434 = (lerpResult2800_g32434).rgb;
				#ifdef TVE_IS_GRASS_SHADER
				float3 staticSwitch3420_g32434 = Noise_Tint2802_g32434;
				#else
				float3 staticSwitch3420_g32434 = vertexToFrag3225_g32434;
				#endif
				half2 Main_UVs15_g32434 = ( ( IN.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g32434 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g32434 );
				float4 temp_output_51_0_g32434 = ( _MainColor * tex2DNode29_g32434 );
				half3 Main_AlbedoRaw99_g32434 = (temp_output_51_0_g32434).rgb;
				half3 Main_AlbedoTinted2808_g32434 = ( Gradient_Tint2784_g32434 * staticSwitch3420_g32434 * Main_AlbedoRaw99_g32434 * float3(1,1,1) );
				float4x4 break19_g32784 = GetObjectToWorldMatrix();
				float3 appendResult20_g32784 = (float3(break19_g32784[ 0 ][ 3 ] , break19_g32784[ 1 ][ 3 ] , break19_g32784[ 2 ][ 3 ]));
				half3 Off19_g32785 = appendResult20_g32784;
				float4 transform68_g32784 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord4);
				float3 appendResult95_g32784 = (float3(IN.ase_texcoord3.z , 0.0 , IN.ase_texcoord3.w));
				float4 transform62_g32784 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord4.xyz - ( appendResult95_g32784 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32784 = ( (transform68_g32784).xyz - (transform62_g32784).xyz );
				half3 On20_g32785 = ObjectPositionWithPivots28_g32784;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32785 = On20_g32785;
				#else
				float3 staticSwitch14_g32785 = Off19_g32785;
				#endif
				half3 ObjectData20_g32786 = staticSwitch14_g32785;
				half3 WorldData19_g32786 = Off19_g32785;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32786 = WorldData19_g32786;
				#else
				float3 staticSwitch14_g32786 = ObjectData20_g32786;
				#endif
				float3 temp_output_42_0_g32784 = staticSwitch14_g32786;
				half3 ObjectData20_g32790 = temp_output_42_0_g32784;
				half3 WorldData19_g32790 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32790 = WorldData19_g32790;
				#else
				float3 staticSwitch14_g32790 = ObjectData20_g32790;
				#endif
				float2 temp_output_35_38_g32783 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32790).xz ) );
				half4 Legacy33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, temp_output_35_38_g32783 );
				half4 Vegetation33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Vegetation, samplerTVE_ColorsTex_Vegetation, temp_output_35_38_g32783 );
				half4 Grass33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Grass, samplerTVE_ColorsTex_Grass, temp_output_35_38_g32783 );
				half4 Objects33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Objects, samplerTVE_ColorsTex_Objects, temp_output_35_38_g32783 );
				half4 Custom33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_User, samplerTVE_ColorsTex_User, temp_output_35_38_g32783 );
				half4 localUSE_BUFFERS33_g32789 = USE_BUFFERS( Legacy33_g32789 , Vegetation33_g32789 , Grass33_g32789 , Objects33_g32789 , Custom33_g32789 );
				float4 temp_output_45_0_g32783 = localUSE_BUFFERS33_g32789;
				half3 Global_ColorsTex_RGB1700_g32434 = (temp_output_45_0_g32783).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g32768 = 2.0;
				#else
				float staticSwitch1_g32768 = 4.594794;
				#endif
				float4 tex2DNode35_g32434 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g32434 );
				half Main_Mask_Raw57_g32434 = tex2DNode35_g32434.b;
				float temp_output_7_0_g32814 = _MainMaskMinValue;
				half Main_Mask_Remap3201_g32434 = saturate( ( ( Main_Mask_Raw57_g32434 - temp_output_7_0_g32814 ) / ( _MainMaskMaxValue - temp_output_7_0_g32814 ) ) );
				float lerpResult2105_g32434 = lerp( 1.0 , Main_Mask_Remap3201_g32434 , _ColorsMaskValue);
				float3 lerpResult108_g32434 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g32434 * staticSwitch1_g32768 ) ) , ( _GlobalColors * lerpResult2105_g32434 ));
				half3 Global_Colors1954_g32434 = lerpResult108_g32434;
				float3 temp_output_123_0_g32434 = ( Main_AlbedoTinted2808_g32434 * Global_Colors1954_g32434 );
				half3 Main_AlbedoColored863_g32434 = temp_output_123_0_g32434;
				half3 Blend_Albedo265_g32434 = Main_AlbedoColored863_g32434;
				float3 lerpResult2929_g32434 = lerp( float3( 1,1,1 ) , (TVE_MainLightParams).rgb , _SubsurfaceLightValue);
				half3 Subsurface_Color1722_g32434 = ( (_SubsurfaceColor).rgb * lerpResult2929_g32434 );
				half Global_ColorsTex_A1701_g32434 = (temp_output_45_0_g32783).w;
				float lerpResult1720_g32434 = lerp( 1.0 , Global_ColorsTex_A1701_g32434 , _GlobalHealthiness);
				half Subsurface_Intensity1752_g32434 = ( ( _SubsurfaceValue * lerpResult1720_g32434 ) + _SubsurfaceCat );
				float lerpResult3210_g32434 = lerp( 1.0 , Main_Mask_Remap3201_g32434 , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g32434 = lerpResult3210_g32434;
				half3 Subsurface_Transmission884_g32434 = ( Subsurface_Color1722_g32434 * Subsurface_Intensity1752_g32434 * Subsurface_Mask1557_g32434 );
				float3 normalizeResult1983_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g32434 = dot( -TVE_MainLightDirection , normalizeResult1983_g32434 );
				float saferPower1624_g32434 = max( (dotResult785_g32434*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g32434 = 0.0;
				#else
				float staticSwitch1602_g32434 = ( pow( saferPower1624_g32434 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g32434 = staticSwitch1602_g32434;
				half3 Subsurface_Deferred1693_g32434 = ( Subsurface_Transmission884_g32434 * Mask_Subsurface_View782_g32434 );
				half3 Blend_AlbedoAndSubsurface149_g32434 = ( Blend_Albedo265_g32434 + Subsurface_Deferred1693_g32434 );
				half3 Global_OverlayColor1758_g32434 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g32434 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g32434 );
				float2 appendResult88_g32731 = (float2(tex2DNode117_g32434.a , tex2DNode117_g32434.g));
				float2 temp_output_90_0_g32731 = ( (appendResult88_g32731*2.0 + -1.0) * _MainNormalValue );
				float2 break93_g32731 = temp_output_90_0_g32731;
				half Main_NormalY2095_g32434 = break93_g32731.y;
				half Overlay_Contrast1405_g32434 = _OverlayContrastValue;
				half Global_OverlayIntensity154_g32434 = TVE_OverlayIntensity;
				float4x4 break19_g32749 = GetObjectToWorldMatrix();
				float3 appendResult20_g32749 = (float3(break19_g32749[ 0 ][ 3 ] , break19_g32749[ 1 ][ 3 ] , break19_g32749[ 2 ][ 3 ]));
				half3 Off19_g32750 = appendResult20_g32749;
				float4 transform68_g32749 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord4);
				float3 appendResult95_g32749 = (float3(IN.ase_texcoord3.z , 0.0 , IN.ase_texcoord3.w));
				float4 transform62_g32749 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord4.xyz - ( appendResult95_g32749 * _vertex_pivot_mode ) ) , 0.0 ));
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
				half Global_ExtrasTex_B156_g32434 = break49_g32746.z;
				float temp_output_1025_0_g32434 = ( Global_OverlayIntensity154_g32434 * _GlobalOverlay * Global_ExtrasTex_B156_g32434 );
				half Overlay_Commons1365_g32434 = temp_output_1025_0_g32434;
				half Overlay_Mask269_g32434 = saturate( ( saturate( ( IN.ase_color.a + ( Main_NormalY2095_g32434 * Overlay_Contrast1405_g32434 ) ) ) - ( 1.0 - Overlay_Commons1365_g32434 ) ) );
				float3 lerpResult336_g32434 = lerp( Blend_AlbedoAndSubsurface149_g32434 , Global_OverlayColor1758_g32434 , Overlay_Mask269_g32434);
				half3 Final_Albedo359_g32434 = lerpResult336_g32434;
				half Main_Alpha316_g32434 = (temp_output_51_0_g32434).a;
				float lerpResult354_g32434 = lerp( 1.0 , Main_Alpha316_g32434 , _render_premul);
				half Final_Premultiply355_g32434 = lerpResult354_g32434;
				float3 temp_output_410_0_g32434 = ( Final_Albedo359_g32434 * Final_Premultiply355_g32434 );
				
				float localCustomAlphaClip9_g32759 = ( 0.0 );
				half Main_AlphaRaw1203_g32434 = tex2DNode29_g32434.a;
				float3 normalizeResult2169_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal2274_g32434 = half3(0.001,0.001,1);
				float3 worldNormal2274_g32434 = float3(dot(tanToWorld0,tanNormal2274_g32434), dot(tanToWorld1,tanNormal2274_g32434), dot(tanToWorld2,tanNormal2274_g32434));
				float dotResult2161_g32434 = dot( normalizeResult2169_g32434 , worldNormal2274_g32434 );
				float3 normalizeResult2210_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult2212_g32434 = dot( normalizeResult2210_g32434 , float3(0,1,0) );
				half Mask_HView2656_g32434 = abs( dotResult2212_g32434 );
				float lerpResult2221_g32434 = lerp( _BillboardFadeHValue , _BillboardFadeVValue , Mask_HView2656_g32434);
				half Billboard_Fade2175_g32434 = ( pow( ( dotResult2161_g32434 * dotResult2161_g32434 ) , lerpResult2221_g32434 ) + _BillboardCat );
				half Alpha5_g32759 = ( Main_AlphaRaw1203_g32434 * Billboard_Fade2175_g32434 );
				float Alpha9_g32759 = Alpha5_g32759;
				#if _ALPHATEST_ON
				clip(Alpha9_g32759 - _Cutoff);
				#endif
				half Final_Clip914_g32434 = localCustomAlphaClip9_g32759;
				
				
				float3 Albedo = temp_output_410_0_g32434;
				float3 Emission = 0;
				float Alpha = Main_Alpha316_g32434;
				float AlphaClipThreshold = Final_Clip914_g32434;

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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local TVE_VERTEX_DATA_OBJECT TVE_VERTEX_DATA_WORLD TVE_VERTEX_DATA_BATCHED
			#define TVE_IS_VEGETATION_SHADER
			  
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
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NoiseTintOne;
			float4 _Color;
			half4 _MainColor;
			half4 _MainUVs;
			float4 _LocalColors;
			half4 _GradientColorOne;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			half4 _GradientColorTwo;
			half4 _NoiseTintTwo;
			half3 _render_normals_options;
			half _GradientCat;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _LocalSize;
			half _GlobalSizeFade;
			half _VertexDataMode;
			half _VertexMotionMode;
			half _VertexMotionSpace;
			half _VertexCat;
			half _InteractionVariation;
			half _Motion_Interaction;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _Motion_10;
			half _GlobalSize;
			half _IsLitShader;
			half _NoiseMaxValue;
			half _MoiseCat;
			half _BillboardFadeHValue;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _render_premul;
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
			half _MainMaskMaxValue;
			half _MainMaskMinValue;
			half _GlobalColors;
			half _vertex_pivot_mode;
			half _NoiseMinValue;
			half _NoiseScaleValue;
			half _MotionAmplitude_10;
			half _ObjectDataMessage;
			half _BatchingMessage;
			half _MainCat;
			half _DetailMode;
			half _DetailMapsMode;
			half _GlobalCat;
			half _RenderMode;
			half _VertexVariationMode;
			half _RenderPriority;
			half _IsVersion;
			half _IsTVEShader;
			half _RenderingCat;
			half _RenderCull;
			half _Cutoff;
			half _MainNormalValue;
			half _render_zw;
			half _Banner;
			half _render_cull;
			half _render_cutoff;
			half _render_dst;
			half _render_src;
			half _IsCrossShader;
			half _IsStandardShader;
			half _IsAnyPathShader;
			half _RenderClip;
			half _RenderNormals;
			half _RenderBlend;
			half _RenderZWrite;
			half _BillboardFadeVValue;
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
			float _render_normals;
			half _GlobalSpace;
			half _DetailSpace;
			half _PivotsMessage;
			half _DetailTypeMode;
			half _AdvancedCat;
			half _DetailCat;
			float _OverlayContrast;
			half _BillboardCat;
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
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_MainMaskTex);
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
				half3 Mesh_PivotsOS2291_g32434 = _Vector1;
				float3 temp_output_2283_0_g32434 = ( v.vertex.xyz - Mesh_PivotsOS2291_g32434 );
				half3 VertexPos40_g32740 = temp_output_2283_0_g32434;
				float3 appendResult74_g32740 = (float3(VertexPos40_g32740.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g32740 = appendResult74_g32740;
				float3 break84_g32740 = VertexPos40_g32740;
				float3 appendResult81_g32740 = (float3(0.0 , break84_g32740.y , break84_g32740.z));
				half3 VertexPosOtherAxis82_g32740 = appendResult81_g32740;
				float ObjectData20_g32815 = 3.14;
				float Bounds_Height374_g32434 = _MaxBoundsInfo.y;
				float WorldData19_g32815 = ( Bounds_Height374_g32434 * 3.14 );
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32815 = WorldData19_g32815;
				#else
				float staticSwitch14_g32815 = ObjectData20_g32815;
				#endif
				float Motion_Max_Bending1133_g32434 = staticSwitch14_g32815;
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
				half Wind_Power_103106_g32434 = Wind_Power369_g32778;
				float3 appendResult323_g32778 = (float3(break322_g32778.x , 0.0 , break322_g32778.y));
				float3 temp_output_324_0_g32778 = (appendResult323_g32778*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 temp_output_339_0_g32778 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g32778 , 0.0 ) ).xyz * ase_parentObjectScale );
				half2 Wind_DirectionOS39_g32434 = (temp_output_339_0_g32778).xz;
				half Motion_Use1056_g32434 = _Motion_10;
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
				float4 temp_cast_9 = (TVE_NoiseContrast).xxxx;
				float4 break142_g32799 = pow( saferPower77_g32799 , temp_cast_9 );
				half Global_NoiseTex_R34_g32434 = break142_g32799.r;
				half Input_Speed62_g32735 = _MotionSpeed_10;
				float mulTime373_g32735 = _TimeParameters.x * Input_Speed62_g32735;
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
				half Variation3073_g32434 = staticSwitch14_g32762;
				half Motion_Variation284_g32735 = ( _MotionVariation_10 * Variation3073_g32434 );
				float2 appendResult344_g32735 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g32735 = ( _MotionScale_10 * appendResult344_g32735 );
				half2 Sine_MinusOneToOne281_g32735 = sin( ( mulTime373_g32735 + Motion_Variation284_g32735 + Motion_Scale287_g32735 ) );
				float2 temp_cast_11 = (1.0).xx;
				half Input_Turbulence327_g32735 = Global_NoiseTex_R34_g32434;
				float2 lerpResult321_g32735 = lerp( Sine_MinusOneToOne281_g32735 , temp_cast_11 , Input_Turbulence327_g32735);
				half2 Motion_Bending2258_g32434 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g32434 ) * Wind_Power_103106_g32434 * Wind_DirectionOS39_g32434 * Motion_Use1056_g32434 * Global_NoiseTex_R34_g32434 * lerpResult321_g32735 );
				half Motion_UseInteraction2097_g32434 = _Motion_Interaction;
				half Motion_InteractionMask66_g32434 = break322_g32778.w;
				float lerpResult3307_g32434 = lerp( 1.0 , Variation3073_g32434 , _InteractionVariation);
				half2 Motion_Interaction53_g32434 = ( _InteractionAmplitude * Motion_Max_Bending1133_g32434 * Motion_UseInteraction2097_g32434 * Motion_InteractionMask66_g32434 * Motion_InteractionMask66_g32434 * Wind_DirectionOS39_g32434 * lerpResult3307_g32434 );
				float2 lerpResult109_g32434 = lerp( Motion_Bending2258_g32434 , Motion_Interaction53_g32434 , Motion_InteractionMask66_g32434);
				half Mesh_Motion_182_g32434 = v.ase_texcoord3.x;
				float2 break143_g32434 = ( lerpResult109_g32434 * Mesh_Motion_182_g32434 );
				half Motion_Z190_g32434 = break143_g32434.y;
				half Angle44_g32740 = Motion_Z190_g32434;
				half3 VertexPos40_g32723 = ( VertexPosRotationAxis50_g32740 + ( VertexPosOtherAxis82_g32740 * cos( Angle44_g32740 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g32740 ) * sin( Angle44_g32740 ) ) );
				float3 appendResult74_g32723 = (float3(0.0 , 0.0 , VertexPos40_g32723.z));
				half3 VertexPosRotationAxis50_g32723 = appendResult74_g32723;
				float3 break84_g32723 = VertexPos40_g32723;
				float3 appendResult81_g32723 = (float3(break84_g32723.x , break84_g32723.y , 0.0));
				half3 VertexPosOtherAxis82_g32723 = appendResult81_g32723;
				half Motion_X216_g32434 = break143_g32434.x;
				half Angle44_g32723 = -Motion_X216_g32434;
				half Wind_Mode3167_g32434 = TVE_WindMode;
				float3 lerpResult3168_g32434 = lerp( v.vertex.xyz , ( VertexPosRotationAxis50_g32723 + ( VertexPosOtherAxis82_g32723 * cos( Angle44_g32723 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g32723 ) * sin( Angle44_g32723 ) ) ) , Wind_Mode3167_g32434);
				float3 Vertex_Motion_Object833_g32434 = lerpResult3168_g32434;
				float3 temp_output_3474_0_g32434 = ( v.vertex.xyz - Mesh_PivotsOS2291_g32434 );
				float3 appendResult2043_g32434 = (float3(Motion_X216_g32434 , 0.0 , Motion_Z190_g32434));
				float3 lerpResult3173_g32434 = lerp( v.vertex.xyz , ( temp_output_3474_0_g32434 + appendResult2043_g32434 ) , Wind_Mode3167_g32434);
				float3 Vertex_Motion_World1118_g32434 = lerpResult3173_g32434;
				float3 temp_output_3331_0_g32434 = ( ( _VertexCat * _VertexMotionSpace * _VertexMotionMode * _VertexDataMode ) + Vertex_Motion_World1118_g32434 );
				#if defined(TVE_VERTEX_DATA_OBJECT)
				float3 staticSwitch3312_g32434 = Vertex_Motion_Object833_g32434;
				#elif defined(TVE_VERTEX_DATA_WORLD)
				float3 staticSwitch3312_g32434 = temp_output_3331_0_g32434;
				#elif defined(TVE_VERTEX_DATA_BATCHED)
				float3 staticSwitch3312_g32434 = temp_output_3331_0_g32434;
				#else
				float3 staticSwitch3312_g32434 = Vertex_Motion_Object833_g32434;
				#endif
				half3 ObjectData20_g32782 = staticSwitch3312_g32434;
				half3 WorldData19_g32782 = Vertex_Motion_World1118_g32434;
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
				float Vertex_SizeFade1740_g32434 = staticSwitch14_g32780;
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
				half Global_ExtrasTex_G305_g32434 = break49_g32746.y;
				float lerpResult346_g32434 = lerp( 1.0 , Global_ExtrasTex_G305_g32434 , _GlobalSize);
				float ObjectData20_g32781 = ( lerpResult346_g32434 * _LocalSize );
				float WorldData19_g32781 = 1.0;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float staticSwitch14_g32781 = WorldData19_g32781;
				#else
				float staticSwitch14_g32781 = ObjectData20_g32781;
				#endif
				half Vertex_Size1741_g32434 = staticSwitch14_g32781;
				half3 Grass_Coverage2661_g32434 = half3(0,0,0);
				float3 Final_VertexPosition890_g32434 = ( ( staticSwitch14_g32782 * Vertex_SizeFade1740_g32434 * Vertex_Size1741_g32434 ) + Mesh_PivotsOS2291_g32434 + Grass_Coverage2661_g32434 );
				
				half2 Noise_UVs3274_g32434 = ( (ase_worldPos).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g32755 = _NoiseMinValue;
				half Noise_Mask3162_g32434 = saturate( ( ( SAMPLE_TEXTURE2D_LOD( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g32434, 0.0 ).r - temp_output_7_0_g32755 ) / ( _NoiseMaxValue - temp_output_7_0_g32755 ) ) );
				float4 lerpResult2800_g32434 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g32434);
				half3 Noise_Tint2802_g32434 = (lerpResult2800_g32434).rgb;
				float3 vertexToFrag3225_g32434 = Noise_Tint2802_g32434;
				o.ase_texcoord2.xyz = vertexToFrag3225_g32434;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord;
				o.ase_texcoord4 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_VertexPosition890_g32434;
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

				float temp_output_7_0_g32742 = _GradientMinValue;
				float4 lerpResult2779_g32434 = lerp( _GradientColorTwo , _GradientColorOne , saturate( ( ( IN.ase_color.a - temp_output_7_0_g32742 ) / ( ( _GradientMaxValue + _GradientCat ) - temp_output_7_0_g32742 ) ) ));
				half3 Gradient_Tint2784_g32434 = (lerpResult2779_g32434).rgb;
				float3 vertexToFrag3225_g32434 = IN.ase_texcoord2.xyz;
				half2 Noise_UVs3274_g32434 = ( (WorldPosition).xz * ( ( _NoiseScaleValue * 0.1 ) + _MoiseCat ) );
				float temp_output_7_0_g32755 = _NoiseMinValue;
				half Noise_Mask3162_g32434 = saturate( ( ( SAMPLE_TEXTURE2D( _NoiseTex, sampler_NoiseTex, Noise_UVs3274_g32434 ).r - temp_output_7_0_g32755 ) / ( _NoiseMaxValue - temp_output_7_0_g32755 ) ) );
				float4 lerpResult2800_g32434 = lerp( _NoiseTintTwo , _NoiseTintOne , Noise_Mask3162_g32434);
				half3 Noise_Tint2802_g32434 = (lerpResult2800_g32434).rgb;
				#ifdef TVE_IS_GRASS_SHADER
				float3 staticSwitch3420_g32434 = Noise_Tint2802_g32434;
				#else
				float3 staticSwitch3420_g32434 = vertexToFrag3225_g32434;
				#endif
				half2 Main_UVs15_g32434 = ( ( IN.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g32434 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g32434 );
				float4 temp_output_51_0_g32434 = ( _MainColor * tex2DNode29_g32434 );
				half3 Main_AlbedoRaw99_g32434 = (temp_output_51_0_g32434).rgb;
				half3 Main_AlbedoTinted2808_g32434 = ( Gradient_Tint2784_g32434 * staticSwitch3420_g32434 * Main_AlbedoRaw99_g32434 * float3(1,1,1) );
				float4x4 break19_g32784 = GetObjectToWorldMatrix();
				float3 appendResult20_g32784 = (float3(break19_g32784[ 0 ][ 3 ] , break19_g32784[ 1 ][ 3 ] , break19_g32784[ 2 ][ 3 ]));
				half3 Off19_g32785 = appendResult20_g32784;
				float4 transform68_g32784 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord4);
				float3 appendResult95_g32784 = (float3(IN.ase_texcoord3.z , 0.0 , IN.ase_texcoord3.w));
				float4 transform62_g32784 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord4.xyz - ( appendResult95_g32784 * _vertex_pivot_mode ) ) , 0.0 ));
				float3 ObjectPositionWithPivots28_g32784 = ( (transform68_g32784).xyz - (transform62_g32784).xyz );
				half3 On20_g32785 = ObjectPositionWithPivots28_g32784;
				#ifdef TVE_PIVOT_DATA_BAKED
				float3 staticSwitch14_g32785 = On20_g32785;
				#else
				float3 staticSwitch14_g32785 = Off19_g32785;
				#endif
				half3 ObjectData20_g32786 = staticSwitch14_g32785;
				half3 WorldData19_g32786 = Off19_g32785;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32786 = WorldData19_g32786;
				#else
				float3 staticSwitch14_g32786 = ObjectData20_g32786;
				#endif
				float3 temp_output_42_0_g32784 = staticSwitch14_g32786;
				half3 ObjectData20_g32790 = temp_output_42_0_g32784;
				half3 WorldData19_g32790 = WorldPosition;
				#ifdef TVE_VERTEX_DATA_BATCHED
				float3 staticSwitch14_g32790 = WorldData19_g32790;
				#else
				float3 staticSwitch14_g32790 = ObjectData20_g32790;
				#endif
				float2 temp_output_35_38_g32783 = ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g32790).xz ) );
				half4 Legacy33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, temp_output_35_38_g32783 );
				half4 Vegetation33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Vegetation, samplerTVE_ColorsTex_Vegetation, temp_output_35_38_g32783 );
				half4 Grass33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Grass, samplerTVE_ColorsTex_Grass, temp_output_35_38_g32783 );
				half4 Objects33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_Objects, samplerTVE_ColorsTex_Objects, temp_output_35_38_g32783 );
				half4 Custom33_g32789 = SAMPLE_TEXTURE2D( TVE_ColorsTex_User, samplerTVE_ColorsTex_User, temp_output_35_38_g32783 );
				half4 localUSE_BUFFERS33_g32789 = USE_BUFFERS( Legacy33_g32789 , Vegetation33_g32789 , Grass33_g32789 , Objects33_g32789 , Custom33_g32789 );
				float4 temp_output_45_0_g32783 = localUSE_BUFFERS33_g32789;
				half3 Global_ColorsTex_RGB1700_g32434 = (temp_output_45_0_g32783).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g32768 = 2.0;
				#else
				float staticSwitch1_g32768 = 4.594794;
				#endif
				float4 tex2DNode35_g32434 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g32434 );
				half Main_Mask_Raw57_g32434 = tex2DNode35_g32434.b;
				float temp_output_7_0_g32814 = _MainMaskMinValue;
				half Main_Mask_Remap3201_g32434 = saturate( ( ( Main_Mask_Raw57_g32434 - temp_output_7_0_g32814 ) / ( _MainMaskMaxValue - temp_output_7_0_g32814 ) ) );
				float lerpResult2105_g32434 = lerp( 1.0 , Main_Mask_Remap3201_g32434 , _ColorsMaskValue);
				float3 lerpResult108_g32434 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g32434 * staticSwitch1_g32768 ) ) , ( _GlobalColors * lerpResult2105_g32434 ));
				half3 Global_Colors1954_g32434 = lerpResult108_g32434;
				float3 temp_output_123_0_g32434 = ( Main_AlbedoTinted2808_g32434 * Global_Colors1954_g32434 );
				half3 Main_AlbedoColored863_g32434 = temp_output_123_0_g32434;
				half3 Blend_Albedo265_g32434 = Main_AlbedoColored863_g32434;
				float3 lerpResult2929_g32434 = lerp( float3( 1,1,1 ) , (TVE_MainLightParams).rgb , _SubsurfaceLightValue);
				half3 Subsurface_Color1722_g32434 = ( (_SubsurfaceColor).rgb * lerpResult2929_g32434 );
				half Global_ColorsTex_A1701_g32434 = (temp_output_45_0_g32783).w;
				float lerpResult1720_g32434 = lerp( 1.0 , Global_ColorsTex_A1701_g32434 , _GlobalHealthiness);
				half Subsurface_Intensity1752_g32434 = ( ( _SubsurfaceValue * lerpResult1720_g32434 ) + _SubsurfaceCat );
				float lerpResult3210_g32434 = lerp( 1.0 , Main_Mask_Remap3201_g32434 , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g32434 = lerpResult3210_g32434;
				half3 Subsurface_Transmission884_g32434 = ( Subsurface_Color1722_g32434 * Subsurface_Intensity1752_g32434 * Subsurface_Mask1557_g32434 );
				float3 normalizeResult1983_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g32434 = dot( -TVE_MainLightDirection , normalizeResult1983_g32434 );
				float saferPower1624_g32434 = max( (dotResult785_g32434*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g32434 = 0.0;
				#else
				float staticSwitch1602_g32434 = ( pow( saferPower1624_g32434 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g32434 = staticSwitch1602_g32434;
				half3 Subsurface_Deferred1693_g32434 = ( Subsurface_Transmission884_g32434 * Mask_Subsurface_View782_g32434 );
				half3 Blend_AlbedoAndSubsurface149_g32434 = ( Blend_Albedo265_g32434 + Subsurface_Deferred1693_g32434 );
				half3 Global_OverlayColor1758_g32434 = (TVE_OverlayColor).rgb;
				float4 tex2DNode117_g32434 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g32434 );
				float2 appendResult88_g32731 = (float2(tex2DNode117_g32434.a , tex2DNode117_g32434.g));
				float2 temp_output_90_0_g32731 = ( (appendResult88_g32731*2.0 + -1.0) * _MainNormalValue );
				float2 break93_g32731 = temp_output_90_0_g32731;
				half Main_NormalY2095_g32434 = break93_g32731.y;
				half Overlay_Contrast1405_g32434 = _OverlayContrastValue;
				half Global_OverlayIntensity154_g32434 = TVE_OverlayIntensity;
				float4x4 break19_g32749 = GetObjectToWorldMatrix();
				float3 appendResult20_g32749 = (float3(break19_g32749[ 0 ][ 3 ] , break19_g32749[ 1 ][ 3 ] , break19_g32749[ 2 ][ 3 ]));
				half3 Off19_g32750 = appendResult20_g32749;
				float4 transform68_g32749 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord4);
				float3 appendResult95_g32749 = (float3(IN.ase_texcoord3.z , 0.0 , IN.ase_texcoord3.w));
				float4 transform62_g32749 = mul(GetObjectToWorldMatrix(),float4( ( IN.ase_texcoord4.xyz - ( appendResult95_g32749 * _vertex_pivot_mode ) ) , 0.0 ));
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
				half Global_ExtrasTex_B156_g32434 = break49_g32746.z;
				float temp_output_1025_0_g32434 = ( Global_OverlayIntensity154_g32434 * _GlobalOverlay * Global_ExtrasTex_B156_g32434 );
				half Overlay_Commons1365_g32434 = temp_output_1025_0_g32434;
				half Overlay_Mask269_g32434 = saturate( ( saturate( ( IN.ase_color.a + ( Main_NormalY2095_g32434 * Overlay_Contrast1405_g32434 ) ) ) - ( 1.0 - Overlay_Commons1365_g32434 ) ) );
				float3 lerpResult336_g32434 = lerp( Blend_AlbedoAndSubsurface149_g32434 , Global_OverlayColor1758_g32434 , Overlay_Mask269_g32434);
				half3 Final_Albedo359_g32434 = lerpResult336_g32434;
				half Main_Alpha316_g32434 = (temp_output_51_0_g32434).a;
				float lerpResult354_g32434 = lerp( 1.0 , Main_Alpha316_g32434 , _render_premul);
				half Final_Premultiply355_g32434 = lerpResult354_g32434;
				float3 temp_output_410_0_g32434 = ( Final_Albedo359_g32434 * Final_Premultiply355_g32434 );
				
				float localCustomAlphaClip9_g32759 = ( 0.0 );
				half Main_AlphaRaw1203_g32434 = tex2DNode29_g32434.a;
				float3 normalizeResult2169_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal2274_g32434 = half3(0.001,0.001,1);
				float3 worldNormal2274_g32434 = float3(dot(tanToWorld0,tanNormal2274_g32434), dot(tanToWorld1,tanNormal2274_g32434), dot(tanToWorld2,tanNormal2274_g32434));
				float dotResult2161_g32434 = dot( normalizeResult2169_g32434 , worldNormal2274_g32434 );
				float3 normalizeResult2210_g32434 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult2212_g32434 = dot( normalizeResult2210_g32434 , float3(0,1,0) );
				half Mask_HView2656_g32434 = abs( dotResult2212_g32434 );
				float lerpResult2221_g32434 = lerp( _BillboardFadeHValue , _BillboardFadeVValue , Mask_HView2656_g32434);
				half Billboard_Fade2175_g32434 = ( pow( ( dotResult2161_g32434 * dotResult2161_g32434 ) , lerpResult2221_g32434 ) + _BillboardCat );
				half Alpha5_g32759 = ( Main_AlphaRaw1203_g32434 * Billboard_Fade2175_g32434 );
				float Alpha9_g32759 = Alpha5_g32759;
				#if _ALPHATEST_ON
				clip(Alpha9_g32759 - _Cutoff);
				#endif
				half Final_Clip914_g32434 = localCustomAlphaClip9_g32759;
				
				
				float3 Albedo = temp_output_410_0_g32434;
				float Alpha = Main_Alpha316_g32434;
				float AlphaClipThreshold = Final_Clip914_g32434;

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
1927;1;1906;1021;2867.735;781.5972;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;141;-1568,-896;Half;False;Property;_IsLitShader;_IsLitShader;205;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;283;-2176,-384;Inherit;False;Base Shader;1;;32434;856f7164d1c579d43a5cf4968a75ca43;50,1300,1,1298,1,1271,0,1962,1,1708,1,1712,3,1964,1,1969,1,1719,1,893,0,1745,1,1742,1,1715,1,1718,1,1717,1,1714,1,916,0,1949,1,1763,0,1762,0,1776,0,1646,1,1690,1,1757,0,3221,3,1981,0,2807,1,2953,1,3243,0,2172,1,2658,0,1735,0,1736,0,1734,0,1737,0,1968,0,1966,0,1733,0,878,0,1550,0,860,1,2750,0,2260,1,2261,1,2054,0,2032,0,2036,0,2060,0,2062,0,2039,0;0;15;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Cross Standard Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-768;Half;False;Property;_render_cull;_render_cull;209;1;[HideInInspector];Create;True;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-768;Half;False;Property;_render_cutoff;_render_cutoff;208;1;[HideInInspector];Create;True;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.719;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1536,-768;Half;False;Property;_render_dst;_render_dst;211;1;[HideInInspector];Create;True;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;212;1;[HideInInspector];Create;True;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;274;-2176,256;Inherit;False;Use TVE_IS_VEGETATION_SHADER;-1;;32433;b458122dd75182d488380bd0f592b9e6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-1984,-896;Half;False;Property;_IsCrossShader;_IsCrossShader;207;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;129;-1792,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;204;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;268;-1392,-896;Half;False;Property;_IsAnyPathShader;_IsAnyPathShader;206;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1728,-768;Half;False;Property;_render_src;_render_src;210;1;[HideInInspector];Create;True;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;276;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;277;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;2;BOXOPHOBIC/The Vegetation Engine/Vegetation/Cross Standard Lit;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;17;False;False;False;False;False;False;False;False;True;0;False;-1;True;2;True;10;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;17;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;36;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,True,669;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;1;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;0;0;6;False;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;278;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;280;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;281;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;True;1;True;17;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;279;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;266;-2176,128;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1024.392;100;Final;0;;0,1,0.5,1;0;0
WireConnection;277;0;283;0
WireConnection;277;1;283;528
WireConnection;277;3;283;529
WireConnection;277;4;283;530
WireConnection;277;5;283;531
WireConnection;277;6;283;532
WireConnection;277;7;283;653
WireConnection;277;8;283;534
ASEEND*/
//CHKSM=234CDECFDA5417020B4FA00454249DA4DE20C3A6