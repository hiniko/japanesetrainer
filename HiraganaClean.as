//hiragana.as
//This file will make an array of all hiragana
package{
	public class HiraganaClean{
		
		private var hiraganaClean:XML
		
		public function HiraganaClean(){
			
			hiraganaClean = 
<characters>
	<charSet name="Hiragana" />
	<group name="v">
		<symbol sign="あ" romanji="a" />
		<symbol sign="い" romanji="i" />
		<symbol sign="う" romanji="u" />
		<symbol sign="え" romanji="e" />
		<symbol sign="お" romanji="o" />
	</group>
	<group name="k">
		<symbol sign="か" romanji="ka" />
		<symbol sign="き" romanji="ki" />
		<symbol sign="く" romanji="ku" />
		<symbol sign="け" romanji="ke" />
		<symbol sign="こ" romanji="ko" />
	</group>
	<group name="s">
		<symbol sign="さ" romanji="sa" />
		<symbol sign="し" romanji="shi" />
		<symbol sign="す" romanji="su" />
		<symbol sign="せ" romanji="se" />
		<symbol sign="そ" romanji="so" />
	</group>
	<group name="t">
		<symbol sign="た" romanji="ta" />
		<symbol sign="ち" romanji="chi" />
		<symbol sign="つ" romanji="tsu" />
		<symbol sign="て" romanji="te" />
		<symbol sign="と" romanji="to" />
	</group>
	<group name="n">
		<symbol sign="な" romanji="na" />
		<symbol sign="に" romanji="ni" />
		<symbol sign="ぬ" romanji="nu" />
		<symbol sign="ね" romanji="ne" />
		<symbol sign="の" romanji="no" />
	</group>
	<group name="h">
		<symbol sign="は" romanji="ha" />
		<symbol sign="ひ" romanji="hi" />
		<symbol sign="ふ" romanji="fu" />
		<symbol sign="へ" romanji="he" />
		<symbol sign="ほ" romanji="ho" />
	</group>
	<group name="m">
		<symbol sign="ま" romanji="ma" />
		<symbol sign="み" romanji="mi" />
		<symbol sign="む" romanji="mu" />
		<symbol sign="め" romanji="me" />
		<symbol sign="も" romanji="mo" />
	</group>
	<group name="y">
		<symbol sign="や" romanji="ya" />
		<symbol sign="ゆ" romanji="yu" />
		<symbol sign="よ" romanji="yo" />
	</group>
	<group name="r">
		<symbol sign="ら" romanji="ra" />
		<symbol sign="り" romanji="ri" />
		<symbol sign="る" romanji="ru" />
		<symbol sign="れ" romanji="re" />
		<symbol sign="ろ" romanji="ro" />
	</group>
	<group name="w">
		<symbol sign="わ" romanji="wa" />
		<symbol sign="を" romanji="wo" />
	</group>
	<group name="singles">
		<symbol sign="ん" romanji="n" />
	</group>
	<group name="g">
		<symbol sign="が" romanji="ga" />
		<symbol sign="ぎ" romanji="gi" />
		<symbol sign="ぐ" romanji="gu" />
		<symbol sign="げ" romanji="ge" />
		<symbol sign="ご" romanji="go" />
	</group>
	<group name="z">
		<symbol sign="ざ" romanji="za" />
		<symbol sign="じ" romanji="ji" />
		<symbol sign="ず" romanji="zu" />
		<symbol sign="ぜ" romanji="ze" />
		<symbol sign="ぞ" romanji="zo" />
	</group>
	<group name="d">
		<symbol sign="だ" romanji="da" />
		<symbol sign="ぢ" romanji="ji" />
		<symbol sign="づ" romanji="zu" />
		<symbol sign="で" romanji="de" />
		<symbol sign="ど" romanji="do" />
	</group>
	<group name="b">
		<symbol sign="ば" romanji="ba" />
		<symbol sign="び" romanji="bi" />
		<symbol sign="ぶ" romanji="bu" />
		<symbol sign="べ" romanji="be" />
		<symbol sign="ぼ" romanji="bo" />
	</group>
	<group name="p">
		<symbol sign="ぱ" romanji="pa" />
		<symbol sign="ぴ" romanji="pi" />
		<symbol sign="ぷ" romanji="pu" />
		<symbol sign="ぺ" romanji="pe" />
		<symbol sign="ぽ" romanji="po" />
	</group>
	<group name="ky">
		<symbol sign="きゃ" romanji="kya" />
		<symbol sign="きゅ" romanji="kyu" />
		<symbol sign="きょ" romanji="kyo" />
	</group>
	<group name="sh">
		<symbol sign="しゃ" romanji="sha" />
		<symbol sign="しゅ" romanji="shu" />
		<symbol sign="しょ" romanji="sho" />
	</group>
	<group name="ch">
		<symbol sign="ちゃ" romanji="cha" />
		<symbol sign="ちゅ" romanji="chu" />
		<symbol sign="ちょ" romanji="cho" />
	</group>
	<group name="ny">
		<symbol sign="ちゃ" romanji="nya" />
		<symbol sign="ちゅ" romanji="nyu" />
		<symbol sign="ちょ" romanji="nyo" />
	</group>
	<group name="hy">
		<symbol sign="ひゃ" romanji="hya" />
		<symbol sign="ひゅ" romanji="hyu" />
		<symbol sign="ひょ" romanji="hyo" />
	</group>
	<group name="my">
		<symbol sign="みゃ" romanji="mya" />
		<symbol sign="みゅ" romanji="myu" />
		<symbol sign="みょ" romanji="myo" />
	</group>
	<group name="ry">
		<symbol sign="りゃ" romanji="rya" />
		<symbol sign="りゅ" romanji="ryu" />
		<symbol sign="りょ" romanji="ryo" />
	</group>
	<group name="gy">
		<symbol sign="ぎゃ" romanji="gya" />
		<symbol sign="ぎゅ" romanji="gyu" />
		<symbol sign="ぎょ" romanji="gyo" />
	</group>
	<group name="j">
		<symbol sign="じゃ" romanji="ja" />
		<symbol sign="じゅ" romanji="ju" />
		<symbol sign="じょ" romanji="jo" />
	</group>
	<group name="dy">
		<symbol sign="ぢゃ" romanji="ja" />
		<symbol sign="ぢゅ" romanji="ju" />
		<symbol sign="ぢょ" romanji="jo" />
	</group>
	<group name="by">
		<symbol sign="びゃ" romanji="bya" />
		<symbol sign="びゅ" romanji="byu" />
		<symbol sign="びょ" romanji="byo" />
	</group>
	<group name="py">
		<symbol sign="ぴゃ" romanji="pya" />
		<symbol sign="ぴゅ" romanji="pyu" />
		<symbol sign="ぴょ" romanji="pyo" />
	</group>
</characters>;

		}
		
		public function getHiragana(){
			return hiraganaClean;
		}
	}	
}