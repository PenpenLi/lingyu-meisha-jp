#ifndef _ys_socket_h_
#define _ys_socket_h_

#ifdef WIN32
#include <windows.h>
#include <WinSock.h>
#pragma comment(lib, "wsock32")  
#else
#include <sys/socket.h>
#include <fcntl.h>
#include <errno.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#define SOCKET int
#define SOCKET_ERROR -1
#define INVALID_SOCKET -1
#endif

#include <stdio.h>
#include <string.h>

//��ͷ��8�־ͽ�
#define HEADLEN 8

#define MAX_PKSIZE (16*1024)

//���ջ����С
#define INBUFSIZE	(64*1024)

//���ͻ����С
#define OUTBUFSIZE	(8*1024)

//��Ϊ������socket������ѭ�������ֱ��ʹ��
class ys_socket_t {
public:
	ys_socket_t();
	//����
	bool	connect(const char* ip_, int port_);

	//����
	bool	send(const char* buf_, int size_);
	//ÿһ֡�����Ը��·��ͻ���
	bool	flush();

	//���գ�ÿһ֡�����Խ�������, �������true������ճɹ�������������
	bool	recv(void* buf_, int& size_);

	//�鿴socket�����Ƿ�����
	bool	peek();

	//�鿴�Ƿ����
	bool    has_error(int* err_=NULL);			

	//�رյ�ǰsocket���ͷ�socket��Դ
	void	close();

	//���socket���
	SOCKET	sock() const { return m_sock; }
private:
	bool	recv_i();		

	SOCKET	m_sock;

	char	m_outbuf[OUTBUFSIZE];
	int		m_outbuf_len;

	char	m_inbuf[INBUFSIZE];
	int		m_inbuf_len;
};

#endif
