const fs = require('fs');
// T2dPrsResult.tsv をベースに他の tsv サンプルデータを作る
// T2dPrsResult.tsv のデータをヅラしているだけ
// T2dPrsResult.tsv は最後２行テスト用に失敗するデータを入れているので削除してから実行して欲しい
const text = fs.readFileSync("T2dPrsResult.tsv", 'utf-8');
// タブと改行で区切る
const fields = text.toString().split(/\t|\n/);

// 必ず 4 の倍数
const skipFields = 4; // BmiPrsResult.txt
// const skipFields = 8; // 脳梗塞 StrPrsResult.txt
// const skipFields = 12; // 心疾患 HrtPrsResult.txt
// const skipFields = 16; // 肺がん LcPrsResult.txt
// const skipFields = 20; // 乳がん BcPrsResult.txt
// const skipFields = 24; // 大腸がん CcPrsResult.txt
// const skipFields = 28; // 前立腺がん PcPrsResult.txt

let skipNum = 1;

for (let i = 0; i < fields.length; i++) {
  if (i < 4) {
    process.stdout.write(fields[i]);
    if (i < 3) {
      process.stdout.write("\t");
    } else {
      process.stdout.write("\n");
    }
  } else {
    if (i + 1 >= fields.length) {
      break;
    }

    if (i % 4 == 0) {
      process.stdout.write(fields[i]);
      process.stdout.write("\t");
      let fieldKey;
      const firstLineFieldKey = 4;
      const nextLineFieldKey = i + skipFields;
      const nextLineFieldLastKey = nextLineFieldKey + 3;

      if (nextLineFieldLastKey < fields.length) {
        fieldKey = nextLineFieldKey;
      } else {
        fieldKey = firstLineFieldKey * skipNum;
        skipNum++;
      }

      process.stdout.write(fields[fieldKey + 1]);
      process.stdout.write("\t");
      process.stdout.write(fields[fieldKey + 2]);
      process.stdout.write("\t");
      process.stdout.write(fields[fieldKey + 3]);
      process.stdout.write("\n");
    }
  }
}
