#include "BasicShaderHeader.hlsli"

[maxvertexcount(3)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream<GSOutput>output
)
{
	//for (uint i = 0; i < 3; i++)
	//{
	//	GSOutput element;
	//	element.svpos = input[i].svpos;
	//	element.normal = input[i].normal;
	//	element.uv = input[i].uv;
	//	output.Append(element);
	//}

	////現在のストリップを終了
	//output.RestartStrip();

	////2つ目の三角形
	//for (uint i = 0; i < 3; i++)
	//{
	//	GSOutput element;
	//	element.svpos = input[i].svpos+float4(20.0f,0.0f,0.0f,0.0f);
	//	element.normal = input[i].normal;
	//	//UVを5倍に
	//	element.uv = input[i].uv * 5.0f;
	//	output.Append(element);
	//}

	GSOutput element;
	//頂点情報
	//共通
	element.normal = input[0].normal;
	element.uv = input[0].uv;
	//1点目
	element.svpos = input[0].svpos;
	output.Append(element);
	//2点目
	element.svpos = input[0].svpos + float4(10.0f, 10.0f, 0.0f, 0.0f);
	output.Append(element);
	//3点目
	element.svpos = input[0].svpos + float4(10.0f, 0.0f, 0.0f, 0.0f);
	output.Append(element);
}

//[maxvertexcount(2)]
//void main(
//	triangle VSOutput input[3]:SV_POSITION,
//	//線分ストリーム
//	inout LineStream<GSOutput>output
//)
//{
//	GSOutput element;
//
//	//線分の始点
//	element.svpos = input[0].svpos;
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	output.Append(element);
//
//	//線分の終点
//	element.svpos = input[1].svpos;
//	element.normal = input[1].normal;
//	element.uv = input[1].uv;
//	output.Append(element);
//
//}

////三角形の入力から、線分を三つ出力するサンプル
//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3]:SV_POSITION,
//	inout LineStream<GSOutput>output
//)
//{
//	GSOutput element;
//	//三角形の頂点1点ずつ扱う
//	for (uint i = 0; i < 3; i++)
//	{
//		//線分の始点
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//		//線分の終点
//		if (i == 2) {
//			//+1すると溢れので、最初に戻る
//			element.svpos = input[0].svpos;
//			element.normal = input[0].normal;
//			element.uv = input[0].uv;
//		}
//		else{
//			element.svpos = input[i+1].svpos;
//			element.normal = input[i+1].normal;
//			element.uv = input[i+1].uv;
//		}
//		output.Append(element);
//		//現在のストリップを終了し、次のストリップを開始
//		output.RestartStrip();
//	}
//}

//三角形の入力から、線分を3つ出力するサンプル
//[maxvertexcount(4)]
//void main(
//	triangle VSOutput input[3]:SV_POSITION,
//	//線分ストリーム
//	inout LineStream<GSOutput>output
//)
//{
//	GSOutput element;
//
//	for (uint i = 0; i < 3; i++)
//	{
//		//線分の始点
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//	}
//	//線分の終点
//	element.svpos = input[0].svpos;
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	output.Append(element);
//
//}
