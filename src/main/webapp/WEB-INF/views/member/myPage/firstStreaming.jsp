<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<style>
	.modal-dialog{
		width:80%;
		height:70%;
		margin:0;
		padding:0;
	}
	.modal-content{
		height:auto;
		min-height:100%;
	}
	.modal {
  	text-align: center;
	}
	@media screen and (min-width: 768px) { 
	  .modal:before {
	    display: inline-block;
	    vertical-align: middle;
	    content: " ";
	    height: 100%;
	  }
	}
	.modal-dialog {
	  display: inline-block;
	  text-align: left;
	  vertical-align: middle; 
	}
</style>
<body onload="openModal()">
	<c:if test="${empty sessionScope.loginUser}">
		<jsp:forward page="../needLogin.jsp" />
	</c:if>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<!-- Modal -->
	<div class="modal fade" id="contractModal" tabindex="-1" role="dialog"
		aria-labelledby="contractModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="contractModalLabel">스트리밍은 처음이시군요!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="content-body" id="contractArea"
					style="overflow: scroll; height:350px;">
					<p>사용자는 NullLive에서 방송하거나 사전 녹화한 오디오 및 비디오 저작물을 배포할 수 있고, 채팅, 게시판, 포럼 게시물, Wiki 게시물, 대화형 음성 서비스와 같은 서비스를 이용할 수 있으며, NullLive 서비스의 다른 활동에 참여하여 콘텐츠, 메시지, 텍스트, 사운드, 이미지, 응용 프로그램, 코드, 기타 데이터나 자료(이하 “사용자 콘텐츠”)를 제작, 게시, 전송, 수행, 저장할 수 있습니다.

a. NullLive에 라이선스 부여
(i) 사용자와 NullLive의 권한 있는 대리인이 서명하여 동의한 별도의 계약서가 없는 한, NullLive 서비스를 이용하여 제출, 전송, 전시, 공연, 게시, 저장한 사용자 콘텐츠에 대해서는 관련 법률에서 허가하는 최대한의 한도 내에서 최대 기간(관련 법률에서 허용하는 경우 영구적으로) 동안 NullLive 및 2차 라이선스 허가자에게 전 세계에서 무제한적이고, 취소가 불가능하고, 온전한 2차 라이선스 부여가 가능하고, 비독점적이고, 사용료 없이 다음 행위를 할 수 있는 권리를 부여하는 것으로 간주됩니다. (a) 해당 사용자 콘텐츠의 사용, 복제, 수정, 조정, 게시, 번역, 2차 저작물 생성, 배포, 공연 또는 전시(현재 알려져 있거나 추후 개발 또는 발견될 수 있는 모든 양식, 형태, 미디어 또는 미디어 채널을 통해 NullLive 서비스 및 그를 통한 2차 저작물의 전체 또는 일부를 홍보하고 재배포하는 것을 포함하되 이에 국한되지 않음). (b) 해당 사용자 콘텐츠와 관련하여 제출된 이름, 신원 정보, 화상, 음성(또는 기타 생물학적 정보)의 사용. 해당 사용자 콘텐츠에 제3자의 이름, 신원 정보, 화상 및 음성(또는 기타 생물학적 정보)이 포함되어 있는 경우 귀하는 그러한 특징을 사용하는 데 대해 적절한 동의 및/또는 허가를 얻었으며, NullLive 및 2차 라이선스 허가자가 본 서비스 약관에 표시된 한도 내에서 그러한 특징을 사용할 수 있음을 진술하고 보증한 것으로 간주됩니다.

(ii) “애드온”, “지도”, “모드”로 알려진 사용자 콘텐츠 또는 CurseForge.com이나 관련 사이트를 통해 제출된 기타 프로젝트 유형(이하 “제출된 프로젝트”)에 대해 서비스 약관에 따라 사용자에게 부여된 권리는 사용자가 NullLive 서비스에서 그러한 제출된 프로젝트를 제거하거나 삭제하는 즉시 효력이 사라집니다. 또한 사용자는 제거되거나 삭제된 상태의 제출된 프로젝트를 NullLive가 전시, 배포, 공연할 수는 없으나 서버 복사본을 보유할 수 있음을 인정하는 것으로 간주됩니다.

(iii) 방송이나 사전 녹화된 오디오 및 비디오 저작물에 대해 서비스 약관에 따라 사용자가 NullLive에 부여한 권리는 사용자가 NullLive 서비스에서 그러한 사용자 콘텐츠를 삭제하거나 계정을 탈퇴하는 즉시 효력이 사라지지만, 다음과 같은 예외 사항이 적용됩니다. (a) NullLive 서비스의 일부로서 다른 사람에게 사용자 콘텐츠 중 다른 사용자가 개인적인 용도(예: 클립 제작)로 복사하거나 보관하고 있는 사용자 콘텐츠의 일부. (b) NullLive가 홍보 목적으로 사용한 사용자 콘텐츠의 일부. (c) 백업 시스템이나 기타 시스템에서 제거될 때까지 남아 있는 사용자 콘텐츠.

b. 사용자 콘텐츠에 대한 진술 및 보증
사용자 콘텐츠 및 그러한 콘텐츠의 게시와 공개에 따른 결과에 대한 책임은 전적으로 사용자에게 있습니다. 사용자는 다음 내용을 진술하고 보증합니다. (1) 사용자 본인은 사용자 콘텐츠의 제작자이자 소유자이거나 서비스 약관에 언급된 권리를 부여할 수 있는 권리와 권한을 가진 사람임. (2) 사용자 콘텐츠가 현재와 미래에 (a) 제3자의 권리(저작권, 상표, 특허, 영업 비밀, 저작 인격권, 사생활 보호 권리, 초상 보호권, 기타 지적 재산권이나 소유권)를 침해하거나, 위반하거나, 유용하지 않고 (b) 타인의 명예를 훼손하지 않음. (3) 사용자 본인의 사용자 콘텐츠에 바이러스, 애드웨어, 스파이웨어, 웜, 기타 유해하거나 악의적인 코드가 포함되어 있지 않음. (4) 특히 사전에 서면으로 승인받지 않은 한 사용자 콘텐츠에 NullLive 또는 서드파티의 사전 릴리스, 비공개 베타 소프트웨어, 게임 콘텐츠. 기밀 정보가 포함되어 있지 않음. NullLive는 이러한 진술과 보증을 위반하는 사용자를 제재하는 데 필요한 모든 권리와 구제 수단을 행사할 수 있습니다.

c. 콘텐츠를 업로드할 때 사용자가 감수해야 하는 위험
NullLive는 무단 복사 및 배포 행위에 대해 사용자 콘텐츠를 보호하기 위해 합리적인 수준의 보안 수단을 사용합니다. 그러나 NullLive는 서드파티가 사용자 콘텐츠를 무단으로 복사, 사용, 배포하는 일이 발생하지 않을 것이라고 보증하지는 않습니다. 관련 법률에서 허용하는 최대한의 한도 내에서 사용자는 서드파티의 행위로 인한 사용자 콘텐츠의 무단 복사, 사용, 배포에 대해 NullLive가 법적 책임을 지지 않는 데 동의하며, 어떠한 법리로든 그러한 사용자 콘텐츠의 무단 복사나 사용과 관련하여 영구적으로 NullLive에 소송을 제기하지 않을 것임에 동의하는 것으로 간주됩니다. 서비스 약관에 따라 사용자 콘텐츠를 보호하기 위해 NullLive가 사용하는 보안 수단은 "현 상태 그대로" 제공되고 사용되며, 그러한 보안 수단이 보안 메커니즘을 회피하려는 모든 시도를 완전히 방어하거나, 보안 수단을 손상하게 하거나 사용할 수 없게 만드려는 시도 또는 다른 방식으로 보안 메커니즘을 우회하려는 시도를 완전히 막아낼 수 있다고 보증하거나 보장하지는 않습니다.

d. 프로모션
사용자는 NullLive 서비스에서 또는 NullLive 서비스를 활용하여 대회나 경품과 같은 프로모션(이하 “프로모션”)을 홍보, 관리, 실시할 수 있습니다. 프로모션을 홍보, 관리, 실시할 때에는 다음 규칙을 준수해야 합니다. (i) 관련 법률에서 허용하는 한도 내에서 프로모션을 실시해야 하며, 프로모션이 적용 가능한 모든 법률, 의무, 제한 사항을 준수하는지를 확인하는 책임은 전적으로 사용자에게 있습니다. (ii) 사용자는 해당 지역의 법률에 따라 프로모션 주관자로 분류되며, 프로모션과 관련한 모든 내용과 관련 부대 비용에 대한 책임은 전적으로 사용자에게 있습니다. 여기에는 프로모션 실시, 관리, 운영, 공식적 규칙의 초안 작성 및 게시, 승자 선정, 보상 지급, 필요한 모든 서드파티 허가 및 승인의 획득(모든 필수 등록 및 보증 제출을 포함하며 이에 국한되지 않음)이 포함되나 이에 국한되지는 않습니다. NullLive는 사용자가 진행하는 프로모션이 서비스 약관이나 관련 법률을 준수하지 않는 것이 합리적으로 의심되는 경우 NullLive 서비스에서 해당 프로모션을 제거할 권리가 있습니다. (iii) NullLive는 그러한 프로모션에 대한 책임을 지지 않으며 프로모션에 대한 보증 또는 지원을 제공하지 않습니다. NullLive를 프로모션의 스폰서 또는 공동 스폰서로 표시해서는 안 됩니다. (iv) 프로모션이 귀하와 관련이 있는 경우 해당 프로모션에 다음 사항을 표시하거나 음성으로 알려야 합니다. “이 프로모션의 주관자는 [귀하의 이름]입니다. NullLive는 [귀하의 이름] 프로모션을 후원하거나 보증하지 않으며 이 프로모션에 대한 책임을 지지 않습니다.”

e. 홍보 및 추천
사용자는 본인의 사용자 콘텐츠가 FTC의 광고를 통한 제품 홍보와 추천과 관련한 가이드라인, FTC의 .com 공개 가이드, FTC의 네이티브 광고 가이드라인, FTC에서 수시로 발행하는 기타 가이드라인(이하 “FTC 가이드라인”)과 관련 법률에서 요구하는 기타 모든 광고 가이드라인을 준수하는 것에 동의합니다. 예를 들어 NullLive 서비스를 통해 제품이나 서비스를 언급하거나 홍보하는 대가로 금품을 받거나 제품을 무상으로 제공받은 경우, 또는 사용자 본인이 특정 회사의 직원이고 NullLive 서비스를 통해 해당 회사의 제품이나 서비스를 언급하거나 홍보하는 경우에 그러한 특수 관계를 공개해야 한다는 FTC 가이드라인의 지침을 준수하는 데 동의합니다. NullLive 서비스를 통해 제품이나 서비스를 보증하거나 추천할 때에는 그에 대한 책임은 전적으로 사용자에게 있습니다.

9. 금지 행위
사용자는 어떠한 법률, 계약, 지적 재산권, 기타 제3자의 권리를 침해하거나, 불법 행위를 저지르지 않는 데 동의하며, NullLive 서비스에서 행한 행위에 대한 책임은 전적으로 사용자에게 있다는 데 동의합니다.

사용자는 서비스 약관과 NullLive 커뮤니티 가이드라인을 준수하고 다음 행위를 하지 않을 것에 동의합니다.

i. 부정확하거나, 불법적이거나, 타인의 권리를 침해하거나, 타인의 명예를 훼손하거나, 선정적이거나, 외설적이거나, 타인의 사생활이나 초상 보호권을 침해하거나, 괴롭힘, 위협, 학대를 표현하거나, 선동적인 것을 비롯해 기타 불쾌감을 줄 수 있는 콘텐츠를 제작, 업로드, 전송, 배포, 저장하지 않아야 합니다.

ii. 개인이나 법인을 가장하거나, 개인이나 법인과의 제휴를 허위로 주장하거나, 허가 없이 타인의 NullLive 서비스 계정에 접근하거나, 타인의 디지털 서명을 위조하거나, NullLive 서비스를 통해 전송되는 정보의 출처, 신원, 내용을 잘못 표시하거나, 기타 이와 같은 정당하지 않은 행위를 하지 않아야 합니다.

iii. 원치 않는 혜택, 광고, 제안을 제공하거나, NullLive 서비스 사용자를 대상으로 정크 메일이나 스팸 메일(원치 않는 광고, 프로모션 자료 또는 기타 특정 사안을 요구하는 내용의 자료, 상업적 광고의 대량 메일 발송, 연쇄 메일, 정보성 공지, 기부 요청, 서명을 요구하는 청원 또는 프로모션 성격의 경품과 관련된 전술 항목(예: 복권 및 대회)을 포함하나 이에 국한되지 않음)을 발송하는 것을 비롯하여 기타 이와 유사한 활동을 하지 않아야 합니다.

iv. NullLive 서비스에서 다른 사용자의 이메일 주소나 기타 연락처 정보를 수집하지 않아야 합니다.

v. NullLive 서비스 사용자를 비방하거나, 괴롭히거나, 학대하거나, 위협하거나, 사취하는 행위를 하거나 또는 동의 없이 사용자의 개인정보나 제3자 개인정보를 수집하거나 그러한 시도를 하지 않아야 합니다.

vi. NullLive 서비스나 사용자 콘텐츠와 관련된 보안 기능, NullLive 서비스를 통해 접근 가능한 콘텐츠의 사용 또는 복사를 금지하거나 제한하는 기능, NullLive 서비스나 사용자 콘텐츠에 적용된 제한 기능을 제거, 우회, 비활성화, 손상, 기타 다른 방식으로 중단시키지 않겠으며, NullLive 서비스나 사용자 콘텐츠의 저작권이나 기타 소유권을 삭제하는 행위를 하지 않아야 합니다.

vii. 거주 지역의 법률에서 명시적으로 허용된 경우를 제외하고 리버스 엔지니어링, 역컴파일링, 역어셈블링, 기타 다른 방식으로 NullLive 서비스 전체 또는 부분의 소스 코드를 찾으려고 시도하지 않아야 합니다.

viii. 관련 법률에서 명시적으로 허용된 한도 경우를 제외하고 NullLive 서비스 또는 그 일부에 기반을 둔 콘텐츠를 수정, 변조, 번역하거나 2차 저작물을 제작하지 않아야 합니다.

ix. 어떠한 수단으로든 NullLive 서비스 운영 또는 사용자의 NullLive 서비스 이용을 중단시키거나 손해를 끼치는 행위를 하지 않아야 합니다. 전술한 수단에는 바이러스, 애드웨어, 스파이웨어, 웜, 기타 악성 코드를 업로드하거나 다른 방식으로 배포하는 것이 포함되며 이에 국한되지 않습니다.

x. 관련 서드파티의 허가를 받지 않고 서드파티 메일 서버의 이메일을 중계하지 않아야 합니다.

xi. 목적을 불문하고 로봇, 스파이더, 스크레이퍼, 크롤러, 기타 자동화된 방법을 통해 NullLive가 소유하거나, 사용하거나, 라이선스를 부여한 웹사이트, 서버, 소프트웨어 응용 프로그램, 기타 컴퓨터 리소스(NullLive 서비스를 포함하며 이에 국한되지 않음)를 사용하지 않아야 합니다. 또한 NullLive가 소유하거나, 사용하거나, 라이선스를 부여한 웹사이트, 서버, 소프트웨어 응용 프로그램, 기타 컴퓨터 리소스(NullLive 서비스를 포함하며 이에 국한되지 않음)를 사용하지 못하도록 제한한 수단을 우회하려는 시도와 행위를 하지 않아야 합니다.

xii. NullLive 서비스를 통해 전송되는 사용자 콘텐츠의 출처를 속이기 위해 ID를 조작하지 않아야 합니다.

xiii. NullLive 서비스 또는 NullLive 서비스에 연결된 서버나 네트워크를 중단시키거나 방해하거나, NullLive 서비스에 연결된 네트워크의 요건, 절차, 정책, 규정을 준수하지 않거나, NullLive 서비스를 중단시키거나, 방해하거나, 부정적인 영향을 주거나, 다른 사용자의 만족스러운 NullLive 서비스 이용을 방해하는 방식으로 NullLive 서비스를 이용하거나, NullLive 서비스의 기능을 손상시키거나, 비활성화하거나, 과부하를 야기하거나 악화시키는 방식으로 NullLive 서비스 이용하지 않아야 합니다.

xiv. 관련 사용자 및 NullLive로부터 허가를 받지 않고 다른 사용자의 계정을 사용하거나 그러한 시도를 하지 않아야 합니다.

xv. NullLive가 사용하는 콘텐츠 필터링 기술을 우회하려고 시도하거나 사용자에게 접근 권한이 없는 NullLive 서비스의 서비스나 영역에 접근하려고 시도하지 않아야 합니다.

xvi. 목적을 불문하고 어떠한 방식으로든 본인이 NullLive와 관계가 있다고 표방하거나, NullLive가 사용자의 신원이나 제품/서비스를 보증한다고 선전하지 않아야 합니다.

xvii. 불법적인 목적으로 또는 해당 지역, 주, 국가의 법률이나 국제법 또는 규정(지적 재산권이나 기타 소유권, 데이터 보호 및 개인정보 보호를 관리하는 법률을 포함하며 이에 국한되지 않음)을 위반하는 방식으로 NullLive 서비스를 잉용하지 않아야 합니다.

 

NullLive는 사용자 콘텐츠에 대해, 또는 사용자 콘텐츠로 인한 손실이나 손해에 대해 어떠한 책임이나 법적 책임을 지지 않습니다. 또한 NullLive는 사용자가 NullLive 서비스 이용 중에 경험할 수 있는 실수, 비방, 중상, 명예 훼손, 누락, 허위 사실, 음담패설, 비속어에 대해서도 법적 책임을 지지 않습니다. NullLive 서비스 이용에 수반되는 위험을 감수할 책임은 사용자에게 있습니다. 또한 약관에 이렇게 규정하고 있다고 하여 이를 위반한 사용자를 대상으로 민사 소송을 제기할 수 있는 권리가 부여되는 것은 아니며, 규정을 위반하는 콘텐츠가 전혀 없을 것이라고 기대해서는 안 됩니다.

NullLive는 사용자 콘텐츠에 포함된 어떠한 진술이나 내용에 대해서도 법적 책임을 지지 않습니다. NullLive는 어떠한 사용자 콘텐츠 및 해당 사용자 콘텐츠를 통해 표현된 의견, 추천, 조언에 대해 보증하지 않으며, NullLive는 사용자 콘텐츠와 관련된 모든 법적 책임을 명시적으로 부인합니다. 관련 법률에서 허용하는 최대한의 한도 내에서 NullLive는 통지 없이 언제든지 서비스 약관이나 관련 법률을 위반하는 사용자 콘텐츠를 포함하여 NullLive 서비스에 게시되거나 저장된 사용자 콘텐츠를 삭제, 검열, 편집할 수 있는 권리를 보유합니다. NullLive 서비스에 게시하거나 저장한 사용자 콘텐츠의 백업 사본을 만들고 교체하는 책임은 전적으로 사용자에게 있으며 관련 비용은 사용자가 부담해야 합니다. 전술한 내용을 위반하여 NullLive 서비스를 이용하는 경우 서비스 약관을 위반하는 것으로 간주되며, 그로 인해 NullLive 서비스를 이용할 권리가 일시적으로 또는 영구적으로 중지될 수 있습니다.

10. 저작권 존중
NullLive는 타인의 지적 재산을 존중하며 "디지털 밀레니엄 저작권법(이하 “DMCA”) 및 기타 관련 법률에 명시된 요건을 준수합니다. 저작권의 소유자이거나 대리인으로서 저작권을 침해하는 콘텐츠가 NullLive 서비스에 게시된 것으로 의심된다면 NullLive DMCA 가이드라인을 따라 알려주시기 바랍니다. 해당 가이드라인에는 NullLive 정책, 필수 기재 사항, 통지를 보낼 곳에 대해 자세히 안내되어 있습니다.
</p>
<form action="fStream.st" method="post" id="submitForm">
<!-- <input type="text" name="account" placeholder="계좌번호 (-포함)" id="account"/>
<select name="bank_code" id="bank_code">
	<option value="26">신한은행</option>
</select>
<input type="text" name="holder" id="holder" placeholder="예금주"/> -->
</form>
</div>
				<div class="content-footer" align="center">
					<button type="button" class="btn btn-secondary" onclick="cancel();">취소</button>
					<label for="">위 약관을 읽고 이에 동의하면 다음을 누르세요.</label>
					<button type="button" class="btn btn-primary" id="confirmBtn" onclick="next();" disabled="true">다음</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function openModal(){
		 $('#contractModal').modal('show');
	}
	
	function cancel(){
		alert('약관에 동의하시지 않으면 스트리밍 할 수 없습니다!');
		location.href="myPage.me";
	}
	
	$("#contractArea").scroll(function(){
		console.log('scrolling!');
		console.log('scrollTop : '+$(this).scrollTop());
		console.log('innerHeight : '+$(this).innerHeight());
		console.log('scrollHeight : '+$(this)[0].scrollHeight);
		if($(this).scrollTop() + $(this).innerHeight()-15 >= $(this)[0].scrollHeight){
			document.getElementById('confirmBtn').disabled=false;
		}
	});
	
	function next(){
		if($("#account").val() != ""){
			if($("#holder").val() != ""){
				$("#submitForm").submit();				
			}else{
				alert('예금주를 입력해야합니다!');
			}
		}else{
			alert('계좌번호를 입력해야합니다.');
		}
	}
</script>
</html>