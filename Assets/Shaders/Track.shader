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

                o.color.r = (floor(v.vertex.x / 4.0) * 4.0) * _Scale;
                o.color.g = (floor(v.vertex.x / 4.0) * 4.0) * _Scale;
                o.color.b = (floor(v.vertex.x / 4.0) * 4.0) * _Scale;

                //o.color.rgb = (floor(v.vertex.x / 4.0) * 4.0) % 16 == 0 ? o.color.rgb : (0, 0, 0);


                return o;
            }
            fixed4 frag (v2f i) : SV_Target 
            {
                fixed4 col = 1 - i.color;// * tex2D(_MainTex, i.uv);
                
                return col;
            }
            ENDCG

        }
    }
    FallBack "Diffuse"
}
