#include "Particle.hlsli"

static const int vnum = 4;

//�Z���^�[����̃I�t�Z�b�g
static const float4 offset_array[vnum] =
{
	float4(-0.5f,-0.5f,0,0),//����
	float4(-0.5f,+0.5f,0,0),//����
	float4(+0.5f,-0.5f,0,0),//�E��
	float4(+0.5f,+0.5f,0,0)//�E��
};

static const float2 uv_array[vnum] =
{
	float2(0,1),
	float2(0,0),
	float2(1,1),
	float2(1,0),
};

[maxvertexcount(vnum)]
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

	////���݂̃X�g���b�v���I��
	//output.RestartStrip();

	////2�ڂ̎O�p�`
	//for (uint i = 0; i < 3; i++)
	//{
	//	GSOutput element;
	//	element.svpos = input[i].svpos+float4(20.0f,0.0f,0.0f,0.0f);
	//	element.normal = input[i].normal;
	//	//UV��5�{��
	//	element.uv = input[i].uv * 5.0f;
	//	output.Append(element);
	//}
	float4 offset;
	GSOutput element;
	for (uint i = 0; i < vnum; i++)
	{
		//offset = mul(matBillboard, offset_array[i]);
		offset = offset_array[i] * input[0].scale;
		offset = mul(matBillboard, offset);
		element.svpos = input[0].pos + offset;
		//element.svpos = input[0].pos + offset_array[i];
		element.svpos = mul(mat, element.svpos);
		element.uv = uv_array[i];
		element.color = input[0].color;
		output.Append(element);
	}
}

//[maxvertexcount(2)]
//void main(
//	triangle VSOutput input[3]:SV_POSITION,
//	//�����X�g���[��
//	inout LineStream<GSOutput>output
//)
//{
//	GSOutput element;
//
//	//�����̎n�_
//	element.svpos = input[0].svpos;
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	output.Append(element);
//
//	//�����̏I�_
//	element.svpos = input[1].svpos;
//	element.normal = input[1].normal;
//	element.uv = input[1].uv;
//	output.Append(element);
//
//}

////�O�p�`�̓��͂���A�������O�o�͂���T���v��
//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3]:SV_POSITION,
//	inout LineStream<GSOutput>output
//)
//{
//	GSOutput element;
//	//�O�p�`�̒��_1�_������
//	for (uint i = 0; i < 3; i++)
//	{
//		//�����̎n�_
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//		//�����̏I�_
//		if (i == 2) {
//			//+1����ƈ��̂ŁA�ŏ��ɖ߂�
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
//		//���݂̃X�g���b�v���I�����A���̃X�g���b�v���J�n
//		output.RestartStrip();
//	}
//}

//�O�p�`�̓��͂���A������3�o�͂���T���v��
//[maxvertexcount(4)]
//void main(
//	triangle VSOutput input[3]:SV_POSITION,
//	//�����X�g���[��
//	inout LineStream<GSOutput>output
//)
//{
//	GSOutput element;
//
//	for (uint i = 0; i < 3; i++)
//	{
//		//�����̎n�_
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//	}
//	//�����̏I�_
//	element.svpos = input[0].svpos;
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	output.Append(element);
//
//}