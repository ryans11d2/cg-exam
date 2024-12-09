Shader "Custom/Car"
{
    Properties
    {
        _MainTex ("Main Tex", 2D) = "white" {}
        _BounceX ("BounceX", float) = 1
        _BounceY ("BounceY", float) = 1
        _Speed ("Bounce Speed", float) = 1
        _Amp ("Amplitude", Range(0, 1)) = 1
    }
    SubShader
    {

        Tags {"Queue" = "Transparent"}

        CGPROGRAM

        #pragma surface surf Lambert alpha:fade

        sampler2D _MainTex;
        float _BounceX;
        float _BounceY;
        float _Speed;
        float _Amp;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            _BounceX *= _Time;
            _BounceY *= sin(_Time * _Speed);
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex + float2(_BounceX, _BounceY) * _Amp);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
