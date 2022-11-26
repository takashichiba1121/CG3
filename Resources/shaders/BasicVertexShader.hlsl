#include "BasicShaderHeader.hlsli"

VSOutput main(float4 pos : POSITION)
{
	VSOutput output; // ピクセルシェーダーに渡す値
	output.pos = mul(mat, pos);
	/*output.normal = normal;
	output.uv = uv;*/
	return output;
}