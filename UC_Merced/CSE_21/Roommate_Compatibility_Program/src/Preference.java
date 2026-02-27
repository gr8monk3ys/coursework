
public class Preference {

	int quietTime;
	int music;
	int reading;
	int chatting;

	public Preference(int quietTime, int music, int reading, int chatting) {
		if (0 <= quietTime && quietTime <= 10) {
			this.quietTime = quietTime;
		}
		if (0 <= music && music <= 10) {
			this.music = music;
		}
		if (0 <= reading && reading <= 10) {
			this.reading = reading;
		}
		if (0 <= chatting && chatting <= 10) {
			this.chatting = chatting;
		}
	}

	public int getQuietTime() {
		return quietTime;
	}

	public int getMusic() {
		return music;
	}

	public int getReading() {
		return reading;
	}

	public int getChatting() {
		return chatting;
	}

	public int compare(Preference pref) {
		return (Math.abs(quietTime - pref.quietTime) + Math.abs(chatting - pref.chatting)
				+ Math.abs(reading - pref.reading) + Math.abs(music - pref.music));
	}
}
