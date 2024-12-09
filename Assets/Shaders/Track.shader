Shader "Custom/Track"
{
    Properties
    {
        //_Color ("Colour", Color) = (1,1,1,1)
        //_MainTex ("Texture", 2D) = "white" {}
        //_SCALEUVX("ScaleX", Range(1, 10)) = 1
        //_SCALEUVY("ScaleY", Range(1, 10)) = 1
        _Scale ("Scale", Range(0, 1)) = 1
        _Grid ("Grid", float) = 1
    }
    SubShader
    {
        Pass 
        {

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            //sampler2D _MainTex;
            //float4 _MainTex_ST;
            //float _SCALEUVX;
            //float _SCALEUVY;
            //float4 _Color;
            float _Scale;
            float _Grid;

            struct appdata
            {
                float4 vertex : POSITION;
            };
            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color: COLOR;
                float4 color2: COLOR2;
            };
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color.r = v.vertex.x * _Scale;
                o.color.g = -v.vertex.x * _Scale;
                o.color.b = v.vertex.z * _Scale;

                //o.color.r = (floor(abs(sin(v.vertex.x)) / _Grid) * _Grid) * _Scale;
                //o.color.g = (floor(abs(sin(v.vertex.x)) / _Grid) * _Grid) * _Scale;
                //o.color.b = (floor(abs(sin(v.vertex.x)) / _Grid) * _Grid) * _Scale;

                //o.color.rgb = (floor(sin(v.vertex.x) / _Grid) * _Grid) % 0.1 == 0 ? o.color.rgb : (1, 1, 1);

                o.color2.rgb = (1, 1, 1, 1);
                o.color2.rgb = sin(v.vertex.x * _Grid) > 0 || sin(v.vertex.z * _Grid) > 0 ? o.color2.rgb : o.color.rgb;
                //o.color.rgb = sin(v.vertex.z * _Grid) > 0 ? o.color.rgb : (1, 1, 1);

                return o;
            }
            fixed4 frag (v2f i) : SV_Target 
            {
                fixed4 col = 1 - i.color2;// * tex2D(_MainTex, i.uv);
                
                return col;
            }
            ENDCG

        }
    }
    FallBack "Diffuse"
}
