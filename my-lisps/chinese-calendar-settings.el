;; -*- Emacs-Lisp -*-

;;; Local Variables: ***
;;; coding: gbk ***
;;; End: ***

;; Time-stamp: <2010-12-29 12:36:53 Wednesday by ssl>

(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)

(defconst cal-china-x-chinese-holidays
  '((holiday-fixed 1 1 "Ԫ��")
    (holiday-lunar 12 30 "����" 0)
    (holiday-lunar 1 1 "����" 0)
    (holiday-lunar 1 2 "����" 0)
    (holiday-solar-term "����" "������")
    (holiday-fixed 5 1 "�Ͷ���")
    (holiday-lunar 5 5 "�����" 0)
    (holiday-lunar 8 15 "�����" 0)
    (holiday-fixed 10 1 "�����")
    (holiday-fixed 10 2 "�����")
    (holiday-fixed 10 3 "�����"))
  "Pre-defined chinese public holidays.
You can add this to your `calendar-holidays'.")

(setq holiday-wwliu-holidays
    '(;;��������
      (holiday-fixed 1 1 "Ԫ��")
      (holiday-fixed 2 14 "���˽�")
      (holiday-fixed 3 8 "��Ů��")
      (holiday-fixed 3 14 "��ɫ���˽�")
      (holiday-fixed 4 1 "���˽�")
      (holiday-fixed 5 1 "�Ͷ���")
      (holiday-float 5 0 2 "ĸ�׽�")
      (holiday-fixed 6 1 "��ͯ��")
      (holiday-float 6 0 3 "���׽�")
      (holiday-fixed 9 10 "��ʦ��")
      (holiday-fixed 10 1 "�����")
      (holiday-fixed 12 25 "ʥ����")
      ;; ũ������
      (holiday-lunar 1 1 "����" 0)
      (holiday-lunar 1 2 "����" 0)
      (holiday-lunar 1 3 "����" 0)
      (holiday-lunar 1 15 "Ԫ����" 0)
      (holiday-solar-term "����" "������")
      (holiday-lunar 5 5 "�����" 0)
      (holiday-lunar 8 15 "�����" 0)
      ;; ���� -- ����,����
      ;; ^_^ �ⲿ����...������
      ))

;; ֻ��ʾ�Ҷ��ƵĽ���
(setq calendar-holidays holiday-wwliu-holidays)
(setq christian-holidays nil) ;; ����ʾ�����̵Ľ���
(setq hebrew-holidays nil)    ;; ����ʾϣ�����˵Ľ���
(setq islamic-holidays nil)   ;; ����ʾ��˹���̵Ľ���

(provide 'chinese-calendar-settings)

