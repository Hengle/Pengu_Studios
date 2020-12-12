//Cristian Pop - https://boxophobic.com/

using UnityEditor;
using UnityEngine;

namespace TheVegetationEngine
{
    public class TVEShaderUtils
    {
        public static void SetMaterialSettings(Material material)
        {
            // Set Internal Render Values
            if (material.HasProperty("_RenderMode"))
            {
                material.SetInt("_render_mode", material.GetInt("_RenderMode"));
            }

            if (material.HasProperty("_RenderCull"))
            {
                material.SetInt("_render_cull", material.GetInt("_RenderCull"));
            }

            if (material.HasProperty("_RenderNormals"))
            {
                material.SetInt("_render_normals", material.GetInt("_RenderNormals"));
            }

            if (material.HasProperty("_RenderZWrite"))
            {
                material.SetInt("_render_zw", material.GetInt("_RenderZWrite"));
            }

            if (material.HasProperty("_RenderClip"))
            {
                material.SetInt("_render_clip", material.GetInt("_RenderClip"));
            }

            // Set Render Mode
            if (material.HasProperty("_RenderMode") && material.HasProperty("_RenderBlend"))
            {
                int mode = material.GetInt("_RenderMode");
                int blend = material.GetInt("_RenderBlend");
                int zwrite = material.GetInt("_RenderZWrite");

                // Opaque
                if (mode == 0)
                {
                    material.SetOverrideTag("RenderType", "Opaque");
                    material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Geometry;

                    // Standard and Universal Render Pipeline
                    material.SetInt("_render_src", (int)UnityEngine.Rendering.BlendMode.One);
                    material.SetInt("_render_dst", (int)UnityEngine.Rendering.BlendMode.Zero);
                    material.SetInt("_render_zw", 1);
                    material.SetInt("_render_premul", 0);

                    // HD Render Pipeline
                    material.DisableKeyword("_SURFACE_TYPE_TRANSPARENT");
                    material.DisableKeyword("_ENABLE_FOG_ON_TRANSPARENT");

                    material.DisableKeyword("_BLENDMODE_ALPHA");
                    material.DisableKeyword("_BLENDMODE_ADD");
                    material.DisableKeyword("_BLENDMODE_PRE_MULTIPLY");

                    material.SetInt("_RenderQueueType", 1);
                    material.SetInt("_SurfaceType", 0);
                    material.SetInt("_BlendMode", 0);
                    material.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.One);
                    material.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.Zero);
                    material.SetInt("_AlphaSrcBlend", (int)UnityEngine.Rendering.BlendMode.One);
                    material.SetInt("_AlphaDstBlend", (int)UnityEngine.Rendering.BlendMode.Zero);
                    material.SetInt("_ZWrite", 1);
                    material.SetInt("_TransparentZWrite", 1);
                    material.SetInt("_ZTestDepthEqualForOpaque", 3);
                    material.SetInt("_ZTestGBuffer", 3);
                    material.SetInt("_ZTestTransparent", 4);
                }
                // Transparent
                else
                {
                    material.SetOverrideTag("RenderType", "Transparent");
                    material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent;

                    // Alpha Blend
                    if (blend == 0)
                    {
                        // Standard and Universal Render Pipeline
                        material.SetInt("_render_src", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
                        material.SetInt("_render_dst", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                        material.SetInt("_render_premul", 0);

                        // HD Render Pipeline
                        material.EnableKeyword("_SURFACE_TYPE_TRANSPARENT");
                        material.EnableKeyword("_ENABLE_FOG_ON_TRANSPARENT");

                        material.EnableKeyword("_BLENDMODE_ALPHA");
                        material.DisableKeyword("_BLENDMODE_ADD");
                        material.DisableKeyword("_BLENDMODE_PRE_MULTIPLY");

                        material.SetInt("_RenderQueueType", 5);
                        material.SetInt("_SurfaceType", 1);
                        material.SetInt("_BlendMode", 0);
                        material.SetInt("_SrcBlend", 1);
                        material.SetInt("_DstBlend", 10);
                        material.SetInt("_AlphaSrcBlend", 1);
                        material.SetInt("_AlphaDstBlend", 10);
                        material.SetInt("_ZWrite", zwrite);
                        material.SetInt("_TransparentZWrite", zwrite);
                        material.SetInt("_ZTestDepthEqualForOpaque", 4);
                        material.SetInt("_ZTestGBuffer", 3);
                        material.SetInt("_ZTestTransparent", 4);
                    }
                    // Premultiply Blend
                    else if (blend == 1)
                    {
                        // Standard and Universal Render Pipeline
                        material.SetInt("_render_src", (int)UnityEngine.Rendering.BlendMode.One);
                        material.SetInt("_render_dst", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                        material.SetInt("_render_premul", 1);

                        // HD Render Pipeline
                        material.EnableKeyword("_SURFACE_TYPE_TRANSPARENT");
                        material.EnableKeyword("_ENABLE_FOG_ON_TRANSPARENT");

                        material.DisableKeyword("_BLENDMODE_ALPHA");
                        material.DisableKeyword("_BLENDMODE_ADD");
                        material.EnableKeyword("_BLENDMODE_PRE_MULTIPLY");

                        material.SetInt("_RenderQueueType", 5);
                        material.SetInt("_SurfaceType", 1);
                        material.SetInt("_BlendMode", 4);
                        material.SetInt("_SrcBlend", 1);
                        material.SetInt("_DstBlend", 10);
                        material.SetInt("_AlphaSrcBlend", 1);
                        material.SetInt("_AlphaDstBlend", 10);
                        material.SetInt("_ZWrite", zwrite);
                        material.SetInt("_TransparentZWrite", zwrite);
                        material.SetInt("_ZTestDepthEqualForOpaque", 4);
                        material.SetInt("_ZTestGBuffer", 3);
                        material.SetInt("_ZTestTransparent", 4);
                    }
                }
            }

            // Set Cull Mode
            if (material.HasProperty("_RenderCull"))
            {
                int cull = material.GetInt("_RenderCull");

                material.SetInt("_CullMode", cull);
                material.SetInt("_TransparentCullMode", cull);
                material.SetInt("_CullModeForward", cull);

                // Needed for HD Render Pipeline
                material.DisableKeyword("_DOUBLESIDED_ON");
            }

            // Set Clip Mode
            if (material.HasProperty("_RenderClip"))
            {
                int clip = material.GetInt("_RenderClip");
                float cutoff = material.GetFloat("_Cutoff");

                if (clip == 0)
                {
                    material.DisableKeyword("_ALPHATEST_ON");

                    // HD Render Pipeline
                    material.SetInt("_AlphaCutoffEnable", 0);
                }
                else
                {
                    material.EnableKeyword("_ALPHATEST_ON");

                    // HD Render Pipeline
                    material.SetInt("_AlphaCutoffEnable", 1);
                }

                material.SetFloat("_render_cutoff", cutoff);

                // HD Render Pipeline
                material.SetFloat("_AlphaCutoff", cutoff);
                material.SetFloat("_AlphaCutoffPostpass", cutoff);
                material.SetFloat("_AlphaCutoffPrepass", cutoff);
                material.SetFloat("_AlphaCutoffShadow", cutoff);
            }

            // Set Render Queue Offset
            if (material.HasProperty("_RenderPriority"))
            {
                int priority = material.GetInt("_RenderPriority");

                // HD Render Pipeline
                material.SetInt("_TransparentSortPriority", priority);

                material.renderQueue = material.renderQueue + priority;
            }

            // Set Normals Mode
            if (material.HasProperty("_RenderNormals"))
            {
                int normals = material.GetInt("_RenderNormals");

                // Standard, Universal, HD Render Pipeline
                // Flip 0
                if (normals == 0)
                {
                    material.SetVector("_render_normals_options", new Vector4(-1, -1, -1, 0));
                    material.SetVector("_DoubleSidedConstants", new Vector4(-1, -1, -1, 0));
                }
                // Mirror 1
                else if (normals == 1)
                {
                    material.SetVector("_render_normals_options", new Vector4(1, 1, -1, 0));
                    material.SetVector("_DoubleSidedConstants", new Vector4(1, 1, -1, 0));
                }
                // None 2
                else if (normals == 2)
                {
                    material.SetVector("_render_normals_options", new Vector4(1, 1, 1, 0));
                    material.SetVector("_DoubleSidedConstants", new Vector4(1, 1, 1, 0));
                }
            }

            // Set Normals to 0 if no texture is used
            if (material.HasProperty("_MainNormalTex"))
            {
                if (material.GetTexture("_MainNormalTex") == null)
                {
                    material.SetFloat("_MainNormalValue", 0);
                }
            }

            // Set Normals to 0 if no texture is used
            if (material.HasProperty("_SecondNormalTex"))
            {
                if (material.GetTexture("_SecondNormalTex") == null)
                {
                    material.SetFloat("_SecondNormalValue", 0);
                }
            }

            // Assign Default HD Foliage profile
            if (material.HasProperty("_SubsurfaceDiffusion"))
            {
                if (material.GetFloat("_SubsurfaceDiffusion") == 0)
                {
                    material.SetFloat("_SubsurfaceDiffusion", 3.5648174285888672f);
                    material.SetVector("_SubsurfaceDiffusion_asset", new Vector4(228889264007084710000000000000000000000f, 0.000000000000000000000000012389357880079404f, 0.00000000000000000000000000000000000076932702684439582f, 0.00018220426863990724f));
                }
            }

            // Set Detail Mode
            if (material.HasProperty("_DetailMode"))
            {
                if (material.GetInt("_DetailMode") == 0)
                {
                    material.EnableKeyword("TVE_DETAIL_MODE_OFF");
                    material.DisableKeyword("TVE_DETAIL_MODE_OVERLAY");
                    material.DisableKeyword("TVE_DETAIL_MODE_REPLACE");
                }
                else if (material.GetInt("_DetailMode") == 1)
                {
                    material.DisableKeyword("TVE_DETAIL_MODE_OFF");
                    material.EnableKeyword("TVE_DETAIL_MODE_OVERLAY");
                    material.DisableKeyword("TVE_DETAIL_MODE_REPLACE");
                }
                else if (material.GetInt("_DetailMode") == 2)
                {
                    material.DisableKeyword("TVE_DETAIL_MODE_OFF");
                    material.DisableKeyword("TVE_DETAIL_MODE_OVERLAY");
                    material.EnableKeyword("TVE_DETAIL_MODE_REPLACE");
                }
            }

            // Set Detail Type
            if (material.HasProperty("_DetailTypeMode"))
            {
                if (material.GetInt("_DetailTypeMode") == 0)
                {
                    material.EnableKeyword("TVE_DETAIL_TYPE_VERTEX_BLUE");
                    material.DisableKeyword("TVE_DETAIL_TYPE_PROJECTION");
                }
                else
                {
                    material.DisableKeyword("TVE_DETAIL_TYPE_VERTEX_BLUE");
                    material.EnableKeyword("TVE_DETAIL_TYPE_PROJECTION");
                }
            }

            // Set Detail Maps
            if (material.HasProperty("_DetailMapsMode"))
            {
                if (material.GetInt("_DetailMapsMode") == 0)
                {
                    material.EnableKeyword("TVE_DETAIL_MAPS_STANDARD");
                    material.DisableKeyword("TVE_DETAIL_MAPS_PACKED");
                }
                else
                {
                    material.DisableKeyword("TVE_DETAIL_MAPS_STANDARD");
                    material.EnableKeyword("TVE_DETAIL_MAPS_PACKED");
                }
            }

            // Set Batching Mode
            if (material.HasProperty("_VertexDataMode") && material.HasProperty("_VertexMotionMode"))
            {
                int batching = material.GetInt("_VertexDataMode");
                int motion = material.GetInt("_VertexMotionMode");

                if (batching == 0)
                {
                    if (motion == 0)
                    {
                        material.EnableKeyword("TVE_VERTEX_DATA_OBJECT");
                        material.DisableKeyword("TVE_VERTEX_DATA_WORLD");
                        material.DisableKeyword("TVE_VERTEX_DATA_BATCHED");
                        material.SetOverrideTag("DisableBatching", "True");
                    }
                    else
                    {
                        material.DisableKeyword("TVE_VERTEX_DATA_OBJECT");
                        material.EnableKeyword("TVE_VERTEX_DATA_WORLD");
                        material.DisableKeyword("TVE_VERTEX_DATA_BATCHED");
                        material.SetOverrideTag("DisableBatching", "True");
                    }
                }
                else
                {
                    material.DisableKeyword("TVE_VERTEX_DATA_OBJECT");
                    material.DisableKeyword("TVE_VERTEX_DATA_WORLD");
                    material.EnableKeyword("TVE_VERTEX_DATA_BATCHED");
                    material.SetOverrideTag("DisableBatching", "False");
                }
            }

            //Set Pivots Mode
            if (material.HasProperty("_VertexPivotMode"))
            {
                material.SetInt("_vertex_pivot_mode", material.GetInt("_VertexPivotMode"));
            }

            // Enable Nature Rendered support
            material.SetOverrideTag("NatureRendererInstancing", "True");
        }

        public static void DrawMaterialVersion(Material material)
        {
            if (material.HasProperty("_IsVersion"))
            {
                var styleLabel = new GUIStyle(EditorStyles.label)
                {
                    richText = true,
                    alignment = TextAnchor.MiddleLeft,
                };

                var version = material.GetInt("_IsVersion").ToString();
                version = version.Insert(1, ".");
                version = version.Insert(3, ".");

                //Rect lastRect = GUILayoutUtility.GetLastRect();
                //EditorGUI.DrawRect(new Rect(0, lastRect.yMax, 1000, 1), new Color(0, 0, 0, 0.5f));

                //GUILayout.Space(10);

                GUILayout.Label("<color=#7f7f7f><size=9>The current material version is " + version + "  </size></color>", styleLabel);

                GUILayout.Space(10);
            }
        }

        public static void UpgradeMaterialTo200(Material material)
        {
            if (material.shader.name.Contains("Bark Simple Lit"))
            {
                material.shader = Shader.Find("BOXOPHOBIC/The Vegetation Engine/Vegetation/Bark Standard Lit");
            }

            if (material.shader.name.Contains("Cross Simple Lit"))
            {
                material.shader = Shader.Find("BOXOPHOBIC/The Vegetation Engine/Vegetation/Cross Standard Lit");
            }

            if (material.shader.name.Contains("Grass Simple Lit"))
            {
                material.shader = Shader.Find("BOXOPHOBIC/The Vegetation Engine/Vegetation/Grass Standard Lit");
            }

            if (material.shader.name.Contains("Leaf Simple Lit"))
            {
                material.shader = Shader.Find("BOXOPHOBIC/The Vegetation Engine/Vegetation/Leaf Standard Lit");
            }

            if (material.shader.name.Contains("Prop Simple Lit") && material.shader.name.Contains("projection") == false)
            {
                material.shader = Shader.Find("BOXOPHOBIC/The Vegetation Engine/Objects/Prop Standard Lit");
            }

            if (material.shader.name.Contains("Prop Simple Lit") && material.shader.name.Contains("projection") == true)
            {
                material.shader = Shader.Find("BOXOPHOBIC/The Vegetation Engine/Objects/Prop Standard Lit");
                material.SetInt("_DetailTypeMode", 1);
            }

            if (material.shader.name.Contains("Prop Standard Lit") && material.shader.name.Contains("projection") == true)
            {
                material.shader = Shader.Find("BOXOPHOBIC/The Vegetation Engine/Objects/Prop Standard Lit");
                material.SetInt("_DetailTypeMode", 1);
            }

            if (material.HasProperty("_IsVersion"))
            {
                if (material.GetInt("_IsVersion") < 200)
                {
                    if (material.HasProperty("_render_mode"))
                    {
                        material.SetInt("_RenderMode", material.GetInt("_render_mode"));
                    }

                    if (material.HasProperty("_render_cull"))
                    {
                        material.SetInt("_RenderCull", material.GetInt("_render_cull"));
                    }

                    if (material.HasProperty("_render_normals"))
                    {
                        material.SetInt("_RenderNormals", material.GetInt("_render_normals"));
                    }

                    if (material.HasProperty("_render_blend"))
                    {
                        material.SetInt("_RenderBlend", material.GetInt("_render_blend"));
                    }

                    if (material.HasProperty("_render_zw"))
                    {
                        material.SetInt("_RenderZWrite", material.GetInt("_render_zw"));
                    }

                    if (material.HasProperty("_render_clip"))
                    {
                        material.SetInt("_RenderClip", material.GetInt("_render_clip"));
                    }

                    if (material.HasProperty("_render_priority"))
                    {
                        material.SetInt("_RenderPriority", material.GetInt("_render_priority"));
                    }

                    if (material.HasProperty("_material_batching"))
                    {
                        material.SetInt("_VertexDataMode", material.GetInt("_material_batching"));
                    }

                    if (material.HasProperty("_ObjectMetallicValue"))
                    {
                        material.SetFloat("_MainMetallicValue", material.GetFloat("_ObjectMetallicValue"));
                    }

                    if (material.HasProperty("_ObjectSmoothnessValue"))
                    {
                        material.SetFloat("_MainSmoothnessValue", material.GetFloat("_ObjectSmoothnessValue"));
                    }

                    if (material.HasProperty("_ObjectOcclusionValue"))
                    {
                        material.SetFloat("_VertexOcclusionValue", material.GetFloat("_ObjectOcclusionValue") * 0.5f);
                    }

                    if (material.HasProperty("_OverlayContrast"))
                    {
                        material.SetFloat("_OverlayContrastValue", material.GetFloat("_OverlayContrast"));
                    }

                    if (material.HasProperty("_OverlayVariation"))
                    {
                        material.SetFloat("_OverlayVariationValue", material.GetFloat("_OverlayVariation"));
                    }

                    if (material.HasProperty("_MaskMode"))
                    {
                        material.SetFloat("_DetailMaskMode", material.GetFloat("_MaskMode"));
                    }

                    if (material.HasProperty("_MotionAmplitude_30"))
                    {
                        material.SetFloat("_MotionAmplitude_30", material.GetFloat("_MotionAmplitude_30") * 2.0f);
                    }

                    if (material.HasProperty("_MotionAmplitude_32"))
                    {
                        material.SetFloat("_MotionAmplitude_32", material.GetFloat("_MotionAmplitude_32") * 2.0f);
                    }

                    if (material.HasProperty("_SubsurfaceMinValue"))
                    {
                        material.SetFloat("_MainMaskMinValue", material.GetFloat("_SubsurfaceMinValue"));
                    }

                    if (material.HasProperty("_SubsurfaceMaxValue"))
                    {
                        material.SetFloat("_MainMaskMaxValue", material.GetFloat("_SubsurfaceMaxValue"));
                    }

                    if (material.HasProperty("_GrassPerspectivePushValue"))
                    {
                        material.SetFloat("_PerspectivePushValue", material.GetFloat("_GrassPerspectivePushValue"));
                    }

                    if (material.HasProperty("_GrassPerspectiveNoiseValue"))
                    {
                        material.SetFloat("_PerspectiveNoiseValue", material.GetFloat("_GrassPerspectiveNoiseValue"));
                    }

                    if (material.HasProperty("_GrassPerspectiveAngleValue"))
                    {
                        material.SetFloat("_PerspectiveAngleValue", material.GetFloat("_GrassPerspectiveAngleValue"));
                    }

                    material.SetInt("_IsVersion", 200);
                }
            }
        }

        public static void UpgradeElementTo200(Material material)
        {
            if (material.HasProperty("_IsVersion"))
            {
                if (material.GetInt("_IsVersion") < 200)
                {
                    if (material.HasProperty("_WinterColor"))
                    {
                        material.SetColor("_AdditionalColor1", material.GetColor("_WinterColor"));
                    }

                    if (material.HasProperty("_SpringColor"))
                    {
                        material.SetColor("_AdditionalColor2", material.GetColor("_SpringColor"));
                    }

                    if (material.HasProperty("_SummerColor"))
                    {
                        material.SetColor("_AdditionalColor3", material.GetColor("_SummerColor"));
                    }

                    if (material.HasProperty("_AutumnColor"))
                    {
                        material.SetColor("_AdditionalColor4", material.GetColor("_AutumnColor"));
                    }

                    if (material.HasProperty("_WinterValue"))
                    {
                        material.SetFloat("_AdditionalValue1", material.GetFloat("_WinterValue"));
                    }

                    if (material.HasProperty("_SpringValue"))
                    {
                        material.SetFloat("_AdditionalValue2", material.GetFloat("_SpringValue"));
                    }

                    if (material.HasProperty("_SummerValue"))
                    {
                        material.SetFloat("_AdditionalValue3", material.GetFloat("_SummerValue"));
                    }

                    if (material.HasProperty("_AutumnColor"))
                    {
                        material.SetFloat("_AdditionalValue4", material.GetFloat("_AutumnValue"));
                    }

                    material.SetInt("_IsVersion", 200);
                }
            }
        }
    }
}
